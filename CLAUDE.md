# Patrol E2E テストプロジェクト設定

## 言語設定
- 全ての回答は日本語で行ってください

## プロジェクト概要
- PatrolによるFlutter E2Eテストの実行・テストプロジェクト
- ターゲットプラットフォーム: iOS, Android, Web

## コマンド

### 標準integration_test（推奨・動作確認済み）
- 通常テスト: `flutter test`
- E2Eテスト（iOS）: `flutter test integration_test/app_test.dart -d ios`
- E2Eテスト（Android）: `flutter test integration_test/app_test.dart -d android`
- E2Eテスト（特定デバイス）: `flutter test integration_test/app_test.dart -d <device_id>`

### Patrolテスト（要追加設定）
- Patrol CLIインストール: `dart pub global activate patrol_cli`
- Patrol テスト実行: `flutter pub global run patrol_cli:main test --target integration_test/counter_test.dart -d <device>`
- Patrol開発モード: `flutter pub global run patrol_cli:main develop --target integration_test/counter_test.dart -d <device>`

### その他
- アナライザー: `dart analyze`
- ビルド: `flutter build <platform>`
- iOS用ビルド: `flutter build ios`
- Android用ビルド: `flutter build apk` または `flutter build appbundle`
- Web用ビルド: `flutter build web`

## Patrol 固有設定
- テストファイルは `integration_test/` ディレクトリに配置
- `patrol` コマンドを使用してE2Eテストを実行
- iOS、Android、Web全てでテストが動作することを確認

## iOSでのPatrol設定について
PatrolのiOSテストを実行するには以下の追加設定が必要：

### ファイルベース設定（部分完了）
- ✅ UIテスト用ディレクトリ作成済み: `ios/RunnerUITests/`
- ✅ UIテスト用Swiftファイル作成済み: `ios/RunnerUITests/RunnerUITests.swift`
- ⚠️  Xcodeプロジェクト設定が必要: UIテストターゲットをpbxprojに追加

### Xcode経由設定（推奨）
1. Xcodeで `ios/Runner.xcodeproj` を開く
2. File > New > Target > iOS UI Testing Bundle
3. ターゲット名を `RunnerUITests` に設定
4. 既存の `RunnerUITests.swift` ファイルを追加

### 現在動作する方法
- ✅ 標準integration_test: 完全動作確認済み（iOS、Android）
- ❌ Patrol direct test: iOS UIテスト設定未完了

## コーディングスタイル
- 既存のコードパターンに従う
- 一貫した命名規則を使用する
- 適切なインデントとフォーマットを維持する
- Patrolのベストプラクティスに従う

## テスト
- 変更をコミットする前にE2Eテストを実行する
- 新機能には対応するE2Eテストを追加する
- iOS、Android、Web全プラットフォームでテストが通ることを確認する