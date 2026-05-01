<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>JobTrack — Your Career Command Center</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:ital,wght@0,300;0,400;0,500;1,300&display=swap" rel="stylesheet">
    <style>
        :root {
            --ink: #0d0d0d;
            --paper: #f5f0e8;
            --cream: #ede8dc;
            --accent: #e8401c;
            --accent2: #2563eb;
            --gold: #c9a84c;
            --muted: #8a8070;
            --white: #ffffff;
            --card: #ffffff;
            --border: #d8d0c0;
            --success: #16a34a;
            --warning: #d97706;
            --danger: #dc2626;
            --info: #2563eb;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'DM Sans', sans-serif;
            background: var(--paper);
            color: var(--ink);
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* ── NOISE TEXTURE OVERLAY ── */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.04'/%3E%3C/svg%3E");
            pointer-events: none;
            z-index: 0;
            opacity: 0.6;
        }

        /* ── HEADER ── */
        header {
            position: relative;
            background: var(--ink);
            color: var(--paper);
            padding: 0 48px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 72px;
            border-bottom: 3px solid var(--accent);
            z-index: 10;
        }

        .logo {
            font-family: 'Syne', sans-serif;
            font-weight: 800;
            font-size: 1.6rem;
            letter-spacing: -0.03em;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo-dot {
            width: 10px; height: 10px;
            background: var(--accent);
            border-radius: 50%;
            display: inline-block;
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.4); opacity: 0.7; }
        }

        .header-tag {
            font-size: 0.75rem;
            font-weight: 300;
            letter-spacing: 0.15em;
            text-transform: uppercase;
            color: var(--muted);
            border: 1px solid #333;
            padding: 4px 12px;
            border-radius: 20px;
        }

        /* ── HERO BANNER ── */
        .hero {
            position: relative;
            background: var(--ink);
            color: var(--paper);
            padding: 60px 48px 50px;
            overflow: hidden;
        }

        .hero::after {
            content: '';
            position: absolute;
            right: -80px; top: -80px;
            width: 420px; height: 420px;
            border: 80px solid var(--accent);
            border-radius: 50%;
            opacity: 0.08;
        }

        .hero::before {
            content: '';
            position: absolute;
            right: 160px; bottom: -60px;
            width: 200px; height: 200px;
            border: 40px solid var(--gold);
            border-radius: 50%;
            opacity: 0.12;
        }

        .hero-eyebrow {
            font-size: 0.7rem;
            letter-spacing: 0.25em;
            text-transform: uppercase;
            color: var(--accent);
            font-weight: 500;
            margin-bottom: 14px;
        }

        .hero-title {
            font-family: 'Syne', sans-serif;
            font-size: clamp(2.4rem, 5vw, 4rem);
            font-weight: 800;
            line-height: 1.0;
            letter-spacing: -0.04em;
            margin-bottom: 16px;
        }

        .hero-title span { color: var(--accent); }

        .hero-sub {
            font-size: 1rem;
            color: #999;
            font-weight: 300;
            max-width: 420px;
            line-height: 1.6;
        }

        /* Stats row */
        .stats-row {
            display: flex;
            gap: 32px;
            margin-top: 36px;
        }

        .stat {
            display: flex;
            flex-direction: column;
        }

        .stat-num {
            font-family: 'Syne', sans-serif;
            font-size: 1.8rem;
            font-weight: 800;
            color: var(--white);
            letter-spacing: -0.04em;
        }

        .stat-label {
            font-size: 0.7rem;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: #666;
            margin-top: 2px;
        }

        .stat-divider {
            width: 1px;
            background: #333;
            align-self: stretch;
        }

        /* ── MAIN LAYOUT ── */
        main {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 0 auto;
            padding: 48px 32px 80px;
        }

        /* ── SECTION LABEL ── */
        .section-label {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 24px;
        }

        .section-label-line {
            flex: 1;
            height: 1px;
            background: var(--border);
        }

        .section-label-text {
            font-family: 'Syne', sans-serif;
            font-size: 0.65rem;
            letter-spacing: 0.25em;
            text-transform: uppercase;
            color: var(--muted);
            white-space: nowrap;
        }

        /* ── FORM CARD ── */
        .form-card {
            background: var(--card);
            border: 1.5px solid var(--border);
            border-radius: 16px;
            overflow: hidden;
            margin-bottom: 56px;
            box-shadow: 0 4px 32px rgba(0,0,0,0.06);
            animation: slideUp 0.5s ease both;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .form-card-header {
            background: var(--ink);
            color: var(--paper);
            padding: 20px 28px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .form-card-title {
            font-family: 'Syne', sans-serif;
            font-size: 1rem;
            font-weight: 700;
            letter-spacing: -0.01em;
        }

        .form-card-badge {
            font-size: 0.65rem;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            background: var(--accent);
            color: white;
            padding: 4px 10px;
            border-radius: 20px;
        }

        .form-body {
            padding: 28px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-group.full { grid-column: 1 / -1; }

        label {
            font-size: 0.72rem;
            font-weight: 500;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: var(--muted);
        }

        input, select, textarea {
            font-family: 'DM Sans', sans-serif;
            font-size: 0.95rem;
            padding: 11px 14px;
            border: 1.5px solid var(--border);
            border-radius: 8px;
            background: var(--paper);
            color: var(--ink);
            transition: border-color 0.2s, box-shadow 0.2s, background 0.2s;
            outline: none;
            width: 100%;
        }

        input:focus, select:focus, textarea:focus {
            border-color: var(--accent);
            background: var(--white);
            box-shadow: 0 0 0 3px rgba(232,64,28,0.08);
        }

        textarea { resize: vertical; min-height: 80px; }

        .btn-submit {
            grid-column: 1 / -1;
            font-family: 'Syne', sans-serif;
            font-size: 0.9rem;
            font-weight: 700;
            letter-spacing: 0.05em;
            text-transform: uppercase;
            background: var(--accent);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 14px 32px;
            cursor: pointer;
            transition: transform 0.15s, box-shadow 0.15s, background 0.15s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-submit:hover {
            background: #c93518;
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(232,64,28,0.3);
        }

        .btn-submit:active { transform: translateY(0); }

        /* ── FILTER BAR ── */
        .filter-bar {
            display: flex;
            gap: 8px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .filter-btn {
            font-family: 'DM Sans', sans-serif;
            font-size: 0.78rem;
            font-weight: 500;
            letter-spacing: 0.04em;
            padding: 6px 16px;
            border-radius: 20px;
            border: 1.5px solid var(--border);
            background: transparent;
            color: var(--muted);
            cursor: pointer;
            transition: all 0.15s;
        }

        .filter-btn:hover, .filter-btn.active {
            border-color: var(--ink);
            background: var(--ink);
            color: var(--paper);
        }

        /* ── TABLE ── */
        .table-card {
            background: var(--card);
            border: 1.5px solid var(--border);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 32px rgba(0,0,0,0.06);
            animation: slideUp 0.5s 0.1s ease both;
        }

        .table-card-header {
            padding: 18px 24px;
            border-bottom: 1px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .table-card-title {
            font-family: 'Syne', sans-serif;
            font-size: 0.95rem;
            font-weight: 700;
        }

        .table-count {
            font-size: 0.75rem;
            color: var(--muted);
            background: var(--cream);
            padding: 4px 12px;
            border-radius: 20px;
            border: 1px solid var(--border);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: var(--cream);
        }

        th {
            font-size: 0.65rem;
            font-weight: 500;
            letter-spacing: 0.15em;
            text-transform: uppercase;
            color: var(--muted);
            padding: 12px 20px;
            text-align: left;
            border-bottom: 1px solid var(--border);
        }

        td {
            padding: 16px 20px;
            border-bottom: 1px solid var(--border);
            font-size: 0.9rem;
            vertical-align: middle;
        }

        tbody tr {
            transition: background 0.15s;
        }

        tbody tr:last-child td { border-bottom: none; }
        tbody tr:hover { background: var(--paper); }

        /* Company cell with avatar */
        .company-cell {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .company-avatar {
            width: 36px; height: 36px;
            border-radius: 8px;
            background: var(--ink);
            color: var(--paper);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Syne', sans-serif;
            font-weight: 800;
            font-size: 0.85rem;
            flex-shrink: 0;
            letter-spacing: -0.02em;
        }

        .company-name {
            font-weight: 500;
            font-size: 0.92rem;
        }

        /* Status badges */
        .badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            font-size: 0.72rem;
            font-weight: 500;
            letter-spacing: 0.06em;
            padding: 4px 10px;
            border-radius: 20px;
            text-transform: uppercase;
        }

        .badge::before {
            content: '';
            width: 6px; height: 6px;
            border-radius: 50%;
            background: currentColor;
            flex-shrink: 0;
        }

        .badge-Applied   { background: #dbeafe; color: var(--info); }
        .badge-Interview { background: #fef3c7; color: var(--warning); }
        .badge-Offer     { background: #dcfce7; color: var(--success); }
        .badge-Rejected  { background: #fee2e2; color: var(--danger); }

        /* Type chip */
        .chip {
            font-size: 0.72rem;
            color: var(--muted);
            background: var(--cream);
            border: 1px solid var(--border);
            padding: 3px 10px;
            border-radius: 20px;
        }

        /* Description truncate */
        .desc-cell {
            max-width: 200px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            color: var(--muted);
            font-size: 0.85rem;
        }

        /* Delete button */
        .btn-delete {
            font-family: 'DM Sans', sans-serif;
            font-size: 0.78rem;
            font-weight: 500;
            background: transparent;
            color: var(--muted);
            border: 1.5px solid var(--border);
            border-radius: 6px;
            padding: 6px 12px;
            cursor: pointer;
            transition: all 0.15s;
            white-space: nowrap;
        }

        .btn-delete:hover {
            background: #fee2e2;
            border-color: var(--danger);
            color: var(--danger);
        }

        /* Empty state */
        .empty-state {
            padding: 80px 32px;
            text-align: center;
        }

        .empty-icon {
            font-size: 3rem;
            margin-bottom: 16px;
            opacity: 0.4;
        }

        .empty-title {
            font-family: 'Syne', sans-serif;
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 8px;
            color: var(--ink);
        }

        .empty-sub {
            font-size: 0.88rem;
            color: var(--muted);
        }

        /* ── FOOTER ── */
        footer {
            text-align: center;
            padding: 24px;
            font-size: 0.75rem;
            color: var(--muted);
            border-top: 1px solid var(--border);
            letter-spacing: 0.05em;
        }

        /* avatar color palette based on first letter */
        .av-A, .av-B, .av-C { background: #1e3a5f; }
        .av-D, .av-E, .av-F { background: #7c2d12; }
        .av-G, .av-H, .av-I { background: #064e3b; }
        .av-J, .av-K, .av-L { background: #3b0764; }
        .av-M, .av-N, .av-O { background: #78350f; }
        .av-P, .av-Q, .av-R { background: #1e1b4b; }
        .av-S, .av-T, .av-U { background: #4a044e; }
        .av-V, .av-W, .av-X { background: #0c4a6e; }
        .av-Y, .av-Z        { background: #14532d; }
    </style>
</head>
<body>

<!-- ── HEADER ── -->
<header>
    <div class="logo">
        <span class="logo-dot"></span>
        JobTrack
    </div>
    <span class="header-tag">Career Command Center</span>
</header>

<!-- ── HERO ── -->
<div class="hero">
    <div class="hero-eyebrow">▸ Track every opportunity</div>
    <h1 class="hero-title">Your Job Hunt,<br><span>Organized.</span></h1>
    <p class="hero-sub">Log applications, track statuses, and never lose sight of an opportunity again.</p>
    <div class="stats-row">
        <div class="stat">
            <span class="stat-num" id="totalCount">0</span>
            <span class="stat-label">Total Applied</span>
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
    </div>
</div>

<!-- ── MAIN ── -->
<main>

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
        <form action="addJob" method="post" class="form-body">
            <div class="form-group">
                <label>Company Name</label>
                <input type="text" name="company_name" placeholder="e.g. Google" required />
            </div>
            <div class="form-group">
                <label>Role</label>
                <input type="text" name="role" placeholder="e.g. Software Engineer" required />
            </div>
            <div class="form-group">
                <label>Apply Date</label>
                <input type="date" name="applyDate" required />
            </div>
            <div class="form-group">
                <label>Status</label>
                <select name="status">
                	<option >Select
                    <option value="Applied">Applied</option>
                    <option value="Interview">Interview</option>
                    <option value="Offer">Offer</option>
                    <option value="Rejected">Rejected</option>
                </select>
            </div>
            <div class="form-group">
                <label>Application Type</label>
                <select name="application_type">
                	<option>Select
                    <option value="Online">Online</option>
                    <option value="Referral">Referral</option>
                    <option value="Walk-in">Walk-in</option>
                    <option value="Campus">Campus</option>
                </select>
            </div>
            <div class="form-group">
                <label>Job Description / Notes</label>
                <textarea name="job_description" placeholder="Paste key notes or JD highlights..."></textarea>
            </div>
            <button type="submit" class="btn-submit">
                <span>＋</span> Add Application
            </button>
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
                    <span class="table-card-title">Applications</span>
                    <span class="table-count" id="tableCount">Loading...</span>
                </div>
                <table id="jobTable">
                    <thead>
                        <tr>
                            <th>Company</th>
                            <th>Role</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Type</th>
                            <th>Notes</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="app" items="${applications}">
                            <tr data-status="${app.status}">
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
                                <td><div class="desc-cell" title="${app.job_description}">${app.job_description}</div></td>
                                <td>
                                    <form action="deleteJob" method="post" style="margin:0">
                                        <input type="hidden" name="company_name" value="${app.company_name}" />
                                        <button type="submit" class="btn-delete"
                                            onclick="return confirm('Delete ${app.company_name}?')">
                                            🗑 Delete
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>
</main>

<footer>JobTrack &nbsp;·&nbsp; Built with Spring MVC &amp; Hibernate</footer>

<script>
    // Count stats from table rows
    const rows = document.querySelectorAll('#jobTable tbody tr');
    const total = rows.length;
    const interviews = [...rows].filter(r => r.dataset.status === 'Interview').length;
    const offers     = [...rows].filter(r => r.dataset.status === 'Offer').length;

    document.getElementById('totalCount').textContent     = total;
    document.getElementById('interviewCount').textContent = interviews;
    document.getElementById('offerCount').textContent     = offers;

    const tc = document.getElementById('tableCount');
    if (tc) tc.textContent = total + ' record' + (total !== 1 ? 's' : '');

    // Set today as default date
    const dateInput = document.querySelector('input[type="date"]');
    if (dateInput) dateInput.valueAsDate = new Date();
</script>

</body>
</html>
