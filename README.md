# NEW_APP_NAME — Digital Relocation Platform

> **SWYNEX Technologies App Development Internship — Final Project Deliverable**  
> **Repository:** `SWYNEX-SubGuard-App-Concept`  
> **Architecture:** Flutter (Cross-platform Mobile/Web) + Django REST Framework + Docker + Prometheus/Grafana  
> **Status:** Completed & Production-Ready  

---

## 1. Project Overview

**NEW_APP_NAME** is a full-featured digital relocation platform engineered to assist foreign nationals, expatriates, international students, and newcomers in Kazakhstan to adapt smoothly to daily life. Relocating to a new country presents steep linguistic, legal, logistical, and cultural barriers.

NEW_APP_NAME bridges this gap by creating a human-centered, trusted peer-to-peer ecosystem connecting newcomers directly with verified local bilingual helpers, automated appointment booking, visa tracking, verified housing, and AI-assisted immigration support.

```
       Foreigner / Newcomer                            Local Helper
  ┌─────────────────────────────┐               ┌─────────────────────────────┐
  │ • Language barrier          │               │ • Multilingual local        │
  │ • Bureaucracy navigation    │ ◄─NEW_APP_NAME►│ • Custom relocation services│
  │ • Housing & neighborhood    │    Platform   │ • Flexible hourly earnings  │
  │ • Community integration     │               │ • Verified reputation badge │
  └─────────────────────────────┘               └─────────────────────────────┘
```

---

## 2. Visual Identity: Dark Mirror & Reflective Glass

The application implements a custom **Dark Mirror / Reflective Glass / Polished Metal** visual design language:
- **Deep Black & Graphite Canvas:** `#090A0E` background with `#0E1017` elevation.
- **Reflective Glass Cards:** Multi-stop linear gradients (`#161A26` → `#0F121C`) with subtle border reflections (`#222738`).
- **Titanium & Champagne Highlights:** Elegant metallic accents (`#E5C86C`) and polished steel highlights (`#94A3B8`).
- **Controlled Specular Reflections:** Clean divider lines and subtle translucent overlays.
- **Consistent Visual Hierarchy:** Inter typography across mobile, tablet, and desktop breakpoints.

Branding is centralized in `lib/branding.dart`, ensuring instant customization without code refactoring across individual screens.

---

## 3. Technology Stack

### Frontend (Mobile & Web)
- **Framework:** Flutter 3.x (Dart 3.x)
- **Platforms:** Web, Android, iOS, macOS, Linux, Windows
- **Design System:** Material 3 Dark Theme + Custom Mirror Design System
- **State Management:** Native `ChangeNotifier` / `AnimatedBuilder` architecture
- **Maps:** `flutter_map` with OpenStreetMap tile layer and nominatim search
- **Payments:** `flutter_stripe` (Sandbox integration)
- **AI Engine:** Google Gemini Generative AI SDK
- **Telemetry:** PostHog analytics & Firebase Crashlytics

### Backend & API
- **Framework:** Django 4.2 LTS / Django REST Framework
- **Authentication:** Custom JWT auth + Google OAuth2 + 2FA OTP verification
- **Database:** PostgreSQL (Production) / SQLite3 (Development)
- **Asynchronous Tasks:** Celery + Redis broker
- **Caching:** Redis distributed cache with TTL & health probes
- **Payment Processing:** Stripe PaymentIntents & Bereke checkout integration
- **Security:** Rate limiting (5 attempts/IP), OWASP security headers, input sanitization

### DevOps, Monitoring & Reliability
- **Containerization:** Docker & Docker Compose multi-service architecture
- **Metrics & Observability:** Prometheus custom business gauges & metrics exporter
- **Dashboards:** Grafana with automated datasource provisioning
- **Alerting:** Alertmanager with Telegram notifications template
- **Secrets Scanning:** TruffleHog CI security workflow
- **Test Automation:** Pytest suite with 77%+ test coverage threshold

---

## 4. Repository Structure

```text
SWYNEX-SubGuard-App-Concept/
├── lib/                             # Flutter Application Source
│   ├── main.dart                    # App entry point, Dark Mirror theme
│   ├── branding.dart                # Centralized application branding configuration
│   ├── mirror_theme.dart            # Reflective Glass & Metal design tokens
│   ├── views.dart                   # Core screen implementations & dialogs
│   ├── state.dart                   # Reactive application state manager
│   ├── models.dart                  # Domain models (User, Order, Payment, Housing)
│   ├── api_service.dart             # REST API HTTP client with JWT handling
│   ├── stripe_payment_screen.dart   # Stripe payment sheet & web checkout UI
│   ├── payment_service.dart         # Payment backend communication
│   ├── gemini_service.dart          # AI Assistant immigration integration
│   ├── map_view.dart                # OpenStreetMap geolocation & search
│   ├── visa_views.dart              # Visa regulations & rules viewer
│   ├── airport_view.dart            # Airport pickup reservation screen
│   ├── roadmap_screen.dart          # Step-by-step settlement checklist
│   └── l10n/                        # Multi-language localization (EN, RU, ZH)
├── backend/                         # Django Backend
│   ├── core/                        # Django Core Application
│   │   ├── models.py                # Database models (AppUser, Order, AppEvent)
│   │   ├── views.py                 # REST API endpoints & payment webhooks
│   │   ├── security.py              # JWT tokens, password hashing, 2FA
│   │   ├── cache.py                 # Redis caching layer
│   │   ├── metrics_gauges.py        # Prometheus business metric gauges
│   │   ├── tasks.py                 # Async background tasks
│   │   └── templates/admin/         # KPI Dashboard template
│   ├── backend/                     # Django Project Settings
│   │   ├── settings.py              # Environment configuration & middleware
│   │   └── urls.py                  # Routing configuration
│   ├── Dockerfile                   # Gunicorn production container
│   └── requirements.txt             # Python dependencies
├── monitoring/                      # Observability Infrastructure
│   ├── prometheus/                  # Prometheus scraping rules & alerts
│   ├── grafana/                     # Grafana datasources
│   └── alertmanager_tmpl/           # Telegram alert templates
├── tests/                           # Automated Pytest Suite
│   ├── e2e/                         # End-to-end user flows (Auth, Payments)
│   ├── integration/                 # API endpoint and database tests
│   └── unit/                        # Security, caching, metrics unit tests
├── docker-compose.yml               # Multi-container orchestration
└── render.yaml                      # Render cloud deployment specification
```

