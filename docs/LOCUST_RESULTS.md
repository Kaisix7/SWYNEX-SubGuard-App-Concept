# Locust Load Testing Results

This file contains the performance metrics captured during the pre-demo headless load test run.

## Test Configuration
- **Host:** `http://127.0.0.1:8000`
- **Simulated Users:** 100 concurrent users
- **Spawn Rate:** 10 users/second
- **Test Duration:** 2 minutes
- **Tool version:** Locust 2.44.4 (Python 3.14.5)

## Aggregated Performance Summary
- **Total Requests:** 1,983
- **Total Failures:** 0 (0.00% error rate)
- **Average Throughput:** 16.51 requests/second
- **Average Latency (Mean):** 23 ms
- **Median Latency (50%):** 9 ms
- **P90 Latency:** 39 ms
- **P95 Latency:** 61 ms
- **P99 Latency:** 100 ms
- **Max Latency:** 274 ms

---

## Detailed Endpoint Breakdown

| HTTP Method | Endpoint | Requests | Failures (%) | Avg Latency (ms) | Min Latency (ms) | Max Latency (ms) | Median Latency (ms) | Throughput (req/s) |
|---|---|---|---|---|---|---|---|---|
| **GET** | `/` | 238 | 0 (0.00%) | 10 | 3 | 32 | 8 | 1.98 |
| **GET** | `/api/checkout/` | 102 | 0 (0.00%) | 14 | 7 | 40 | 11 | 0.85 |
| **GET** | `/api/health/` | 197 | 0 (0.00%) | 10 | 4 | 26 | 8 | 1.64 |
| **POST** | `/api/login/` | 305 | 0 (0.00%) | 33 | 13 | 172 | 24 | 2.54 |
| **GET** | `/api/orders/` | 246 | 0 (0.00%) | 10 | 5 | 29 | 9 | 2.05 |
| **POST** | `/api/orders/` | 207 | 0 (0.00%) | 23 | 13 | 68 | 20 | 1.72 |
| **POST** | `/api/register/` | 281 | 0 (0.00%) | 62 | 44 | 274 | 53 | 2.34 |
| **GET** | `/health/` | 407 | 0 (0.00%) | 9 | 3 | 29 | 7 | 3.39 |
| **TOTAL** | **Aggregated** | **1,983** | **0 (0.00%)** | **23** | **3** | **274** | **9** | **16.51** |

## Percentiles Breakdown (ms)

| Method | Endpoint | 50% | 66% | 75% | 80% | 90% | 95% | 98% | 99% | Max |
|---|---|---|---|---|---|---|---|---|---|---|
| GET | `/` | 8 | 11 | 13 | 15 | 19 | 24 | 27 | 29 | 32 |
| GET | `/api/checkout/` | 11 | 14 | 17 | 20 | 26 | 31 | 35 | 37 | 40 |
| GET | `/api/health/` | 8 | 11 | 13 | 15 | 19 | 22 | 25 | 26 | 26 |
| POST | `/api/login/` | 24 | 31 | 36 | 41 | 62 | 80 | 100 | 130 | 172 |
| GET | `/api/orders/` | 9 | 12 | 13 | 14 | 17 | 20 | 23 | 27 | 29 |
| POST | `/api/orders/` | 20 | 25 | 28 | 31 | 40 | 48 | 59 | 63 | 68 |
| POST | `/api/register/` | 53 | 61 | 71 | 76 | 98 | 130 | 160 | 210 | 274 |
| GET | `/health/` | 7 | 9 | 11 | 12 | 16 | 20 | 23 | 25 | 29 |
| **-** | **Aggregated** | **9** | **13** | **17** | **20** | **39** | **61** | **84** | **100** | **274** |

---
*Report generated automatically before the Final Demo Day.*
