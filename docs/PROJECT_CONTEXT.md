# EchoMind Project Context

Version : 0.1
Last Update : 2026-08-05

---

# 프로젝트 소개

EchoMind는 스마트폰에 저장된 데이터를 AI가 이해하여
사용자가 자연어로 검색할 수 있는
Personal AI Search Engine이다.

슬로건

> Search your memories, not your folders.

---

# 프로젝트 목표

사용자는 파일 위치를 기억하지 않는다.

AI가 기억한다.

예)

- 민증 찾아줘
- 자동차 보험 보여줘
- 치과 영수증 찾아줘
- 작년에 제주도 갔던 사진 보여줘

---

# 핵심 컨셉

Google는 인터넷을 검색한다.

EchoMind는 휴대폰을 검색한다.

우리는 AI Chat App을 만드는 것이 아니다.

우리는 Personal Search Engine을 만든다.

---

# MVP 범위

Version 1

사진만 지원한다.

지원

- Gallery
- OCR
- Search

미지원

- PDF
- 메모
- 음성메모
- 연락처
- 캘린더

---

# 개발 방향

사진을 앱으로 저장하지 않는다.

사진은 원래 갤러리에 그대로 존재한다.

앱은

사진

↓

OCR

↓

메타데이터 생성

↓

검색 인덱스 생성

↓

SQLite 저장

↓

검색

구조를 사용한다.

---

# AI 사용 전략

AI는 모든 사진에 사용하지 않는다.

1차

OCR

↓

2차

이미지 분류

↓

문서만 AI 분석

↓

Embedding 생성

↓

검색

AI는 검색 품질을 높이는 역할만 수행한다.

---

# 데이터 흐름

사용자

↓

사진 권한 허용

↓

갤러리 스캔

↓

OCR

↓

AI (필요한 경우만)

↓

SQLite

↓

검색

↓

원본 사진 표시

---

# 기술 스택

Mobile

Flutter

Backend

FastAPI

Database

SQLite

↓

PostgreSQL

↓

pgvector

AI

OpenAI

OCR

Google ML Kit

Infra

Docker

AWS

GitHub

---

# 프로젝트 구조

EchoMind

mobile/

backend/

infra/

docs/

---

# 현재 진행 상황

Sprint 0 완료

완료

- Git 설치
- GitHub 생성
- VS Code 설치
- Flutter SDK 설치
- Android Studio 설치
- Android SDK 설치

아직 안 한 것

- Flutter 프로젝트 생성
- GitHub 연결
- 첫 실행

---

# 다음 목표

Sprint 1

Flutter 프로젝트 생성

↓

GitHub 연결

↓

Android Emulator 실행

↓

EchoMind 첫 화면 출력

↓

첫 커밋

---

# 결정 사항

원본 사진은 서버에 저장하지 않는다.

OCR 결과만 저장한다.

SQLite를 먼저 사용한다.

검색이 먼저다.

AI는 나중이다.

Flutter는 VS Code에서 개발한다.

Android Studio는 Emulator 용도로만 사용한다.

---

# 개발 규칙

기능 하나 끝날 때마다 Commit

커밋 규칙

feat:

fix:

docs:

refactor:

style:

chore:

---

# Roadmap

Sprint 0

개발환경

Sprint 1

Flutter

Sprint 2

Gallery

Sprint 3

OCR

Sprint 4

Search

Sprint 5

FastAPI

Sprint 6

AI

Sprint 7

AWS

Sprint 8

PlayStore

---

# 프로젝트 철학

기억을 저장하는 앱이 아니다.

찾는 시간을 없애는 앱이다.

AI는 기능이 아니라 엔진이다.

검색 경험이 서비스의 핵심이다.

---

# 채팅이 바뀌었을 경우

새로운 ChatGPT 채팅에서는

이 파일을 먼저 보여준다.

그러면 기존 프로젝트를 이어서 진행한다.
