
import java.awt.datatransfer.*;
import java.awt.Toolkit;

PFont font;

//ボタン(白い範囲)の横幅と縦幅
int button_w = 150;
int button_h = 40;

//余白の設定
int yohaku_b_x = 20;
int yohaku_b_y = 15;

//タブの大きさと位置
float tab_w;
int tab_h = 60;
int tab_y = 400 - tab_h /2;

//現在のタブ
int now_tab;

//縦と横にボタンをいくつ配置するか
int tate = 6;
int yoko = 2;

//ボタンの番号
int num;

//顔文字の配置用配列
int kao_x[] = new int[tate*yoko];
int kao_y[] = new int[tate*yoko];

//選択枠の設定
//位置の配列
int select_x[] = new int[yoko];  
int select_y[] = new int[tate];
//枠のサイズ
int select_w = button_w + 10;
int select_h = button_h + 10;
//現在位置
int select_yoko;
int select_tate;

//顔文字の配列
//kao[現在のタブ番号][タブ内の順番]
String[][] kao = {
  {
    "(´-ω-`)", "( '◡' )", "(,'3 っ　)っ", "(*∩ω∩)", 
    "_(⌒(ﾉ・ω・)ﾉ", "(乂'ω')", "ﾍ(･ω･｡ﾍ)", "(∩´∀｀)∩", 
    "(ヾﾉ･∀･`)", "('･c_･` )", "（☍﹏⁰ ）", "_(-ω-_)⌒)_"
  }
  , 
  {
    "(* ´ω` *)", "─=≡Σ((( つ•̀ω•́)つ", "(๑╹◡<๑)-☆", "┐('～`；)┌", 
    ":( ﾞﾟ'ωﾟ'):", "((ﾟﾟддﾟﾟ ))", "ヾ(oﾟωﾟo)ﾉﾞ", "（＾・ω・＾）", 
    "_:(´ཀ`」 ∠):_", "( ´ ▽ ` )ﾉ", "_(⌒(_´ㅅ`)_", "(*˘▿˘人)"
  }
  , 
  {
    ":;(∩´﹏`∩);:", "(´º﹃º｀)", "(꒪⌓꒪)", "( •́ .̫ •̀ )", 
    "(っ'-'c)", "( ˇωˇ )", "(╬⊙д☉)", "(。･ω･｡)", 
    "ヽ(∵)ノ", "( ´∩Д∩)", "( ╹ㅂ╹)", "(｀-ω・)▄︻┻┳══一"
  }
  , 
  {
    "♡〜٩( ╹▿╹ )۶〜♡", "( ◠‿◠ )", "(*´ω｀*)", "(:3[__]=", 
    "╮( ╹ω╹ )╭", "∩(,,Ò‿Ó,,)∩ ", "(๑´ㅂ`๑)ŧ‹", "( ╹ސ╹)", 
    "( ╹◡╹)ノ ", "(•ㅂ•)", "(๑´ڡ`๑)", "-=三c⌒っ.ω.)っ"
  }
  , {
    "(๑ŏ﹏ŏ)", "(;꒪▱꒪)", "（◞‸◟）", "(ㆀ˘･з･˘)", 
    "(;꒪ㅂ꒪)ﾉｼΣﾊﾞﾝﾊﾞﾝ!!", "( •̀ω•́)", "(｡+･｀ω･´)", "⊂⌒~⊃｡Д｡)⊃", 
    "c⌒っ=' ^ ')っ =3", "┐(´ー｀)┌", "ʅ( ╹ω╹ )ʃ", "-"
  }
};

//総タブ数
int all_tabs = 5;

//タブ・背景の色
color[] color_ary = new color[all_tabs];
//タブの線の色
color tab_line_color = color(360);
//ボタン色
color button_color = color(360);
//選択枠の色
color select_color = color(0);
//顔文字の色
color kao_color = color(0);

void setup() {
  size(360, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);

  font = createFont("MS-Gothic", 20);
  textFont(font);

  textAlign(CENTER);
  rectMode(CENTER);

  //タブ色の定義
  for (int i = 0; i < all_tabs;i++) {
    color_ary[i] =  color(i * (360/all_tabs), 50, 100) ;
  }

  //タブの横幅
  tab_w = width/ all_tabs;

  //選択枠の位置を配列に定義
  for (int j = 0; j < yoko;j++) {
    select_x[j] = (j+1) * yohaku_b_x + button_w  * ((j+1) *2 - 1)/ 2;
  }
  for (int k = 0; k < tate; k++) {
    select_y[k] = (k+1) * yohaku_b_y + button_h * ((k+1)*2-1) / 2;
  }
}


