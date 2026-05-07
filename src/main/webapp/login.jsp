<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>JobTrack Pro — Sign In</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
/* ══════════════════════════════════════════
   DESIGN TOKENS  (same as home.jsp)
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
  --danger:   #dc2626;
}
*{margin:0;padding:0;box-sizing:border-box;}
body{
  font-family:'DM Sans',sans-serif;
  background:var(--paper);
  color:var(--ink);
  min-height:100vh;
  overflow-x:hidden;
  display:flex;
  flex-direction:column;
}

/* noise overlay */
body::before{content:'';position:fixed;inset:0;
  background-image:url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
  pointer-events:none;z-index:0;opacity:.5;}

/* ══ HEADER ══ */
header{
  position:relative;z-index:100;
  background:var(--ink);color:var(--paper);
  padding:0 48px;display:flex;align-items:center;justify-content:space-between;
  height:68px;border-bottom:3px solid var(--accent);
}
.logo{font-family:'Syne',sans-serif;font-weight:800;font-size:1.5rem;
  letter-spacing:-.03em;display:flex;align-items:center;gap:10px;}
.logo-dot{width:9px;height:9px;background:var(--accent);border-radius:50%;
  animation:pulse 2s ease-in-out infinite;}
@keyframes pulse{0%,100%{transform:scale(1);}50%{transform:scale(1.5);opacity:.6;}}
.header-tag{font-size:.7rem;letter-spacing:.15em;text-transform:uppercase;
  color:#555;border:1px solid #333;padding:4px 12px;border-radius:20px;}

/* ══ HERO STRIP ══ */
.hero-strip{
  position:relative;
  background:var(--ink);color:var(--paper);
  padding:40px 48px 36px;overflow:hidden;
}
.hero-strip::after{content:'';position:absolute;right:-60px;top:-60px;
  width:320px;height:320px;border:60px solid var(--accent);border-radius:50%;opacity:.07;}
.hero-strip::before{content:'';position:absolute;right:180px;bottom:-50px;
  width:160px;height:160px;border:30px solid var(--gold);border-radius:50%;opacity:.10;}
.hero-eyebrow{font-size:.68rem;letter-spacing:.25em;text-transform:uppercase;
  color:var(--accent);font-weight:500;margin-bottom:10px;}
.hero-title{font-family:'Syne',sans-serif;font-size:clamp(1.8rem,3.5vw,2.8rem);
  font-weight:800;line-height:1.05;letter-spacing:-.04em;}
.hero-title span{color:var(--accent);}

/* ══ LOGIN LAYOUT ══ */
.login-wrapper{
  position:relative;z-index:1;
  flex:1;display:flex;align-items:center;justify-content:center;
  padding:48px 24px;
}

.login-card{
  background:var(--white);
  border:1.5px solid var(--border);
  border-radius:16px;
  overflow:hidden;
  width:100%;max-width:460px;
  box-shadow:0 4px 40px rgba(0,0,0,.08);
  animation:slideUp .4s ease both;
}
@keyframes slideUp{from{opacity:0;transform:translateY(18px);}to{opacity:1;transform:translateY(0);}}

.login-card-header{
  background:var(--ink);color:var(--paper);
  padding:20px 28px;
  display:flex;align-items:center;justify-content:space-between;
}
.login-card-title{font-family:'Syne',sans-serif;font-size:1rem;font-weight:700;}
.login-card-badge{font-size:.62rem;letter-spacing:.12em;text-transform:uppercase;
  background:var(--accent);color:white;padding:4px 10px;border-radius:20px;}

.login-body{padding:32px 28px;display:flex;flex-direction:column;gap:20px;}

.form-group{display:flex;flex-direction:column;gap:6px;}
label{font-size:.7rem;font-weight:500;letter-spacing:.08em;text-transform:uppercase;color:var(--muted);}

.input-wrapper{position:relative;}
input[type="text"],
input[type="password"],
input[type="email"]{
  font-family:'DM Sans',sans-serif;font-size:.92rem;
  padding:11px 13px 11px 40px;
  border:1.5px solid var(--border);border-radius:8px;
  background:var(--paper);color:var(--ink);
  transition:border-color .2s,box-shadow .2s;outline:none;width:100%;
}
input:focus{
  border-color:var(--accent);background:var(--white);
  box-shadow:0 0 0 3px rgba(232,64,28,.08);
}
.input-icon{
  position:absolute;left:13px;top:50%;transform:translateY(-50%);
  font-size:.95rem;pointer-events:none;color:var(--muted);
}

/* password toggle */
.toggle-pw{
  position:absolute;right:12px;top:50%;transform:translateY(-50%);
  background:none;border:none;cursor:pointer;color:var(--muted);font-size:.9rem;
  transition:color .15s;
}
.toggle-pw:hover{color:var(--ink);}

.remember-row{
  display:flex;align-items:center;justify-content:space-between;
  font-size:.82rem;
}
.remember-label{display:flex;align-items:center;gap:7px;cursor:pointer;color:var(--muted);}
input[type="checkbox"]{
  width:15px;height:15px;accent-color:var(--accent);cursor:pointer;
  padding:0;border:none;background:none;
}
.forgot-link{font-size:.78rem;color:var(--accent);text-decoration:none;font-weight:500;}
.forgot-link:hover{text-decoration:underline;}

.btn-login{
  font-family:'Syne',sans-serif;font-size:.85rem;font-weight:700;
  letter-spacing:.05em;text-transform:uppercase;
  background:var(--accent);color:white;
  border:none;border-radius:8px;padding:14px 28px;
  cursor:pointer;width:100%;
  transition:transform .15s,box-shadow .15s,background .15s;
  display:flex;align-items:center;justify-content:center;gap:8px;
}
.btn-login:hover{background:#c93518;transform:translateY(-2px);box-shadow:0 8px 24px rgba(232,64,28,.28);}
.btn-login:active{transform:translateY(0);}

.divider{display:flex;align-items:center;gap:12px;}
.divider-line{flex:1;height:1px;background:var(--border);}
.divider-text{font-size:.68rem;letter-spacing:.1em;text-transform:uppercase;color:var(--muted);}

/* error alert */
.alert-error{
  background:#fee2e2;border:1.5px solid #fca5a5;
  border-radius:8px;padding:10px 14px;
  font-size:.84rem;color:var(--danger);
  display:flex;align-items:center;gap:8px;
}

/* signup prompt */
.signup-prompt{
  text-align:center;font-size:.82rem;color:var(--muted);
  padding-top:4px;
}
.signup-prompt a{color:var(--accent);font-weight:500;text-decoration:none;}
.signup-prompt a:hover{text-decoration:underline;}

/* ══ SPLIT PANEL (decorative left side on wide screens) ══ */
.login-split{
  position:relative;z-index:1;
  flex:1;display:flex;align-items:stretch;justify-content:center;
  padding:48px 24px;
}
.split-inner{
  display:flex;gap:40px;align-items:center;
  width:100%;max-width:960px;
}
.split-left{
  flex:1;display:flex;flex-direction:column;justify-content:center;gap:28px;
  padding-right:40px;
}
.split-right{flex:0 0 460px;}

.feature-item{display:flex;align-items:flex-start;gap:14px;}
.feature-icon{
  width:40px;height:40px;flex-shrink:0;
  border-radius:10px;background:var(--ink);
  display:flex;align-items:center;justify-content:center;font-size:1.1rem;
}
.feature-text-title{
  font-family:'Syne',sans-serif;font-size:.9rem;font-weight:700;
  margin-bottom:3px;
}
.feature-text-sub{font-size:.82rem;color:var(--muted);line-height:1.5;}

.section-label{display:flex;align-items:center;gap:12px;margin-bottom:6px;}
.section-label-line{flex:1;height:1px;background:var(--border);}
.section-label-text{font-family:'Syne',sans-serif;font-size:.62rem;
  letter-spacing:.25em;text-transform:uppercase;color:var(--muted);white-space:nowrap;}

/* ══ FOOTER ══ */
footer{
  text-align:center;padding:22px;font-size:.72rem;color:var(--muted);
  border-top:1px solid var(--border);letter-spacing:.05em;
  position:relative;z-index:1;
}

/* ══ RESPONSIVE ══ */
@media(max-width:768px){
  header{padding:0 20px;}
  .hero-strip{padding:30px 20px 26px;}
  .split-left{display:none;}
  .login-split{padding:32px 16px;}
  .split-inner{flex-direction:column;}
  .split-right{flex:unset;width:100%;}
}
@media(min-width:769px){
  .login-wrapper{display:none;}
}
</style>
</head>
<body>

<!-- ══ HEADER ══ -->
<header>
  <div class="logo"><span class="logo-dot"></span>JobTrack Pro</div>
  <div>
    <span class="header-tag">Career Command Center</span>
  </div>
</header>

<!-- ══ HERO STRIP ══ -->
<div class="hero-strip">
  <div class="hero-eyebrow">▸ AI-Powered Job Hunt Tracker</div>
  <h1 class="hero-title">Welcome Back.<br><span>Keep Hunting.</span></h1>
</div>

<!-- ══ DESKTOP: SPLIT LAYOUT ══ -->
<div class="login-split">
  <div class="split-inner">

    <!-- Left: feature bullets -->
    <div class="split-left">
      <div class="section-label">
        <span class="section-label-text">What's Inside</span>
        <div class="section-label-line"></div>
      </div>
      <div class="feature-item">
        <div class="feature-icon">📋</div>
        <div>
          <div class="feature-text-title">Track Every Application</div>
          <div class="feature-text-sub">Log companies, roles, dates, and statuses in one clean dashboard.</div>
        </div>
      </div>
      <div class="feature-item">
        <div class="feature-icon">🤖</div>
        <div>
          <div class="feature-text-title">AI Career Insights</div>
          <div class="feature-text-sub">Get Groq-powered coaching, interview tips, and skill highlights for each role.</div>
        </div>
      </div>
      <div class="feature-item">
        <div class="feature-icon">🎯</div>
        <div>
          <div class="feature-text-title">ATS Keyword Scorer</div>
          <div class="feature-text-sub">Compare your resume against job descriptions and close the keyword gap.</div>
        </div>
      </div>
      <div class="feature-item">
        <div class="feature-icon">📄</div>
        <div>
          <div class="feature-text-title">Resume Upload & Viewer</div>
          <div class="feature-text-sub">Attach a PDF or DOCX to each application and access it any time.</div>
        </div>
      </div>
    </div>

    <!-- Right: login card -->
    <div class="split-right">
      <%-- Show error message if login failed --%>
      <%
        String error = (String) request.getAttribute("loginError");
      %>
      <div class="login-card">
        <div class="login-card-header">
          <span class="login-card-title">Sign In to JobTrack Pro</span>
          <span class="login-card-badge">Secure</span>
        </div>
        <form action="login" method="post" class="login-body">

          <% if (error != null) { %>
          <div class="alert-error">⚠ <%= error %></div>
          <% } %>

          <div class="form-group">
            <label>Username</label>
            <div class="input-wrapper">
              <span class="input-icon">👤</span>
              <input type="text" name="username" placeholder="Enter your username" required autofocus/>
            </div>
          </div>

          <div class="form-group">
            <label>Password</label>
            <div class="input-wrapper">
              <span class="input-icon">🔒</span>
              <input type="password" name="password" id="pwField" placeholder="Enter your password" required/>
              <button type="button" class="toggle-pw" onclick="togglePw()" id="pwToggle" title="Show/hide password">👁</button>
            </div>
          </div>

          <div class="remember-row">
            <label class="remember-label">
              <input type="checkbox" name="remember"/> Remember me
            </label>
            <a href="forgotPassword" class="forgot-link">Forgot password?</a>
          </div>

          <button type="submit" class="btn-login">
            Sign In &nbsp;→
          </button>

          <div class="divider">
            <div class="divider-line"></div>
            <span class="divider-text">New here?</span>
            <div class="divider-line"></div>
          </div>

          <div class="signup-prompt">
            Don't have an account? <a href="register">Create one free</a>
          </div>

        </form>
      </div>
    </div><!-- end split-right -->

  </div>
</div>

<!-- ══ MOBILE: SINGLE CARD LAYOUT ══ -->
<div class="login-wrapper">
  <%
    String errorM = (String) request.getAttribute("loginError");
  %>
  <div class="login-card">
    <div class="login-card-header">
      <span class="login-card-title">Sign In to JobTrack Pro</span>
      <span class="login-card-badge">Secure</span>
    </div>
    <form action="login" method="post" class="login-body">

      <% if (errorM != null) { %>
      <div class="alert-error">⚠ <%= errorM %></div>
      <% } %>

      <div class="form-group">
        <label>Username</label>
        <div class="input-wrapper">
          <span class="input-icon">👤</span>
          <input type="text" name="username" placeholder="Enter your username" required/>
        </div>
      </div>

      <div class="form-group">
        <label>Password</label>
        <div class="input-wrapper">
          <span class="input-icon">🔒</span>
          <input type="password" name="password" id="pwFieldM" placeholder="Enter your password" required/>
          <button type="button" class="toggle-pw" onclick="togglePwM()" title="Show/hide password">👁</button>
        </div>
      </div>

      <div class="remember-row">
        <label class="remember-label">
          <input type="checkbox" name="remember"/> Remember me
        </label>
        <a href="forgotPassword" class="forgot-link">Forgot?</a>
      </div>

      <button type="submit" class="btn-login">Sign In &nbsp;→</button>

      <div class="signup-prompt">
        No account? <a href="register">Create one free</a>
      </div>

    </form>
  </div>
</div>

<!-- ══ FOOTER ══ -->
<footer>JobTrack Pro &nbsp;·&nbsp; Spring MVC + Hibernate + Groq AI &nbsp;·&nbsp; Built for job seekers</footer>

<script>
function togglePw() {
  const f = document.getElementById('pwField');
  const b = document.getElementById('pwToggle');
  if (f.type === 'password') { f.type = 'text';  b.textContent = '🙈'; }
  else                       { f.type = 'password'; b.textContent = '👁'; }
}
function togglePwM() {
  const f = document.getElementById('pwFieldM');
  if (f.type === 'password') f.type = 'text';
  else f.type = 'password';
}
</script>
</body>
</html>
