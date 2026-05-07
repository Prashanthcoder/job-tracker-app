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
:root {
  --ink:      #0d0d0d;
  --paper:    #f5f0e8;
  --cream:    #ede8dc;
  --accent:   #e8401c;
  --gold:     #c9a84c;
  --muted:    #8a8070;
  --white:    #ffffff;
  --border:   #d8d0c0;
  --danger:   #dc2626;
}

* { margin: 0; padding: 0; box-sizing: border-box; }

body {
  font-family: 'DM Sans', sans-serif;
  background: var(--paper);
  color: var(--ink);
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  overflow-x: hidden;
}

body::before {
  content: '';
  position: fixed;
  inset: 0;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
  pointer-events: none;
  z-index: 0;
  opacity: .5;
}

/* ── HEADER ── */
header {
  position: relative;
  z-index: 100;
  background: var(--ink);
  color: var(--paper);
  padding: 0 48px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 68px;
  border-bottom: 3px solid var(--accent);
}
.logo {
  font-family: 'Syne', sans-serif;
  font-weight: 800;
  font-size: 1.5rem;
  letter-spacing: -.03em;
  display: flex;
  align-items: center;
  gap: 10px;
}
.logo-dot {
  width: 9px;
  height: 9px;
  background: var(--accent);
  border-radius: 50%;
  animation: pulse 2s ease-in-out infinite;
}
@keyframes pulse {
  0%, 100% { transform: scale(1); }
  50%       { transform: scale(1.5); opacity: .6; }
}
.header-tag {
  font-size: .7rem;
  letter-spacing: .15em;
  text-transform: uppercase;
  color: #555;
  border: 1px solid #333;
  padding: 4px 12px;
  border-radius: 20px;
}

/* ── SPLIT LAYOUT ── */
.page {
  position: relative;
  z-index: 1;
  flex: 1;
  display: grid;
  grid-template-columns: 1fr 480px;
}

/* ── LEFT PANEL ── */
.left-panel {
  background: var(--ink);
  color: var(--paper);
  padding: 64px 56px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  position: relative;
  overflow: hidden;
}
.left-panel::after {
  content: '';
  position: absolute;
  right: -80px;
  top: -80px;
  width: 400px;
  height: 400px;
  border: 72px solid var(--accent);
  border-radius: 50%;
  opacity: .06;
}
.left-panel::before {
  content: '';
  position: absolute;
  left: -40px;
  bottom: -60px;
  width: 220px;
  height: 220px;
  border: 40px solid var(--gold);
  border-radius: 50%;
  opacity: .08;
}
.eyebrow {
  font-size: .68rem;
  letter-spacing: .25em;
  text-transform: uppercase;
  color: var(--accent);
  font-weight: 500;
  margin-bottom: 18px;
}
.left-title {
  font-family: 'Syne', sans-serif;
  font-size: clamp(2.2rem, 3.6vw, 3.6rem);
  font-weight: 800;
  line-height: 1.0;
  letter-spacing: -.04em;
  margin-bottom: 20px;
}
.left-title span { color: var(--accent); }
.left-sub {
  font-size: .93rem;
  color: #777;
  font-weight: 300;
  max-width: 340px;
  line-height: 1.75;
}
.features {
  display: flex;
  flex-direction: column;
  gap: 0;
  margin-top: 52px;
}
.feature {
  display: flex;
  align-items: flex-start;
  gap: 18px;
  padding: 20px 0;
  border-bottom: 1px solid #1c1c1c;
}
.feature:first-child { padding-top: 0; }
.feature:last-child  { border-bottom: none; padding-bottom: 0; }
.feature-num {
  font-family: 'Syne', sans-serif;
  font-size: .7rem;
  font-weight: 700;
  color: var(--accent);
  letter-spacing: .1em;
  padding-top: 3px;
  flex-shrink: 0;
  width: 24px;
}
.feature-title {
  font-family: 'Syne', sans-serif;
  font-size: .88rem;
  font-weight: 700;
  margin-bottom: 5px;
  color: var(--paper);
}
.feature-desc {
  font-size: .78rem;
  color: #666;
  line-height: 1.65;
}
.left-bottom {
  font-size: .65rem;
  letter-spacing: .12em;
  text-transform: uppercase;
  color: #2e2e2e;
  margin-top: 48px;
}

