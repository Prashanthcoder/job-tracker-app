<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>JobTrack Pro — Career Command Center</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
/* ══════════════════════════════════════════
   DESIGN TOKENS
══════════════════════════════════════════ */
:root {
  --ink:      #0d0d0d;
  --paper:    #f5f0e8;
  --cream:    #ede8dc;
  --accent:   #e8401c;
  --blue:     #2563eb;
  --gold:     #c9a84c;
  --muted:    #8a8070;
  --white:    #ffffff;
  --border:   #d8d0c0;
  --success:  #16a34a;
  --warning:  #d97706;
  --danger:   #dc2626;
  --ai-bg:    #0f172a;
  --ai-accent:#6366f1;
}
*{margin:0;padding:0;box-sizing:border-box;}
body{font-family:'DM Sans',sans-serif;background:var(--paper);color:var(--ink);min-height:100vh;overflow-x:hidden;}

/* noise overlay */
body::before{content:'';position:fixed;inset:0;
  background-image:url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
  pointer-events:none;z-index:0;opacity:.5;}

/* ══ HEADER ══ */
header{position:relative;z-index:100;background:var(--ink);color:var(--paper);
  padding:0 48px;display:flex;align-items:center;justify-content:space-between;
  height:68px;border-bottom:3px solid var(--accent);}
.logo{font-family:'Syne',sans-serif;font-weight:800;font-size:1.5rem;
  letter-spacing:-.03em;display:flex;align-items:center;gap:10px;}
.logo-dot{width:9px;height:9px;background:var(--accent);border-radius:50%;
  animation:pulse 2s ease-in-out infinite;}
