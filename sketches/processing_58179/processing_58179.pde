
PFont font;

int num = 2;              //表示調整用

//曜日用配列
String[] days = {
  "Monday", "Tuesday", "Wednesday", "Thursday", 
  "Friday", "Saturday", "Sunday"
};

int today;                //今日が何番目の曜日か
int before;               //月曜日から今日まで何日間あったのか
int after;                //今日から日曜日まで何日間あるのか

int tmp_m;                //一時的な月用変数
int tmp_d;                //一時的な日用変数

float w_size;             //widthのfloat変換用
float minim_unit;         //ゲージの増加単位
float finished_minutes;   //今日の経過した分
float now_size;           //現時刻におけるゲージの長さ

float percent;            //今日の終了パーセンテージ

float line_x;             //今日のゲージ内で動く線のx軸用変数
float spd;                //線の移動スピード
float line_time;

int s_moji = 42 / num;          //文字の大きさ
int x_title;              //タイトルのx軸位置
int y_title = 70;         //タイトルのy軸位置
int x_percent = 10;
int y_percent;
int x_time;
int y_time;



//色用変数***************************************
color c_haikei = color(0);                  //背景色
color c_moji = color(255);                  //文字色
color c_before = color(0, 100, 0);            //月曜から今日までの終了した日のゲージ色
color c_today = color(0, 220, 0);             //今日のゲージ色
color c_after = color(200);                 //今日から日曜までの終了していないゲージ色
color c_today_line = color(200, 255, 200);    //今日のゲージの内で動く線の色

void setup() {
  //背景色の指定
  background(c_haikei);
  //描写をなめらかにする
  smooth();

  size(240, 400);  //480,800

    //使用可能なフォントリスト取得
  //  String[] fontList = PFont.list();
  //  println(fontList);

  //フォントの指定
  font = createFont("Monospaced-Bold", s_moji);
  textFont(font);

  //四角の始点を中央にする
  rectMode(CENTER);

  //画面の向きの固定（縦）
  orientation(PORTRAIT);

  //widthを使うのでこちらで定義
  x_title = width/2;
}

void draw() {
  //背景の描画
  background(c_haikei);

  //***常時表示***************************************
  //曜日計算
  date_to_day_of_the_week();

  //ゲージ表示
  draw_gauge();

  //タイトル表示
  fill(c_moji);
  textAlign(CENTER);      //文字の描写位置を中央に
  text("Your week Installer", x_title, y_title / num);


  //***タッチ時***************************************
  if (mousePressed == true) {
    //文字の設定
    fill(c_moji);
    textAlign(LEFT);
    textSize(20);

    //パーセンテージの表示
    text(nf(percent, 0, 1) + "% Installed...", 10, (((height-130/num)/7)*today)+160/num);
    textAlign(RIGHT);
    text(nf(hour(), 2) + ":" + nf(minute(), 2), width-10, ((height-130/num)/7)*today+160/num);
    textAlign(LEFT);
    textSize(s_moji);
  }

  //通常の画面***************************************
  else {
    //日付表示
    draw_day();

    //曜日表示
    for (int i =0 ;i < 7 ;i++) {
      fill(c_moji);
      textAlign(LEFT);
      text(days[i], 20, ((height-130/num)/7)*i+160/num);
    }
  }
}

void date_to_day_of_the_week() {
  //日曜が1で始まる1～7 の数字で返る
  Calendar cal = Calendar.getInstance();
  int week = cal.get(Calendar.DAY_OF_WEEK);

  if (week == 1) {
    today = 6;
  }
  else {
    today = week - 2;
  }

  before = today;
  after = 6 - today;
}

void draw_day() {
  textAlign(RIGHT);

  //今日の日付を表示
  Calendar calendar0 = Calendar.getInstance();
  fill(c_moji);
  text(nf(month(), 2)+"/"+nf(day(), 2), width-20, ((height-130/num)/7)*today+160/num); 

  //今日より前の日を表示
  //before = 0の時（=月曜日）は何もしない
  if (before > 0) {
    for (int i = before; i >= 1; i--) {
      //日付を表示
      calendar0.add(Calendar.DAY_OF_MONTH, -1);
      tmp_m = calendar0.get(Calendar.MONTH);
      tmp_d = calendar0.get(Calendar.DAY_OF_MONTH);
      fill(c_moji);
      text(nf(tmp_m+1, 2)+"/"+nf(tmp_d, 2), width-20, ((height-130/num)/7)*(i-1)+160/num);
    }
  }

  //今日より後の日を表示
  //after = 0の時（=日曜日）は何もしない
  Calendar calendar1 = Calendar.getInstance();
  if (after > 0) {
    for (int j = 1; j <= after; j++) {
      calendar1.add(Calendar.DAY_OF_MONTH, 1);
      tmp_m = calendar1.get(Calendar.MONTH);
      tmp_d = calendar1.get(Calendar.DAY_OF_MONTH);
      fill(c_moji);
      text(nf(tmp_m+1, 2)+"/"+nf(tmp_d, 2), width-20, ((height-130/num)/7)*(j+before)+160/num);
    }
  }
}

void draw_gauge() {
  //今日より後の日のゲージ
  for (int j = 0; j < 7;j++) {
    fill(c_after);
    //stroke(c_stroke);
    noStroke();
    rect(width/2, 145/num+95*j/num, width, 70/num);
  }

  //今日のゲージを計算
  w_size = width;
  minim_unit = w_size / (24*60);
  finished_minutes = hour() * 60 + minute();
  now_size = minim_unit * finished_minutes;

  //パーセントの計算
  percent = (now_size / w_size) * 100;

  //動くラインのスピードの計算
  line_time =100+ hour();
  spd = now_size / line_time;

  //今日のゲージを表示
  fill(c_today);
  rectMode(CORNER);
  noStroke();
  rect(0, 145/num+95*today/num-35/num, now_size, 70/num);
  rectMode(CENTER);

  //今日より前の日のゲージの表示
  if (before > 0) {
    for (int i = before; i >= 1; i--) {
      fill(c_before);
      noStroke();
      rect(width/2, 145/num+95*(i-1)/num, width, 70/num);
    }
  }

  //今日のゲージの動くライン
  stroke(c_today_line);
  strokeWeight(5);
  strokeCap(SQUARE);
  line(line_x, 145/num+95*today/num-35/num, line_x, 145/num+95*today/num+35/num);
  strokeWeight(1);
  //今日のゲージのラインを動かす
  line_x += spd;
  if (line_x > now_size) {
    line_x = 0;
  }
}

