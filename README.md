# Patrol E2E テストサンプル

FlutterアプリでPatrolを使用したEnd-to-End（E2E）テストの実装例です。

## プロジェクト概要

このプロジェクトは、Patrol フレームワークを使ったFlutterアプリのE2Eテストを実装・実行するためのサンプルです。カウンターアプリを題材に、アプリのホーム画面への移動、アプリの再起動、状態の保持などの実際のユーザー操作をシミュレートしたテストを含んでいます。

### 特徴

- **クロスプラットフォーム対応**: iOS、Android、Webでテスト実行可能
- **ネイティブ操作**: ホーム画面への移動、アプリの再起動などの操作
- **状態保持テスト**: アプリ再起動後の状態確認
- **実デバイス・シミュレーター両対応**: 開発環境に合わせて柔軟にテスト実行

## セットアップ

### 前提条件

- Flutter SDK (3.0.0以上)
- Dart SDK
- iOS: Xcode、iOS シミュレーター
- Android: Android Studio、Android エミュレーター

### 依存関係のインストール

```bash
flutter pub get
```

### Patrol CLI のインストール

```bash
dart pub global activate patrol_cli
```

## テスト実行

### 基本的なテスト実行

```bash
patrol test -t integration_test/example_test.dart
```

### プラットフォーム指定でのテスト実行

#### iOS シミュレーター
```bash
patrol test -t integration_test/example_test.dart -d ios
```

#### Android エミュレーター
```bash
patrol test -t integration_test/example_test.dart -d android
```

### 特定デバイスでのテスト実行

デバイス一覧を確認:
```bash
flutter devices
```

特定デバイスを指定:
```bash
patrol test -t integration_test/example_test.dart -d "デバイスID"
```

## テスト内容

### `integration_test/example_test.dart`

カウンターアプリのE2Eテストを実装しています:

1. **アプリ起動**: カウンターアプリを起動
2. **カウンター操作**: インクリメントボタンを2回タップ（カウント: 2）
3. **ホーム画面移動**: ネイティブのホーム画面に移動
4. **アプリ再起動**: アプリを再度開く
5. **状態確認**: カウンターの値が保持されていることを確認
6. **追加操作**: さらに1回インクリメント（カウント: 3）
7. **最終確認**: 最終的なカウンター値が3であることを検証

## プロジェクト構造

```
patrol_sample/
├── lib/
│   └── main.dart                    # メインアプリケーション
├── integration_test/
│   ├── example_test.dart           # E2Eテストファイル
│   └── test_bundle.dart            # Patrol生成ファイル（自動生成）
├── android/                        # Android設定
├── ios/                            # iOS設定
├── pubspec.yaml                    # 依存関係設定
└── CLAUDE.md                       # プロジェクト固有設定
```

## 対応プラットフォーム

- ✅ **Android**: 完全対応（エミュレーター・実機）
- ✅ **iOS**: 完全対応（シミュレーター・実機）
- ⚠️ **Web**: 基本機能のみ（ネイティブ操作制限あり）

## トラブルシューティング

### iOS でのビルドエラー

1. Xcode プロジェクトをクリーンビルド:
   ```bash
   flutter clean
   rm -rf ios/Pods ios/Podfile.lock
   flutter pub get
   ```

2. CocoaPods の更新:
   ```bash
   sudo gem install cocoapods
   ```

### Android でのストレージエラー

エミュレーターの容量不足の場合:
1. AVD Manager でエミュレーターの容量を増やす
2. エミュレーターをワイプデータして再起動

### デバイスが認識されない

```bash
flutter doctor
flutter devices
```

## 開発・カスタマイズ

### 新しいテストの追加

1. `integration_test/` ディレクトリに新しい `.dart` ファイルを作成
2. `patrol test -t integration_test/新しいテスト.dart` で実行

### テストのカスタマイズ

- Patrol の詳細な使い方: [Patrol公式ドキュメント](https://patrol.leancode.co/)
- Flutter integration_test: [Flutter公式ドキュメント](https://docs.flutter.dev/testing/integration-tests)

## ライセンス

このプロジェクトはサンプル・学習目的で提供されています。