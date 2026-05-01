package dto;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class JobApplication {

    @Id
    private String company_name;

    @Column
    private String role;

    @Column(name = "Apply_date")   // keeps DB column name, fixes Java naming
    private String applyDate;

    @Column
    private String status;

    @Column
    private String job_description;

    @Column
    private String application_type;

    public String getCompany_name() { return company_name; }
    public void setCompany_name(String company_name) { this.company_name = company_name; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    // getter is now getApplyDate() → JSP uses ${app.applyDate}
    public String getApplyDate() { return applyDate; }
    public void setApplyDate(String applyDate) { this.applyDate = applyDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getJob_description() { return job_description; }
    public void setJob_description(String job_description) { this.job_description = job_description; }

    public String getApplication_type() { return application_type; }
    public void setApplication_type(String application_type) { this.application_type = application_type; }
}