void draw() { 
  //タブやボタンの配置などを行う関数
  frame();

  //顔文字を配置する関数
  kaomoji();

  //選択枠用の関数
  selecter();
}

void frame() {
  //背景色(タブ色と同じ)
  background(color_ary[now_tab]);

  //ボタンの配置
  for (int i = 0; i < tate;i++) {
    for (int j = 0; j < yoko; j++) {
      fill(button_color);
      noStroke();
      rect(j * (button_w + yohaku_b_x) + yohaku_b_x + button_w/2, i * (button_h + yohaku_b_y) + yohaku_b_y + button_h/2, button_w, button_h);
    }
  }

  //タブの配置
  for (int k = 0; k < all_tabs;k++) {
    fill(color_ary[k]);
    noStroke();
    rect((tab_w/2) + (k * tab_w), tab_y, tab_w, tab_h);
  }

  //タブの線
  stroke(tab_line_color);
  strokeWeight(5);
  if (now_tab != 0) {
    //横ライン左から
    line(0, tab_y - tab_h/2, now_tab * tab_w, tab_y - tab_h/2);
    //縦ライン左
    line(now_tab * tab_w, tab_y - tab_h/2, now_tab * tab_w, tab_y + tab_h/2);
  }
  if (now_tab != all_tabs - 1) {
    //横ライン右から
    line(now_tab * tab_w + tab_w, tab_y - tab_h/2, width, tab_y - tab_h/2);
    //縦ライン右
    line(now_tab * tab_w + tab_w, tab_y - tab_h/2, now_tab * tab_w + tab_w, tab_y + tab_h/2);
  }
}

void kaomoji() {
  //顔文字のx位置を配列に定義
  for (num = 0; num < tate*yoko;num++) {
    for (int i = 0; i < tate*yoko; i++) {
      if (i % 2 == 0) {
        kao_x[i] = yohaku_b_x + button_w/2;
      }
      else {
        kao_x[i] = yohaku_b_x * 2 + button_w * 3/2;
      }
    }

    //顔文字のy位置を配列に定義
    int count = 1;
    for (int j = 0; j < tate*yoko;j+=2) {
      kao_y[j] = yohaku_b_y * count + button_h * (count * 2 - 1)/ 2 + 5;
      kao_y[j+1] = kao_y[j];
      count++;
    }

    //顔文字の描画
    fill(kao_color);
    text(kao[now_tab][num], kao_x[num], kao_y[num]);
  }
}

void selecter() {
  //選択枠の描画
  noFill();
  stroke(select_color);
  rect(select_x[select_yoko], select_y[select_tate], select_w, select_h);
}

//キーボードを押した時の動き
void keyPressed() {
  //タブの左移動
  if (key == 'z') {
    now_tab--;
    if (now_tab < 0) {
      now_tab = all_tabs - 1;
    }
  }
  //タブの右移動
  if (key == 'x') {
    now_tab++;
    if (now_tab > all_tabs - 1) {
      now_tab = 0;
    }
  }
  //選択枠の左移動
  if (key == 'a') {
    select_yoko++;
    if (select_yoko > yoko -1) {
      select_yoko = 0;
    }
  }
  //選択枠の右移動
  if (key == 's') {
    select_yoko--;
    if (select_yoko < 0) {
      select_yoko = yoko -1;
    }
  }
  //選択枠の上移動
  if (key == 'e') {
    select_tate--;
    if (select_tate < 0) {
      select_tate = tate - 1;
    }
  }
  //選択枠の下移動
  if (key == 'd') {
    select_tate++;
    if (select_tate > tate - 1) {
      select_tate = 0;
    }
  }
  //クリップボードにコピー
  if (key == 'c') {
    if (select_yoko == 0) {
      setClipboardString(kao[now_tab][(select_tate*2)]);
    }
    else {
      setClipboardString(kao[now_tab][(select_yoko*2*select_tate+1)]);
    }
  }
}

//クリップボードにコピーする関数
// @p5info の中の人ありがとうございます！
void setClipboardString(String text) {
  Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
  StringSelection stringSelection = new StringSelection(text);
  clipboard.setContents(stringSelection, stringSelection);
}


