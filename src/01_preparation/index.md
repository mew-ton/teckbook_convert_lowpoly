# 作業準備

## 作業にあたって

本書執筆にあたり、サタリナ族のメイドさんのアバターをを参考資料として用意することにします。
私個人としても、このアバターはぜひQuest対応して使いたく、改変と平行して作業できるので丁度よかったです。

![サタリナさんはいいぞ](./src/01_preparation/images/satalina_san.png)

## 参考資料を見つけておこう

作業開始前に、参考資料にできるものを予め用意しておくと、作業効率や成果が劇的によくなるでしょう。
今回作業するにあたって、PC/Questの両対応アバターが同梱されている**人造アリス**ちゃんを参考にしました。

なお、本書においては、「ポリゴン数を削るための手法」をまとめたものであり、 **ローポリ向けの表現のしかたをまとめるものではない**のでご注意ください。そういった技法は他人から盗むなどして各自でなんとかしてください。

![人造アリスちゃんPC/Quest比較 (←Quest ⊿4732, →PC ⊿33362)](./src/01_preparation/images/artificial_alice_diff.png)

![ワイヤーフレームを表示させたもの。よく見てみると、服のシワ、指の形、髪の形、口の中など、細かいところで大きな違いがある。すごい。](./src/01_preparation/images/artificial_alice_diff_poly.png)


## 目標を設定する

さて、ここで一旦、アバターのQuest対応時におけるパフォーマンスランクの境界を確認しておきましょう。
以下は、公式 (2021/01/18時点) による、[アバターの要素別のパフォーマンスランクの境界値の一覧](https://docs.vrchat.com/docs/avatar-performance-ranking-system#quest-limits)から、今回必要になる部分のみを抜粋したものです。

: アバターの要素別パフォーマンスランクの境界値一覧 (一部)

||Excellent|Good|Medium|Poor|
|---:|:---|:---|:---|:---|
|**Polygons**|5,000|5,000|7,500|10,000|
|**Skinned Mesh Renderer**|1|1|2|2|
|**Mesh Renderer**|1|1|2|2|
|**Materials**|1|1|2|4|
|**Bones**|75|90|150|150|

また、以下の使用は公式により制限されています。

- Dynamic Bone 関連全て
- Cloths 関連全て
- `VRChat/Mobiles/`以下のシェーダー以外の利用 <br/>(`VRChat/Mobiles/Particles`以下もダメ)
- Lights
- AudioSources

ところで、`VRChat/Mobiles/Particles` についてですが、使うのは控えておきましょう。これを使うと透過のあるテクスチャを利用できるとかできないとか、様々な話がありますが、使わないに越したことはないです。もともと透過画像って負荷に繋がりますしね。

まとめると、Quest対応アバターでMediumランクを狙うなら、以下の条件を満たす必要があります

- ポリゴン数 .. 7500以下
- オブジェクト数 .. 2以下
- マテリアル数 .. 2以下
- ボーン数 .. 150以下
- テクスチャ .. アルファを利用しない

## 大まかな手順

ローポリ化の作業は、大まかに以下の手順で進めていきます

1. ポリゴン・ボーンの削減 (Blender)
2. 崩れたデータの復元 (Blender)
3. マテリアル・オブジェクトの結合, テクスチャのアトラス化 (Unity)

どれも作業量は多いです。作業毎にバックアップをとったり、集中力が続くように精神統一したりしましょう。

バックアップにはGitがおすすめです。精神統一にはヨガがおすすめです。どちらも本書においては紹介しません。

## 諦めるべきもの

かなり厳し目な制約を突破するためには、いくつか諦めなければならないものがあります。以下の条件は、私が考えている、**泣く泣く諦めて削除すべきポリゴン**です。場合によっては妥協案や回避策がありますが、基本的になくす前提で考えたほうが良いでしょう。

- 重なりのあるポリゴン, もしくは絶対に見えないポリゴン (服に隠れた素体部分, パンツなどの肌着 など)
- 限定的に見えるポリゴン (舌, 歯, しいたけ目の切れ込み部分 など)
- 透過テクスチャ (前髪, 頬染め, スカートのフリル, 半透明のエッチな下着 など)
- 見えづらいポリゴン (髪の裏面, スカートの裏麺, 服の裏面 など)

---
<div style="page-break-before:always"/>