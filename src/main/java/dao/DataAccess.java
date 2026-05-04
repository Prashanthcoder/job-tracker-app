package dao;

import java.util.List;
import dto.JobApplication;
import jakarta.persistence.*;

public class DataAccess {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("devu");
    EntityManager em = emf.createEntityManager();

    public void saveJob(JobApplication job) {
        em.getTransaction().begin();
        em.persist(job);
        em.getTransaction().commit();
    }

    public List<JobApplication> getAllJobs() {
        return em.createQuery("FROM JobApplication ORDER BY applyDate DESC", JobApplication.class)
                 .getResultList();
    }

    public void deleteJob(Long id) {
        em.getTransaction().begin();
        JobApplication app = em.find(JobApplication.class, id);
        if (app != null) em.remove(app);
        em.getTransaction().commit();
    }

    public JobApplication findById(Long id) {
        return em.find(JobApplication.class, id);
    }

    public void updateJob(JobApplication updated) {
        em.getTransaction().begin();
        em.merge(updated);
        em.getTransaction().commit();
    }
}