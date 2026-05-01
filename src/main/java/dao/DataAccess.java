package dao;

import java.util.List;

import dto.JobApplication;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class DataAccess {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("devu");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();
	
	public void saveJob(JobApplication job) {
		et.begin();
		em.persist(job);
		et.commit();
//		em.close();
	}
	
	public List<JobApplication> getAllJobs(){
		List<JobApplication> list = em.createQuery("FROM JobApplication", JobApplication.class).getResultList();
//		em.close();
		return list;
	}
	
	public void deleteJob(String company_name) {
		et.begin();
		JobApplication application = em.find(JobApplication.class, company_name);
		if(application!=null) {
			em.remove(application);
		}
		et.commit();
	}
}
