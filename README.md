# Where Am I

현재 위치를 구글 맵으로 확인할 수 있는 Flutter 앱입니다.

## 주요 기능

- 현재 위치 표시
- 구글 맵 통합
- 실시간 위치 업데이트

## 시작하기

### 필수 조건

- Flutter SDK
- Android Studio 또는 VS Code
- Google Maps API 키

### 설치

1. 저장소 클론
```bash
git clone [repository-url]
cd where_am_i
```

2. 의존성 설치
```bash
flutter pub get
```

3. API 키 설정
- `lib/config/api_keys.dart` 파일 생성
- Google Maps API 키 설정

4. 앱 실행
```bash
flutter run
```

## 사용된 패키지

- google_maps_flutter: ^2.5.3
- geolocator: ^11.0.0
- permission_handler: ^11.3.0
- provider: ^6.1.2

## 라이선스

이 프로젝트는 MIT 라이선스 하에 있습니다.
