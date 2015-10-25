### HOT TO RUN ###

    $ carton install
    $ carton exec plackup -s Starman -p 8080 -E prod --workers 10 --disable-keepalive app.psgi

# redisまわりの下準備

- `sudo service redis-server restart` なぜか終わらない上に、勝手にrestartしようとするのでdisableして手で起動しておく(最悪)
  - 本番はゆうきさんがなんとかしてくれるはず!!!
```
$ sudo systemctl disable redis-server.service
```
- 初期データセットつくる
  - mysql dbのfootprint見ていい感じにredisにデータセット作る。このスクリプト走らせると中でflushall走る。
```
$ cd deploy;carton exec -- perl -Ilib scripts/import_footprint.pl
```
  - aofのダンプファイル作って/home/isucon/に配置する。`/var/log/redis/redis.log`見てdumpの書き出し終わるまで待つ(たぶんすぐ終わる)
```
$ redis-cli config set appendonly yes
$ tail -F /var/log/redis/redis.log
$ cp /etc/redis/appendonly.aof /home/isucon/
```

こうやって用意しておくと、/initializeにアクセスしたときに/home/icuson/appendonly.aofの中身に戻るはず