/* ── RIGHT PANEL ── */
.right-panel {
  background: var(--paper);
  padding: 64px 48px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  border-left: 1.5px solid var(--border);
}
.form-eyebrow {
  font-size: .65rem;
  letter-spacing: .22em;
  text-transform: uppercase;
  color: var(--muted);
  margin-bottom: 10px;
}
.form-title {
  font-family: 'Syne', sans-serif;
  font-size: 2rem;
  font-weight: 800;
  letter-spacing: -.03em;
  margin-bottom: 6px;
}
.form-subtitle {
  font-size: .87rem;
  color: var(--muted);
  font-weight: 300;
  margin-bottom: 40px;
  line-height: 1.6;
}

/* ── INPUTS ── */
.form-group {
  display: flex;
  flex-direction: column;
  gap: 7px;
  margin-bottom: 20px;
}
label {
  font-size: .68rem;
  font-weight: 500;
  letter-spacing: .1em;
  text-transform: uppercase;
  color: var(--muted);
}
.input-wrap { position: relative; }

input[type="text"],
input[type="password"] {
  font-family: 'DM Sans', sans-serif;
  font-size: .92rem;
  width: 100%;
  padding: 12px 16px;
  border: 1.5px solid var(--border);
  border-radius: 8px;
  background: var(--white);
  color: var(--ink);
  outline: none;
  transition: border-color .2s, box-shadow .2s;
}
input[type="text"]:focus,
input[type="password"]:focus {
  border-color: var(--accent);
  box-shadow: 0 0 0 3px rgba(232,64,28,.08);
}
input::placeholder { color: #c4bdb4; }

.pw-toggle {
  position: absolute;
  right: 14px;
  top: 50%;
  transform: translateY(-50%);
  background: none;
  border: none;
  cursor: pointer;
  color: var(--muted);
  font-size: .72rem;
  font-family: 'DM Sans', sans-serif;
  font-weight: 500;
  letter-spacing: .06em;
  text-transform: uppercase;
  transition: color .15s;
}
.pw-toggle:hover { color: var(--ink); }

.bottom-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 28px;
  margin-top: -4px;
}
.remember {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: .8rem;
  color: var(--muted);
  cursor: pointer;
  user-select: none;
}
input[type="checkbox"] {
  width: 14px;
  height: 14px;
  accent-color: var(--accent);
  cursor: pointer;
}
.forgot {
  font-size: .78rem;
  color: var(--accent);
  text-decoration: none;
  font-weight: 500;
}
.forgot:hover { text-decoration: underline; }

/* ── BUTTON ── */
.btn-signin {
  width: 100%;
  font-family: 'Syne', sans-serif;
  font-size: .85rem;
  font-weight: 700;
  letter-spacing: .06em;
  text-transform: uppercase;
  background: var(--accent);
  color: white;
  border: none;
  border-radius: 8px;
  padding: 14px;
  cursor: pointer;
  transition: background .15s, transform .15s, box-shadow .15s;
  margin-bottom: 28px;
}
.btn-signin:hover {
  background: #c93518;
  transform: translateY(-2px);
  box-shadow: 0 8px 24px rgba(232,64,28,.26);
}
.btn-signin:active { transform: translateY(0); }

.divider {
  display: flex;
  align-items: center;
  gap: 14px;
  margin-bottom: 24px;
}
.divider-line  { flex: 1; height: 1px; background: var(--border); }
.divider-text  {
  font-size: .65rem;
  letter-spacing: .12em;
  text-transform: uppercase;
  color: var(--muted);
  white-space: nowrap;
}

.signup-line {
  text-align: center;
  font-size: .82rem;
  color: var(--muted);
}
.signup-line a {
  color: var(--ink);
  font-weight: 600;
  text-decoration: none;
  border-bottom: 1.5px solid var(--accent);
  padding-bottom: 1px;
  transition: color .15s;
}
.signup-line a:hover { color: var(--accent); }

