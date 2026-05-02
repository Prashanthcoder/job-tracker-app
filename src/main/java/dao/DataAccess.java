package dao;

import java.util.List;

import dto.JobApplication;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DataAccess {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("devu");
    EntityManager em = emf.createEntityManager();

    // ── INSERT new job application ──
    public void saveJob(JobApplication job) {
        em.getTransaction().begin();
        em.persist(job);
        em.getTransaction().commit();
    }

    // ── SELECT all ──
    public List<JobApplication> getAllJobs() {
        return em.createQuery("FROM JobApplication ORDER BY applyDate DESC", JobApplication.class)
                 .getResultList();
    }

    // ── DELETE by company_name (primary key) ──
    public void deleteJob(String company_name) {
        em.getTransaction().begin();
        JobApplication app = em.find(JobApplication.class, company_name);
        if (app != null) {
            em.remove(app);
        }
        em.getTransaction().commit();
    }

    // ── SELECT one by company_name (for edit form pre-fill) ──
    public JobApplication findById(String company_name) {
        return em.find(JobApplication.class, company_name);
    }

    // ── UPDATE existing record ──
    // We delete old + persist updated because company_name is the PK
    // If user changed company_name we need to handle that too
    public void updateJob(JobApplication updated, String originalCompany) {
        em.getTransaction().begin();

        // If company name changed — remove old record, save new
        if (!originalCompany.equals(updated.getCompany_name())) {
            JobApplication old = em.find(JobApplication.class, originalCompany);
            if (old != null) em.remove(old);
            em.flush(); // flush removal before insert
            em.persist(updated);
        } else {
            // Same PK — just merge
            em.merge(updated);
        }

        em.getTransaction().commit();
    }
}