---

## 5. Internship Tasks Implementation Status

### Task 1 — App Concept & Screen Flow: ✅ Complete
- Problem definition, user personas, service tiers, monetization strategy, and flow charts documented and verified.

### Task 2 — Core App Screens: ✅ Complete
- **Authentication & Onboarding:** Dual-role selection (Foreigner / Local Helper), Google OAuth, country selector.
- **Home Dashboard:** Settlement roadmap progress, priority tasks, worker mini-panel, quick actions.
- **Services Hub:** Complete catalog of relocation services with interactive routing.
- **IIN Queue Booking:** City and PSC/ЦОН selector, date/time appointment picker.
- **Housing Directory:** Filter by district, property type (flat, dorm, hotel), verified badges, interactive map.
- **Visa & Documents:** Visa-free stay calculator, document checklist, EDS guide.
- **Airport Pickup:** Arrival date/time, flight number, vehicle class selector.
- **Account & Profile:** Editable user profile, active subscription badge, order history.

### Task 3 — App Features & State Management: ✅ Complete
- **State Management:** Reactive `AppState` managing authentication tokens, language, task completion, favorites, and cart.
- **AI Assistant:** Context-aware immigration assistant powered by Gemini with offline heuristic fallbacks.
- **Payment Processing:** Full Stripe checkout integration with success/cancel return handling and Bereke payment fallback.
- **Favorites & Search:** Live search with debouncing for services and housing with persistent favorites state.
- **Multilingual Support:** Dynamic switching between English, Russian, and Chinese.

### Task 4 — Final App Project & Reliability: ✅ Complete
- **End-to-End Testing:** 42 automated tests covering auth, checkout, refunds, security, and metrics.
- **Security Hardening:** TruffleHog secrets scanning, password hashing with PBKDF2/Argon2, rate limiting.
- **Production Observability:** Prometheus business gauges exporter and Grafana dashboard provisioning.
- **Deployment Manifests:** Docker Compose and Render.yaml blueprints for automated cloud deployment.

---

## 6. Local Development & Setup Instructions

### Prerequisites
- Python 3.10+
- Flutter 3.x SDK
- Docker & Docker Compose (Optional for full stack)

### 1. Running the Backend
```bash
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Run migrations and start server
python manage.py migrate
python manage.py runserver 0.0.0.0:8000
```
Backend API will be accessible at: `http://localhost:8000/api/`  
API Documentation: `http://localhost:8000/api/docs/`

### 2. Running the Flutter Frontend
```bash
# In the repository root
flutter pub get

# Run on Chrome (Web)
flutter run -d chrome

# Run on macOS Desktop
flutter run -d macos

# Run on Connected Mobile Device / Emulator
flutter run
```

### 3. Running with Docker Compose (Full Stack)
```bash
docker-compose up --build
```
This launches:
- **Backend (Django):** `http://localhost:8000`
- **Redis Cache & Broker:** `localhost:6379`
- **Prometheus Exporter:** `http://localhost:9090`
- **Grafana Dashboards:** `http://localhost:3000`

---

## 7. Quality Assurance & Verification

### Executed Test Results

| Test Suite | Tests | Result | Coverage |
|------------|-------|--------|----------|
| **Backend Pytest (Unit, Integration, E2E)** | 42 | ✅ 42 Passed | 77.31% (Threshold: 70%) |
| **Django System Check** | 1 | ✅ 0 Issues | Clean |
| **Flutter Test Suite** | 4 | ✅ 4 Passed | Clean |
| **Flutter Web Build Compilation** | 1 | ✅ Successful | Output: `build/web` |

### Running the Tests Locally

```bash
# Run Backend Tests
PYTHONPATH=backend python3 -m pytest tests/ -v --cov=core

# Run Django Check
cd backend && python manage.py check

# Run Flutter Tests
flutter test
```

---

## 8. Branding Configuration

The application display name is centralized in:
`lib/branding.dart`

To update the application name for a commercial release, change the `appName` constant:
```dart
class AppBranding {
  static const String appName = 'YOUR_BRAND_NAME';
  ...
}
```
All screen headers, dialogs, legal terms, and assistant prompts reflect the change immediately.
