# Processing-OSC-Sample
OrpheをOSC経由で操作したりセンサの値を取得するサンプルです。
ご利用になるためにはOrphe Hub.appが必要です。

Orphe Hub.appはFacebookグループの[Orphe Developers Community](https://www.facebook.com/groups/1757831034527899/)に参加いただくことでダウンロードすることが出来ます。

- Receiver.pde: 各センサーの値を円のY座標にマッピングして表示するサンプル
<img width="256" alt="screen shot 2017-07-07 at 15 16 06" src="https://user-images.githubusercontent.com/1403143/27948390-a1caa216-6334-11e7-8217-095f111fd19b.png">

- Sender.pde: クリックした色でOrpheを光らせるサンプル
<img width="256" alt="screen shot 2017-07-07 at 15 16 28" src="https://user-images.githubusercontent.com/1403143/27948418-b1912b52-6334-11e7-8076-3eb78e0704ec.png">

## Requirements
- Processing 3
- oscP5 (Scketch -> Import Library -> Add Library ->oscP5を検索)