/* ── ERROR ── */
.alert-error {
  background: #fff5f5;
  border: 1.5px solid #fca5a5;
  border-left: 4px solid var(--danger);
  border-radius: 8px;
  padding: 11px 14px;
  font-size: .83rem;
  color: var(--danger);
  margin-bottom: 24px;
  line-height: 1.5;
}

/* ── FOOTER ── */
footer {
  position: relative;
  z-index: 1;
  text-align: center;
  padding: 18px;
  font-size: .7rem;
  color: var(--muted);
  border-top: 1px solid var(--border);
  letter-spacing: .06em;
}

/* ── RESPONSIVE ── */
@media (max-width: 860px) {
  .page { grid-template-columns: 1fr; }
  .left-panel { display: none; }
  header { padding: 0 20px; }
  .right-panel {
    padding: 48px 28px;
    border-left: none;
    min-height: calc(100vh - 68px - 52px);
  }
}
</style>
</head>
<body>

<header>
  <div class="logo">
    <span class="logo-dot"></span>
    JobTrack Pro
  </div>
  <span class="header-tag">Career Command Center</span>
</header>

<div class="page">

  <!-- LEFT: brand + features -->
  <div class="left-panel">
    <div>
      <div class="eyebrow">&#9656; AI-Powered Job Hunt Tracker</div>
      <h1 class="left-title">Track Every<br>Opportunity,<br><span>Land the Job.</span></h1>
      <p class="left-sub">Log applications, score your resume against job descriptions, and get AI-powered coaching — all in one place.</p>

      <div class="features">
        <div class="feature">
          <span class="feature-num">01</span>
          <div>
            <div class="feature-title">Application Dashboard</div>
            <div class="feature-desc">Log companies, roles, dates and statuses. Filter and search across everything instantly.</div>
          </div>
        </div>
        <div class="feature">
          <span class="feature-num">02</span>
          <div>
            <div class="feature-title">AI Career Insights</div>
            <div class="feature-desc">Groq-powered coaching with interview tips and key skills to highlight for each role.</div>
          </div>
        </div>
        <div class="feature">
          <span class="feature-num">03</span>
          <div>
            <div class="feature-title">ATS Keyword Scorer</div>
            <div class="feature-desc">Compare your resume against the job description. Close the keyword gap before you apply.</div>
          </div>
        </div>
      </div>
    </div>

    <div class="left-bottom">Spring MVC &nbsp;&middot;&nbsp; Hibernate &nbsp;&middot;&nbsp; Groq AI</div>
  </div>

  <!-- RIGHT: login form -->
  <div class="right-panel">

    <div class="form-eyebrow">Welcome back</div>
    <div class="form-title">Sign in</div>
    <div class="form-subtitle">Enter your credentials to access your dashboard.</div>

    <%
      String error = (String) request.getAttribute("loginError");
    %>
    <% if (error != null) { %>
    <div class="alert-error"><%= error %></div>
    <% } %>

    <form action="login" method="post">

      <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username"
               placeholder="e.g. john_doe" required autofocus/>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <div class="input-wrap">
          <input type="password" id="password" name="password"
                 placeholder="Your password" required/>
          <button type="button" class="pw-toggle" onclick="togglePassword(this)">Show</button>
        </div>
      </div>

      <div class="bottom-row">
        <label class="remember">
          <input type="checkbox" name="remember"/> Remember me
        </label>
        <a class="forgot" href="forgotPassword">Forgot password?</a>
      </div>

      <button type="submit" class="btn-signin">Sign In</button>

      <div class="divider">
        <div class="divider-line"></div>
        <span class="divider-text">New here?</span>
        <div class="divider-line"></div>
      </div>

      <div class="signup-line">
        Don't have an account? <a href="register">Create one free</a>
      </div>

    </form>
  </div>

</div>

<footer>JobTrack Pro &nbsp;&middot;&nbsp; Spring MVC + Hibernate + Groq AI &nbsp;&middot;&nbsp; Built for job seekers</footer>

<script>
function togglePassword(btn) {
  var field = document.getElementById('password');
  if (field.type === 'password') {
    field.type = 'text';
    btn.textContent = 'Hide';
  } else {
    field.type = 'password';
    btn.textContent = 'Show';
  }
}
</script>
</body>
</html>