@keyframes pulse{0%,100%{transform:scale(1);}50%{transform:scale(1.5);opacity:.6;}}
.header-right{display:flex;align-items:center;gap:12px;}
.header-tag{font-size:.7rem;letter-spacing:.15em;text-transform:uppercase;
  color:#555;border:1px solid #333;padding:4px 12px;border-radius:20px;}

/* ══ HERO ══ */
.hero{position:relative;background:var(--ink);color:var(--paper);
  padding:52px 48px 44px;overflow:hidden;}
.hero::after{content:'';position:absolute;right:-60px;top:-60px;
  width:380px;height:380px;border:70px solid var(--accent);border-radius:50%;opacity:.07;}
.hero::before{content:'';position:absolute;right:180px;bottom:-50px;
  width:180px;height:180px;border:35px solid var(--gold);border-radius:50%;opacity:.1;}
.hero-eyebrow{font-size:.68rem;letter-spacing:.25em;text-transform:uppercase;
  color:var(--accent);font-weight:500;margin-bottom:12px;}
.hero-title{font-family:'Syne',sans-serif;font-size:clamp(2.2rem,4.5vw,3.6rem);
  font-weight:800;line-height:1.0;letter-spacing:-.04em;margin-bottom:14px;}
.hero-title span{color:var(--accent);}
.hero-sub{font-size:.95rem;color:#888;font-weight:300;max-width:400px;line-height:1.6;}
.stats-row{display:flex;gap:28px;margin-top:32px;flex-wrap:wrap;}
.stat{display:flex;flex-direction:column;}
.stat-num{font-family:'Syne',sans-serif;font-size:1.7rem;font-weight:800;
  color:var(--white);letter-spacing:-.04em;}
.stat-label{font-size:.65rem;letter-spacing:.1em;text-transform:uppercase;color:#555;margin-top:2px;}
.stat-divider{width:1px;background:#2a2a2a;align-self:stretch;}

/* ══ TABS NAV ══ */
.tabs-nav{position:relative;z-index:1;background:var(--cream);
  border-bottom:1.5px solid var(--border);display:flex;padding:0 48px;gap:0;}
.tab-btn{font-family:'DM Sans',sans-serif;font-size:.8rem;font-weight:500;
  letter-spacing:.05em;text-transform:uppercase;padding:14px 20px;
  background:transparent;border:none;border-bottom:2px solid transparent;
  color:var(--muted);cursor:pointer;transition:all .2s;margin-bottom:-1.5px;}
.tab-btn:hover{color:var(--ink);}
.tab-btn.active{color:var(--ink);border-bottom-color:var(--accent);font-weight:600;}

/* ══ MAIN ══ */
main{position:relative;z-index:1;max-width:1280px;margin:0 auto;padding:40px 32px 80px;}

/* tab panels */
.tab-panel{display:none;}
.tab-panel.active{display:block;}

/* section label */
.section-label{display:flex;align-items:center;gap:12px;margin-bottom:20px;}
.section-label-line{flex:1;height:1px;background:var(--border);}
.section-label-text{font-family:'Syne',sans-serif;font-size:.62rem;
  letter-spacing:.25em;text-transform:uppercase;color:var(--muted);white-space:nowrap;}

/* ══ FORM CARD ══ */
.form-card{background:var(--white);border:1.5px solid var(--border);
  border-radius:16px;overflow:hidden;margin-bottom:48px;
  box-shadow:0 4px 32px rgba(0,0,0,.05);animation:slideUp .4s ease both;}
@keyframes slideUp{from{opacity:0;transform:translateY(16px);}to{opacity:1;transform:translateY(0);}}
.form-card-header{background:var(--ink);color:var(--paper);padding:18px 26px;
  display:flex;align-items:center;justify-content:space-between;}
.form-card-title{font-family:'Syne',sans-serif;font-size:.95rem;font-weight:700;}
.form-card-badge{font-size:.62rem;letter-spacing:.12em;text-transform:uppercase;
  background:var(--accent);color:white;padding:4px 10px;border-radius:20px;}
.form-body{padding:26px;display:grid;grid-template-columns:1fr 1fr;gap:18px;}
.form-group{display:flex;flex-direction:column;gap:6px;}
.form-group.full{grid-column:1/-1;}
label{font-size:.7rem;font-weight:500;letter-spacing:.08em;text-transform:uppercase;color:var(--muted);}
input,select,textarea{font-family:'DM Sans',sans-serif;font-size:.92rem;
  padding:10px 13px;border:1.5px solid var(--border);border-radius:8px;
  background:var(--paper);color:var(--ink);transition:border-color .2s,box-shadow .2s;outline:none;width:100%;}
input:focus,select:focus,textarea:focus{border-color:var(--accent);background:var(--white);
  box-shadow:0 0 0 3px rgba(232,64,28,.08);}
textarea{resize:vertical;min-height:75px;}

/* file input */
.file-input-wrapper{position:relative;}
input[type="file"]{padding:7px 13px;background:var(--paper);cursor:pointer;font-size:.82rem;}
input[type="file"]::-webkit-file-upload-button{
  font-family:'DM Sans',sans-serif;font-size:.78rem;padding:5px 12px;
  background:var(--ink);color:var(--paper);border:none;border-radius:5px;cursor:pointer;margin-right:10px;}

.btn-submit{grid-column:1/-1;font-family:'Syne',sans-serif;font-size:.85rem;font-weight:700;
  letter-spacing:.05em;text-transform:uppercase;background:var(--accent);color:white;
  border:none;border-radius:8px;padding:13px 28px;cursor:pointer;
  transition:transform .15s,box-shadow .15s,background .15s;
  display:flex;align-items:center;justify-content:center;gap:8px;}
.btn-submit:hover{background:#c93518;transform:translateY(-2px);box-shadow:0 8px 24px rgba(232,64,28,.28);}
.btn-submit:active{transform:translateY(0);}

/* ══ TABLE ══ */
.table-card{background:var(--white);border:1.5px solid var(--border);border-radius:16px;
  overflow:hidden;box-shadow:0 4px 32px rgba(0,0,0,.05);animation:slideUp .4s .08s ease both;}
.table-card-header{padding:16px 22px;border-bottom:1px solid var(--border);
  display:flex;align-items:center;justify-content:space-between;gap:12px;flex-wrap:wrap;}
.table-card-title{font-family:'Syne',sans-serif;font-size:.9rem;font-weight:700;}
.table-controls{display:flex;gap:8px;align-items:center;flex-wrap:wrap;}
.search-input{font-family:'DM Sans',sans-serif;font-size:.8rem;padding:6px 12px;
  border:1.5px solid var(--border);border-radius:20px;background:var(--paper);outline:none;width:180px;}
.search-input:focus{border-color:var(--accent);}
.filter-btn{font-size:.72rem;font-weight:500;padding:5px 13px;border-radius:20px;
  border:1.5px solid var(--border);background:transparent;color:var(--muted);cursor:pointer;transition:all .15s;}
.filter-btn:hover,.filter-btn.active{border-color:var(--ink);background:var(--ink);color:var(--paper);}
.table-count{font-size:.72rem;color:var(--muted);background:var(--cream);
  padding:4px 12px;border-radius:20px;border:1px solid var(--border);}
table{width:100%;border-collapse:collapse;}
thead{background:var(--cream);}
th{font-size:.62rem;font-weight:500;letter-spacing:.15em;text-transform:uppercase;
  color:var(--muted);padding:11px 18px;text-align:left;border-bottom:1px solid var(--border);}
td{padding:14px 18px;border-bottom:1px solid var(--border);font-size:.88rem;vertical-align:middle;}
tbody tr{transition:background .12s;}
tbody tr:last-child td{border-bottom:none;}
tbody tr:hover{background:var(--paper);}
.company-cell{display:flex;align-items:center;gap:11px;}
.company-avatar{width:34px;height:34px;border-radius:8px;background:var(--ink);color:var(--paper);
  display:flex;align-items:center;justify-content:center;font-family:'Syne',sans-serif;
  font-weight:800;font-size:.8rem;flex-shrink:0;}
.av-A,.av-B,.av-C{background:#1e3a5f;} .av-D,.av-E,.av-F{background:#7c2d12;}
.av-G,.av-H,.av-I{background:#064e3b;} .av-J,.av-K,.av-L{background:#3b0764;}
.av-M,.av-N,.av-O{background:#78350f;} .av-P,.av-Q,.av-R{background:#1e1b4b;}
.av-S,.av-T,.av-U{background:#4a044e;} .av-V,.av-W,.av-X{background:#0c4a6e;}
.av-Y,.av-Z{background:#14532d;}
.company-name{font-weight:500;}
.badge{display:inline-flex;align-items:center;gap:5px;font-size:.7rem;font-weight:500;
  letter-spacing:.05em;padding:3px 9px;border-radius:20px;text-transform:uppercase;}
.badge::before{content:'';width:5px;height:5px;border-radius:50%;background:currentColor;flex-shrink:0;}
.badge-Applied{background:#dbeafe;color:var(--blue);}
.badge-Interview{background:#fef3c7;color:var(--warning);}
.badge-Offer{background:#dcfce7;color:var(--success);}
.badge-Rejected{background:#fee2e2;color:var(--danger);}
.chip{font-size:.7rem;color:var(--muted);background:var(--cream);
  border:1px solid var(--border);padding:3px 9px;border-radius:20px;}
.desc-cell{max-width:180px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;
  color:var(--muted);font-size:.82rem;}
.action-cell{display:flex;gap:5px;flex-wrap:wrap;}
.btn-sm{font-family:'DM Sans',sans-serif;font-size:.72rem;font-weight:500;
  background:transparent;border:1.5px solid var(--border);border-radius:6px;
  padding:5px 11px;cursor:pointer;transition:all .15s;white-space:nowrap;color:var(--muted);}
.btn-edit:hover{background:#dbeafe;border-color:var(--blue);color:var(--blue);}
.btn-delete:hover{background:#fee2e2;border-color:var(--danger);color:var(--danger);}
.btn-ai:hover{background:#ede9fe;border-color:var(--ai-accent);color:var(--ai-accent);}
.btn-ats:hover{background:#dcfce7;border-color:var(--success);color:var(--success);}
.resume-link{font-size:.72rem;color:var(--blue);text-decoration:none;display:inline-flex;align-items:center;gap:4px;}
.resume-link:hover{text-decoration:underline;}

/* empty state */
.empty-state{padding:72px 32px;text-align:center;}
.empty-icon{font-size:2.8rem;margin-bottom:14px;opacity:.35;}
.empty-title{font-family:'Syne',sans-serif;font-size:1.05rem;font-weight:700;margin-bottom:7px;}
.empty-sub{font-size:.85rem;color:var(--muted);}

/* ══ AI INSIGHTS PANEL ══ */
.ai-panel{background:var(--ai-bg);border:1.5px solid #1e293b;border-radius:16px;
  overflow:hidden;margin-bottom:32px;animation:slideUp .4s ease both;}
.ai-panel-header{padding:16px 22px;background:#0f172a;border-bottom:1px solid #1e293b;
  display:flex;align-items:center;justify-content:space-between;}
.ai-panel-title{font-family:'Syne',sans-serif;font-size:.9rem;font-weight:700;
  color:white;display:flex;align-items:center;gap:8px;}
.ai-panel-title span{font-size:1rem;}
.ai-badge{font-size:.62rem;letter-spacing:.1em;text-transform:uppercase;
  background:var(--ai-accent);color:white;padding:3px 9px;border-radius:20px;}
.ai-company-label{font-size:.72rem;color:#6366f1;letter-spacing:.05em;
  text-transform:uppercase;font-weight:500;}
.ai-body{padding:22px;color:#cbd5e1;font-size:.88rem;line-height:1.8;white-space:pre-wrap;}

/* ══ ATS PANEL ══ */
.ats-panel{background:var(--white);border:1.5px solid var(--border);border-radius:16px;
  overflow:hidden;margin-bottom:32px;animation:slideUp .4s ease both;}
.ats-header{padding:16px 22px;background:var(--ink);border-bottom:1px solid #222;
  display:flex;align-items:center;justify-content:space-between;}
.ats-title{font-family:'Syne',sans-serif;font-size:.9rem;font-weight:700;
  color:var(--paper);display:flex;align-items:center;gap:8px;}
.ats-body{padding:22px;}
.ats-score-row{display:flex;align-items:center;gap:20px;margin-bottom:20px;flex-wrap:wrap;}
.ats-score-circle{width:80px;height:80px;border-radius:50%;border:4px solid var(--success);
  display:flex;align-items:center;justify-content:center;flex-direction:column;flex-shrink:0;}
.ats-score-num{font-family:'Syne',sans-serif;font-size:1.4rem;font-weight:800;color:var(--success);}
.ats-score-label{font-size:.55rem;letter-spacing:.08em;text-transform:uppercase;color:var(--muted);}
.ats-details{flex:1;}
.ats-row{margin-bottom:10px;}
.ats-row-label{font-size:.68rem;letter-spacing:.1em;text-transform:uppercase;
  color:var(--muted);font-weight:500;margin-bottom:4px;}
.ats-row-value{font-size:.88rem;color:var(--ink);line-height:1.5;}
.keyword-chip{display:inline-block;font-size:.7rem;padding:2px 9px;border-radius:12px;
  margin:2px;border:1px solid;}
.kw-match{background:#dcfce7;color:var(--success);border-color:#86efac;}
.kw-miss{background:#fee2e2;color:var(--danger);border-color:#fca5a5;}
.ats-tip{background:var(--cream);border-left:3px solid var(--gold);padding:10px 14px;
  border-radius:0 6px 6px 0;font-size:.85rem;color:var(--ink);margin-top:12px;line-height:1.6;}

/* ══ MODAL ══ */
.modal-backdrop{display:none;position:fixed;inset:0;background:rgba(0,0,0,.55);
  z-index:500;align-items:center;justify-content:center;padding:20px;}
.modal-backdrop.open{display:flex;}
.modal{background:var(--white);border-radius:16px;width:100%;max-width:640px;
  max-height:90vh;overflow-y:auto;box-shadow:0 24px 80px rgba(0,0,0,.25);animation:modalIn .25s ease;}
@keyframes modalIn{from{opacity:0;transform:scale(.95);}to{opacity:1;transform:scale(1);}}
.modal-header{background:var(--ink);color:var(--paper);padding:18px 24px;
  display:flex;align-items:center;justify-content:space-between;
  position:sticky;top:0;z-index:1;}
.modal-title{font-family:'Syne',sans-serif;font-size:1rem;font-weight:700;}
.modal-close{background:transparent;border:none;color:var(--paper);
  font-size:1.4rem;cursor:pointer;opacity:.6;transition:opacity .15s;line-height:1;}
.modal-close:hover{opacity:1;}
.modal-body{padding:24px;display:grid;grid-template-columns:1fr 1fr;gap:16px;}
.modal-body .form-group.full{grid-column:1/-1;}

/* ══ ATS SCORER TAB FORM ══ */
.ats-form-card{background:var(--white);border:1.5px solid var(--border);
  border-radius:16px;overflow:hidden;margin-bottom:32px;
  box-shadow:0 4px 32px rgba(0,0,0,.05);}
.ats-form-header{background:linear-gradient(135deg,#0f172a,#1e293b);
  color:white;padding:18px 26px;display:flex;align-items:center;gap:12px;}
.ats-form-title{font-family:'Syne',sans-serif;font-size:.95rem;font-weight:700;}
.ats-form-subtitle{font-size:.75rem;color:#94a3b8;margin-top:2px;}
.ats-form-body{padding:26px;display:grid;grid-template-columns:1fr 1fr;gap:18px;}

/* ══ FOOTER ══ */
footer{text-align:center;padding:22px;font-size:.72rem;color:var(--muted);
  border-top:1px solid var(--border);letter-spacing:.05em;}

/* ══ LOADING SPINNER ══ */
.spinner{display:none;width:18px;height:18px;border:2px solid rgba(255,255,255,.3);
  border-top-color:white;border-radius:50%;animation:spin .7s linear infinite;}
@keyframes spin{to{transform:rotate(360deg);}}

/* ══ RESPONSIVE ══ */
@media(max-width:768px){
  header{padding:0 20px;}
  .hero{padding:36px 20px 30px;}
  main{padding:28px 16px 60px;}
  .form-body,.modal-body,.ats-form-body{grid-template-columns:1fr;}
  .form-group.full,.modal-body .form-group.full{grid-column:1;}
  .btn-submit{grid-column:1;}
  .tabs-nav{padding:0 16px;}
  table{font-size:.8rem;}
  th,td{padding:10px 12px;}
}
</style>
</head>
<body>

<!-- ══ HEADER ══ -->
<header>
  <div class="logo"><span class="logo-dot"></span>JobTrack Pro</div>
  <div class="header-right">
    <span class="header-tag">Career Command Center</span>
  </div>
</header>

<!-- ══ HERO ══ -->
<div class="hero">
  <div class="hero-eyebrow">▸ AI-Powered Job Hunt Tracker</div>
  <h1 class="hero-title">Track Every Opportunity,<br><span>Land the Job.</span></h1>
  <p class="hero-sub">Log applications, score your resume against JDs, and get AI-powered career coaching — all in one place.</p>
  <div class="stats-row">
    <div class="stat">
      <span class="stat-num" id="totalCount">0</span>
      <span class="stat-label">Applied</span>
    </div>
    <div class="stat-divider"></div>
    <div class="stat">
      <span class="stat-num" id="interviewCount">0</span>
      <span class="stat-label">Interviews</span>
    </div>
    <div class="stat-divider"></div>
    <div class="stat">
      <span class="stat-num" id="offerCount">0</span>
      <span class="stat-label">Offers</span>
    </div>
    <div class="stat-divider"></div>
    <div class="stat">
      <span class="stat-num" id="rejectedCount">0</span>
      <span class="stat-label">Rejected</span>
    </div>
  </div>
</div>

<!-- ══ TABS ══ -->
<nav class="tabs-nav">
  <button class="tab-btn active" onclick="switchTab('applications',this)">📋 Applications</button>
  <button class="tab-btn" onclick="switchTab('ats',this)">🎯 ATS Scorer</button>
</nav>

<!-- ══ MAIN ══ -->
<main>

<!-- ════════════════════
     TAB 1: APPLICATIONS
════════════════════ -->
<div class="tab-panel active" id="tab-applications">

  <!-- AI Insight Result -->
  <c:if test="${not empty aiInsight}">
    <div class="ai-panel">
      <div class="ai-panel-header">
        <div class="ai-panel-title"><span>🤖</span> AI Career Insights</div>
        <div>
          <span class="ai-company-label">${aiCompany}</span>
          <span class="ai-badge">Claude AI</span>
        </div>
      </div>
      <div class="ai-body">${aiInsight}</div>
    </div>
  </c:if>

  <!-- ADD FORM -->
  <div class="section-label">
    <span class="section-label-text">New Application</span>
    <div class="section-label-line"></div>
  </div>

  <div class="form-card">
    <div class="form-card-header">
      <span class="form-card-title">Add Job Application</span>
      <span class="form-card-badge">New Entry</span>
    </div>
    <!-- enctype="multipart/form-data" is REQUIRED for file upload -->
    <form action="addJob" method="post" enctype="multipart/form-data" class="form-body">
      <div class="form-group">
        <label>Company Name</label>
        <input type="text" name="company_name" placeholder="e.g. Google" required/>
      </div>
      <div class="form-group">
        <label>Role</label>
        <input type="text" name="role" placeholder="e.g. Software Engineer" required/>
      </div>
      <div class="form-group">
        <label>Apply Date</label>
        <input type="date" name="applyDate" id="addDate" required/>
      </div>
      <div class="form-group">
        <label>Status</label>
        <select name="status">
          <option value="">Select Status</option>
          <option value="Applied">Applied</option>
          <option value="Interview">Interview</option>
          <option value="Offer">Offer</option>
          <option value="Rejected">Rejected</option>
        </select>
      </div>
      <div class="form-group">
        <label>Application Type</label>
        <select name="application_type">
          <option value="">Select Type</option>
          <option value="Online">Online</option>
          <option value="Referral">Referral</option>
          <option value="Walk-in">Walk-in</option>
          <option value="Campus">Campus</option>
        </select>
      </div>
      <div class="form-group">
        <label>Upload Resume (PDF/DOC)</label>
        <input type="file" name="resumeFile" accept=".pdf,.doc,.docx"/>
      </div>
      <div class="form-group full">
        <label>Job Description / Notes</label>
        <textarea name="job_description" placeholder="Paste the JD or key requirements here..."></textarea>
      </div>
      <button type="submit" class="btn-submit">＋ Add Application</button>
    </form>
  </div>

  <!-- TABLE -->
  <div class="section-label">
    <span class="section-label-text">All Applications</span>
    <div class="section-label-line"></div>
  </div>

  <c:choose>
    <c:when test="${empty applications}">
      <div class="table-card">
        <div class="empty-state">
          <div class="empty-icon">📭</div>
          <div class="empty-title">No applications yet</div>
          <div class="empty-sub">Add your first job application using the form above.</div>
        </div>
      </div>
    </c:when>
    <c:otherwise>
      <div class="table-card">
        <div class="table-card-header">
          <span class="table-card-title">All Applications</span>
          <div class="table-controls">
            <input class="search-input" type="text" placeholder="🔍 Search..." oninput="filterTable(this.value)"/>
            <button class="filter-btn active" onclick="filterStatus('all',this)">All</button>
            <button class="filter-btn" onclick="filterStatus('Applied',this)">Applied</button>
            <button class="filter-btn" onclick="filterStatus('Interview',this)">Interview</button>
            <button class="filter-btn" onclick="filterStatus('Offer',this)">Offer</button>
            <button class="filter-btn" onclick="filterStatus('Rejected',this)">Rejected</button>
            <span class="table-count" id="tableCount">Loading...</span>
          </div>
        </div>
        <div style="overflow-x:auto;">
          <table id="jobTable">
            <thead>
              <tr>
                <th>Company</th>
                <th>Role</th>
                <th>Date</th>
                <th>Status</th>
                <th>Type</th>
                <th>Resume</th>
                <th>Notes</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="app" items="${applications}">

                <tr data-status="${app.status}" data-search="${fn:toLowerCase(app.company_name)} ${fn:toLowerCase(app.role)}" data-company="${app.company_name}" data-role="${app.role}" data-date="${app.applyDate}" data-apptype="${app.application_type}">

                <tr data-status="${app.status}" data-search="${fn:toLowerCase(app.company_name)} ${fn:toLowerCase(app.role)}">
                  <td>
                    <div class="company-cell">
                      <div class="company-avatar av-${fn:substring(app.company_name,0,1)}">
                        ${fn:substring(app.company_name,0,2)}
                      </div>
                      <span class="company-name">${app.company_name}</span>
                    </div>
                  </td>
                  <td>${app.role}</td>
                  <td>${app.applyDate}</td>
                  <td><span class="badge badge-${app.status}">${app.status}</span></td>
                  <td><span class="chip">${app.application_type}</span></td>
                  <td>
                    <c:choose>
                      <c:when test="${not empty app.resume_path}">
                        <a class="resume-link" href="uploads/${app.resume_path}" target="_blank">📄 View</a>
                      </c:when>
                      <c:otherwise><span style="color:var(--muted);font-size:.75rem;">—</span></c:otherwise>
                    </c:choose>
                  </td>
                  <td><div class="desc-cell" title="${app.job_description}">${app.job_description}</div></td>
                  <td>
                    <div class="action-cell">

                      <!-- EDIT button → reads data from <tr> data-* attributes -->
                      <button class="btn-sm btn-edit"
                        data-desc="${fn:replace(app.job_description, '"', '&quot;')}"
                        data-status="${app.status}"
                        onclick="openEditModalFromBtn(this)">✏️ Edit</button>

                      <!-- EDIT button → opens modal pre-filled -->
                      <button class="btn-sm btn-edit"
                        onclick="openEditModal(
                          '${app.company_name}',
                          '${app.role}',
                          '${app.applyDate}',
                          '${app.status}',
                          '${app.application_type}',
                          '${fn:replace(app.job_description, &quot;'&quot;, &quot;&#39;&quot;)}')">✏️ Edit</button>


                      <!-- DELETE form -->
                      <form action="deleteJob" method="post" style="margin:0;display:inline;">
                        <input type="hidden" name="company_name" value="${app.company_name}"/>
                        <button type="submit" class="btn-sm btn-delete"
                          onclick="return confirm('Delete ${app.company_name}?')">🗑 Del</button>
                      </form>

                      <!-- AI INSIGHTS form -->
                      <form action="aiInsights" method="post" style="margin:0;display:inline;">
                        <input type="hidden" name="company_name" value="${app.company_name}"/>
                        <input type="hidden" name="role" value="${app.role}"/>
                        <input type="hidden" name="status" value="${app.status}"/>
                        <input type="hidden" name="job_desc" value="${app.job_description}"/>
                        <button type="submit" class="btn-sm btn-ai"
                          onclick="showLoading(this,'🤖...')">🤖 AI</button>
                      </form>
                    </div>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </c:otherwise>
  </c:choose>

</div><!-- end tab-applications -->

<!-- ════════════════════
     TAB 2: ATS SCORER
════════════════════ -->
<div class="tab-panel" id="tab-ats">

  <!-- ATS Result -->
  <c:if test="${not empty atsResult}">
    <div class="ats-panel" id="atsResultPanel">
      <div class="ats-header">
        <div class="ats-title"><span>🎯</span> ATS Analysis Result — ${atsCompany}</div>
        <span class="ai-badge">AI Powered</span>
      </div>
      <div class="ats-body" id="atsResultBody">
        <!-- Parsed by JS below -->
        <div id="atsRawResult" style="display:none;">${atsResult}</div>
      </div>
    </div>
  </c:if>

  <div class="section-label">
    <span class="section-label-text">ATS Keyword Analyzer</span>
    <div class="section-label-line"></div>
  </div>

  <div class="ats-form-card">
    <div class="ats-form-header">
      <div>
        <div class="ats-form-title">🎯 ATS Score & Keyword Analyzer</div>
        <div class="ats-form-subtitle">Paste the job description and your resume skills to see how well you match</div>
      </div>
    </div>
    <form action="atsScore" method="post" class="ats-form-body">
      <div class="form-group">
        <label>Company (for reference)</label>
        <c:choose>
          <c:when test="${not empty applications}">
            <select name="company_name">
              <c:forEach var="app" items="${applications}">
                <option value="${app.company_name}">${app.company_name} — ${app.role}</option>
              </c:forEach>
            </select>
          </c:when>
          <c:otherwise>
            <input type="text" name="company_name" placeholder="Company name"/>
          </c:otherwise>
        </c:choose>
      </div>
      <div class="form-group">
        <label>&nbsp;</label>
        <div style="background:var(--cream);border:1.5px solid var(--border);border-radius:8px;padding:12px 14px;font-size:.82rem;color:var(--muted);line-height:1.7;">
          💡 <strong>How it works:</strong> Paste the job description and your key skills/resume summary. The AI will score your match percentage, show matched and missing keywords, and give you a tip to improve your resume.
        </div>
      </div>
      <div class="form-group full">
        <label>Job Description (paste full JD)</label>
        <textarea name="job_desc" rows="6" placeholder="Paste the full job description here..." required></textarea>
      </div>
      <div class="form-group full">
        <label>Your Resume / Skills Summary</label>
        <textarea name="resume_text" rows="6" placeholder="Paste your resume text, skills section, or a summary of your experience here..." required></textarea>
      </div>
      <div style="grid-column:1/-1;">
        <button type="submit" class="btn-submit" style="max-width:260px;" onclick="showLoading(this,'Analyzing...')">
          🎯 Analyze ATS Match
        </button>
      </div>
    </form>
  </div>

</div><!-- end tab-ats -->

</main>

<!-- ════════════════════
     EDIT MODAL
════════════════════ -->
<div class="modal-backdrop" id="editModal">
  <div class="modal">
    <div class="modal-header">
      <span class="modal-title">✏️ Edit Application</span>
      <button class="modal-close" onclick="closeEditModal()">×</button>
    </div>
    <form action="updateJob" method="post" enctype="multipart/form-data" class="modal-body">
      <!-- Original company name to track PK change -->
      <input type="hidden" name="original_company" id="editOriginalCompany"/>

      <div class="form-group">
        <label>Company Name</label>
        <input type="text" name="company_name" id="editCompany" required/>
      </div>
      <div class="form-group">
        <label>Role</label>
        <input type="text" name="role" id="editRole" required/>
      </div>
      <div class="form-group">
        <label>Apply Date</label>
        <input type="date" name="applyDate" id="editDate"/>
      </div>
      <div class="form-group">
        <label>Status</label>
        <select name="status" id="editStatus">
          <option value="Applied">Applied</option>
          <option value="Interview">Interview</option>
          <option value="Offer">Offer</option>
          <option value="Rejected">Rejected</option>
        </select>
      </div>
      <div class="form-group">
        <label>Application Type</label>
        <select name="application_type" id="editAppType">
          <option value="Online">Online</option>
          <option value="Referral">Referral</option>
          <option value="Walk-in">Walk-in</option>
          <option value="Campus">Campus</option>
        </select>
      </div>
      <div class="form-group">
        <label>Update Resume (optional)</label>
        <input type="file" name="resumeFile" accept=".pdf,.doc,.docx"/>
      </div>
      <div class="form-group full">
        <label>Job Description / Notes</label>
        <textarea name="job_description" id="editDesc" rows="4"></textarea>
      </div>
      <div class="form-group full">
        <button type="submit" class="btn-submit">💾 Save Changes</button>
      </div>
    </form>
  </div>
</div>

<!-- ══ FOOTER ══ -->
<footer>JobTrack Pro &nbsp;·&nbsp; Spring MVC + Hibernate + Claude AI &nbsp;·&nbsp; Built for job seekers</footer>

<script>
// ══ STATS COUNT ══
const rows = document.querySelectorAll('#jobTable tbody tr');
document.getElementById('totalCount').textContent     = rows.length;
document.getElementById('interviewCount').textContent = [...rows].filter(r=>r.dataset.status==='Interview').length;
document.getElementById('offerCount').textContent     = [...rows].filter(r=>r.dataset.status==='Offer').length;
document.getElementById('rejectedCount').textContent  = [...rows].filter(r=>r.dataset.status==='Rejected').length;
const tc = document.getElementById('tableCount');
if(tc) tc.textContent = rows.length + ' record' + (rows.length!==1?'s':'');

// ══ DEFAULT DATE ══
const di = document.getElementById('addDate');
if(di) di.valueAsDate = new Date();

// ══ TABS ══
function switchTab(tabId, btn) {
  document.querySelectorAll('.tab-panel').forEach(p=>p.classList.remove('active'));
  document.querySelectorAll('.tab-btn').forEach(b=>b.classList.remove('active'));
  document.getElementById('tab-'+tabId).classList.add('active');
  btn.classList.add('active');
}

// Auto-switch to ATS tab if result is present
<c:if test="${not empty atsResult}">
  document.querySelectorAll('.tab-btn').forEach(b=>b.classList.remove('active'));
  document.querySelectorAll('.tab-panel').forEach(p=>p.classList.remove('active'));
  document.getElementById('tab-ats').classList.add('active');
  document.querySelectorAll('.tab-btn')[1].classList.add('active');
</c:if>

// ══ SEARCH ══
function filterTable(q){
  const query = q.toLowerCase();
  document.querySelectorAll('#jobTable tbody tr').forEach(r=>{
    r.style.display = r.dataset.search.includes(query) ? '' : 'none';
  });
  updateCount();
}

// ══ STATUS FILTER ══
function filterStatus(status, btn){
  document.querySelectorAll('.filter-btn').forEach(b=>b.classList.remove('active'));
  btn.classList.add('active');
  document.querySelectorAll('#jobTable tbody tr').forEach(r=>{
    r.style.display = (status==='all' || r.dataset.status===status) ? '' : 'none';
  });
  updateCount();
}

function updateCount(){
  const visible = [...document.querySelectorAll('#jobTable tbody tr')].filter(r=>r.style.display!=='none').length;
  const tc = document.getElementById('tableCount');
  if(tc) tc.textContent = visible + ' record' + (visible!==1?'s':'');
}

// ══ EDIT MODAL ══

function openEditModalFromBtn(btn){
  // Read all data from the parent <tr> data-* attributes
  const tr      = btn.closest('tr');
  const company = tr.dataset.company;
  const role    = tr.dataset.role;
  const date    = tr.dataset.date;
  const status  = btn.dataset.status;
  const appType = tr.dataset.apptype;
  // desc is stored on the button itself to avoid EL-in-JS issues
  const desc    = btn.dataset.desc || '';


function openEditModal(company, role, date, status, appType, desc){
  document.getElementById('editOriginalCompany').value = company;
  document.getElementById('editCompany').value         = company;
  document.getElementById('editRole').value            = role;
  document.getElementById('editDate').value            = date;
  document.getElementById('editStatus').value          = status;
  document.getElementById('editAppType').value         = appType;
  document.getElementById('editDesc').value            = desc;
  document.getElementById('editModal').classList.add('open');
}

function closeEditModal(){
  document.getElementById('editModal').classList.remove('open');
}

// Close modal on backdrop click
document.getElementById('editModal').addEventListener('click', function(e){
  if(e.target === this) closeEditModal();
});

// Close on Escape
document.addEventListener('keydown', e => { if(e.key==='Escape') closeEditModal(); });

// ══ LOADING STATE for AI/ATS buttons ══
function showLoading(btn, text){
  btn.disabled = true;
  btn.innerHTML = text + ' <div class="spinner" style="display:inline-block"></div>';
  btn.closest('form').submit();
}

// ══ ATS RESULT PARSER ══
// Parses the raw text from Claude and renders it nicely
const rawEl = document.getElementById('atsRawResult');
if(rawEl){
  const raw = rawEl.textContent.trim();
  const body = document.getElementById('atsResultBody');

  const scoreMatch    = raw.match(/SCORE:\s*(\d+)/i);
  const matchedMatch  = raw.match(/MATCHED_KEYWORDS:\s*([^\n]+)/i);
  const missingMatch  = raw.match(/MISSING_KEYWORDS:\s*([^\n]+)/i);
  const tipMatch      = raw.match(/IMPROVEMENT_TIP:\s*([^\n]+)/i);

  const score   = scoreMatch   ? parseInt(scoreMatch[1])        : '?';
  const matched = matchedMatch ? matchedMatch[1].trim()         : '';
  const missing = missingMatch ? missingMatch[1].trim()         : '';
  const tip     = tipMatch     ? tipMatch[1].trim()             : '';

  const scoreColor = score>=70 ? 'var(--success)' : score>=40 ? 'var(--warning)' : 'var(--danger)';

  const matchedChips = matched.split(',').filter(k=>k.trim())
    .map(k=>`<span class="keyword-chip kw-match">${k.trim()}</span>`).join('');
  const missingChips = missing.split(',').filter(k=>k.trim())
    .map(k=>`<span class="keyword-chip kw-miss">${k.trim()}</span>`).join('');

  var tipHtml = tip ? '<div class="ats-tip">&#128161; <strong>Tip:</strong> ' + tip + '</div>' : '';
  body.innerHTML =
    '<div class="ats-score-row">'
    + '<div class="ats-score-circle" style="border-color:' + scoreColor + '">'
    + '<span class="ats-score-num" style="color:' + scoreColor + '">' + score + '</span>'
    + '<span class="ats-score-label">/ 100</span>'
    + '</div>'
    + '<div class="ats-details">'
    + '<div class="ats-row"><div class="ats-row-label">✅ Matched Keywords</div>'
    + '<div class="ats-row-value">' + (matchedChips || '<span style="color:var(--muted)">None found</span>') + '</div></div>'
    + '<div class="ats-row"><div class="ats-row-label">❌ Missing Keywords</div>'
    + '<div class="ats-row-value">' + (missingChips || '<span style="color:var(--muted)">None</span>') + '</div></div>'
    + '</div>'
    + '</div>'
    + tipHtml;

  body.innerHTML = `
    <div class="ats-score-row">
      <div class="ats-score-circle" style="border-color:${scoreColor}">
        <span class="ats-score-num" style="color:${scoreColor}">${score}</span>
        <span class="ats-score-label">/ 100</span>
      </div>
      <div class="ats-details">
        <div class="ats-row">
          <div class="ats-row-label">✅ Matched Keywords</div>
          <div class="ats-row-value">${matchedChips || '<span style="color:var(--muted)">None found</span>'}</div>
        </div>
        <div class="ats-row">
          <div class="ats-row-label">❌ Missing Keywords</div>
          <div class="ats-row-value">${missingChips || '<span style="color:var(--muted)">None</span>'}</div>
        </div>
      </div>
    </div>
    ${tip ? `<div class="ats-tip">💡 <strong>Tip:</strong> ${tip}</div>` : ''}
  `;

}

// ══ Auto-open edit modal if editApp is set (from GET /editJob) ══
<c:if test="${not empty editApp}">

  // Auto open modal from server-side editApp attribute
  document.getElementById('editOriginalCompany').value = '${editApp.company_name}';
  document.getElementById('editCompany').value         = '${editApp.company_name}';
  document.getElementById('editRole').value            = '${editApp.role}';
  document.getElementById('editDate').value            = '${editApp.applyDate}';
  document.getElementById('editStatus').value          = '${editApp.status}';
  document.getElementById('editAppType').value         = '${editApp.application_type}';
  document.getElementById('editDesc').value            = `${editApp.job_description}`;
  document.getElementById('editModal').classList.add('open');
  openEditModal(
    '${editApp.company_name}',
    '${editApp.role}',
    '${editApp.applyDate}',
    '${editApp.status}',
    '${editApp.application_type}',
    '${fn:replace(editApp.job_description, "'", "&#39;")}'
  );
</c:if>
</script>
</body>
</html>
