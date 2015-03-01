
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
PFont font;
String msgs,msgs2;//経過時間
float rwowaka;//一番大きい音符の直径
float eye,eye1;//フクロウの目
float xx=730;//フクロウ初期位置x座標
float yy=80;//フクロウ初期位置y座標
color c=color(0);//目の色
float xw,yw,yww;//音符の中心座標
int radius=15;//使ってない
boolean Owlswitch=false;//フクロウスイッチ
color cc=color(0);//フクロウの目の色だと思ってたけどここ変えても意味ない
String  er="off";//スイッチ表示
float Owls=400;//フクロウの移動
int over=200;//右側の音符の移動
int rotot=10;//時計の一曲分の回転
int sentaku=0;
int saisei=1;
int seen;
int select;

Minim minim;
AudioPlayer[] song;
AudioMetaData[] meta;
FFT fft;

float rot;//一曲分の回転;
int x;//なぜ作ったし


void setup(){
  size(800,500);
  background(255);
  colorMode(HSB,359,99,99);
smooth();
minim=new Minim(this);
song=new AudioPlayer[5];
meta=new AudioMetaData[5];
for(int i=0; i<5;i++){
  song[0] = minim.loadFile("RyotaroArange.mp3");
  song[1] = minim.loadFile("RyotaroArange.mp3");
  song[2] = minim.loadFile("RyotaroArange.mp3");
  song[3] = minim.loadFile("RyotaroArange.mp3");
  song[4] = minim.loadFile("RyotaroArange.mp3");
  meta[i]=song[i].getMetaData();
}
   fft=new FFT(song[select].bufferSize(),song[select].sampleRate());
 font=loadFont("BrowalliaNew-Italic-48.vlw");
 textFont(font,24);
 textAlign(CENTER);
rwowaka = 200;
xw=752.5;
yww=350;
yw=350;
seen=sentaku;
if(random(10)>=9.5){
  c=color(359,80,80);
}
}
void draw(){
  smooth();
  if(seen==sentaku){
    fill(0,0,99);
    rect(0,0,width,height);
    fill(0,0,96);
    quad(0,100,0,height,738,height-32,373,100);
     fill(0,0,85);
        quad(0,200,0,height,263,height,263,460);
        fill(0,0,70);
        triangle(0,415,0,height,85,height);
        fill(0,0,85);
        rect(268,463,470,height);
    for(int i=0;i<5;i++){
    fill(0);
    wowaka(50+60*i,200+60*i,50);
    fill(0);
    rect(25+60*i,222+60*i,472,2);
    rect(25+240,222+240,472,4);
    rect(25+60*i,222+60*i,2,223);
    wowaka2(50+60*i,200+60*i,50);
    wowaka2(20,485,25);
    if(dist(20,485,mouseX,mouseY)<25/2){
      if(song[0].isPlaying() ||song[1].isPlaying() ||song[2].isPlaying() ||song[3].isPlaying() ||song[4].isPlaying() ){
      fill(350,99,99);
      ellipse(20+0.075*25,485-0.075*25,25-0.325*25,25-0.325*25);
    }else{
       fill(0,0,96);
      ellipse(20+0.075*25,485-0.075*25,25-0.325*25,25-0.325*25);
    }
    }
    if(dist(50,200,mouseX,mouseY)<25){
      fill(0,0,96);
      ellipse(53.75,200-3.75,33.75,33.75);
    }
    if(dist(110,260,mouseX,mouseY)<25){
      fill(0,0,96);
      ellipse(53.75+60,200-3.75+60,33.75,33.75);
    }
    if(dist(170,320,mouseX,mouseY)<25){
      fill(0,0,96);
      ellipse(53.75+120,200-3.75+120,33.75,33.75);
    }
    if(dist(230,380,mouseX,mouseY)<25){
      fill(0,0,96);
      ellipse(53.75+180,200-3.75+180,33.75,33.75);
    }
    if(dist(290,440,mouseX,mouseY)<25){
      fill(0,0,96);
      ellipse(53.75+240,200-3.75+240,33.75,33.75);
    }
    fill(0,0,60);
    hisigata(450+60*i,205+60*i,17,40);
    if(song[0].isPlaying()){
      hisigata2(450,205,17,40);
    }
    if(song[1].isPlaying()){
      hisigata2(450+60,205+60,17,40);
    }
    if(song[2].isPlaying()){
      hisigata2(450+120,205+120,17,40);
    }
    if(song[3].isPlaying()){
      hisigata2(450+180,205+180,17,40);
    }
    if(song[4].isPlaying()){
      hisigata2(450+240,205+240,17,40);
    }
    textFont(font,36);
    fill(0);
    noStroke();
    text("SELECTION MODE",180,100);
    rect(0,100,373,3);
    pushMatrix();
     translate(-40,160);
    rotate(radians(-45));
    rect(0,0,3,432);
    popMatrix();
    pushMatrix();
    translate(270,0);
    rotate(radians(-45));
    rect(0,145,3,512);
    popMatrix();
    rect(734,464,4,200);
    rect(264,464,4,200);
    pushMatrix();
    translate(580,300);
    rotate(radians(45));
    wowaka(-60,-8,20);
    fill(0);
    text("1223064",0,0);
    text("Tsuda Ryotaro",150,0);
    popMatrix();
    pushMatrix();
    translate(0,415);
    rotate(radians(45));
    rect(0,0,350,3);
    popMatrix();
    text("MP3player",480,70);
    rect(400,70,180,2);
    text("from Processing",600,150);
    textFont(font,24);
    text("ver1.08",720,150);
    textFont(font,36);
    rect(500,150,250,2);
    text(meta[0].fileName(),textWidth(meta[0].fileName())/2+150,220);
     text(meta[1].fileName(),textWidth(meta[1].fileName())/2+210,280);
      text(meta[2].fileName(),textWidth(meta[2].fileName())/2+270,340);
       text(meta[3].fileName(),textWidth(meta[3].fileName())/2+330,400);
        text(meta[4].fileName(),textWidth(meta[4].fileName())/2+390,460);
    }
  }
  if(seen==saisei){
    textFont(font,24);
  fill(0,0,30);
  ellipse(550,480,rwowaka+20,20);//なんだこれ
  fill(0,0,99);
  rect(0,0,100,height);//左側の残像なし部分
  fill(0,0,99,200);
  rect(100,0,width,height);//右側の残像あり部分
  fill(50);
  rect(135,465,300,2);//ファイル名下のバー
  rect(750,200,2,280);//Rバー
  rect(700,200,2,280);//Lバー
  text("R",752,497);
  text("L",702,497);
  text("high",782,210);
  text("low",782,475);
  float x=map(song[select].position(),0,song[select].length(),0,360);//一曲で一周
  float y=map(song[select].position(),0,song[select].length(),135,405);//一曲でバーが右から左
  //xw=y;
  rot=x;
  //時計の針部分の大きい音符
  pushMatrix();
  translate(300,165);
  rotate(radians(x));
  wowaka2(0,0,60);
  popMatrix();
  //時計の時刻部分の小さい音符
  pushMatrix();
  translate(300,160);
for(int i=-0;i<12;i++){
  fill(0);
  //wowaka2(0,-120,15);
  quad(0,-130,5,-120,0,-110,-5,-120);
  //drawOwl(0,-130);
  rotate(radians(30));
  //rotate(radians(30)+radians(rot)*rotot*1.002);
}
popMatrix();
//暇だから入れたquad
pushMatrix();
  translate(300,160);
for(int i=-0;i<6;i++){
  fill(0);
  //wowaka2(0,-120,15);
  quad(0,-140,8,-120,0,-110,-8,-120);
  //drawOwl(0,-130);
  rotate(radians(60));
  //rotate(radians(30)+radians(rot)*rotot*1.002);
}
popMatrix();
pushMatrix();
  translate(300,160);
for(int i=-0;i<4;i++){
  fill(0);
  //wowaka2(0,-120,15);
  quad(0,-155,10,-120,0,-105,-10,-120);
  //drawOwl(0,-130);
  rotate(radians(90));
  //rotate(radians(30)+radians(rot)*rotot*1.002);
}
popMatrix();
//音楽が鳴っているときの音と連動させる部分
  if(song[select].isPlaying()==true){
    for(int i=0;i<song[select].right.size()-1;i++){
      //一番大きい音符
    rwowaka=constrain(rwowaka+song[select].left.get(i)*song[select].left.get(i)*song[select].left.get(i)*song[select].left.get(i)*song[select].left.get(i)*over,200,240);
    //フクロウの目
    eye=constrain(eye+song[select].left.get(i)*0.5,6,15);
     eye1=constrain(eye1+song[select].left.get(i)*0.5,6,15);
     //フクロウのx座標y座標
    xx=constrain(xx-song[select].left.get(i)*song[select].left.get(i)*song[select].left.get(i)*song[select].left.get(i)*song[select].left.get(i)*Owls,100,730);
    yy=constrain(yy-song[select].right.get(i)*song[select].right.get(i)*song[select].right.get(i)*song[select].right.get(i)*song[select].right.get(i)*Owls,80,height-80);
    //LR音符の音連動
  yw=constrain(yw-song[select].right.get(i)*song[select].right.get(i)*song[select].right.get(i)*song[select].right.get(i)*song[select].right.get(i)*over,215,465);
  yww=constrain(yww-song[select].left.get(i)*song[select].left.get(i)*song[select].left.get(i)*song[select].left.get(i)*song[select].left.get(i)*over,215,465);
}
  }
  stroke(10);
  fill(10);
  rect(100,0,5,height);//左側の基盤の縦棒
  //rect(0,348,width,5);
   fft.forward(song[select].mix);
  stroke(120);
  for(int i=0;i<fft.specSize();i++){
    fill(10);
    //stroke(10);
    rect(100,height-i*8.1,-fft.getBand(i)*1.8,8);//音に連動した左側の棒
  }
  for(int i=0;i<song[select].left.size()-1;i++){
    stroke(50);
    //波形表示
    line(i,348+song[select].right.get(i)*50,i+1,348+song[select].right.get(i+1)*50);
    line(i,349+song[select].right.get(i)*50,i+1,349+song[select].right.get(i+1)*50);
    line(i,350+song[select].right.get(i)*50,i+1,350+song[select].right.get(i+1)*50);
    line(i,351+song[select].right.get(i)*50,i+1,351+song[select].right.get(i+1)*50);
    line(i,352+song[select].right.get(i)*50,i+1,352+song[select].right.get(i+1)*50);
  }
  wowaka(550,350,rwowaka);//大きい音符
   fill(0);
   textFont(font,30);
    text("PLAY MODE",565,345);
    textFont(font,24);
   //時刻表示
    int ss=song[select].position()/10;
    int sss=song[select].position();
    int s=(sss/1000) % 60;
    int m=song[select].position()/1000/60;
    //全時刻表示
    int tt=song[select].length()/10;
    int ttt=song[select].length();
    int t=(ttt/1000)%60;
    int tm=song[select].length()/1000/60;
    msgs=nf(m,2)+","+ nf(s,2) +","+nf((ss% 100),2);
    msgs2=nf(tm,2)+","+nf(t,2)+","+nf((tt%100),2);
    String msgss = msgs+"/"+msgs2;
    text(msgss,300,228);
    wowaka(135,452.5,30);//ファイルネームの左側の音符
    wowaka(752.5,yw,30);//Rの音符
    wowaka(702.5,yww,30);//Lの音符
    fill(0);
    text(meta[select].fileName(),textWidth(meta[select].fileName())/2+180,460);//ファイルネーム表示
    if(Owlswitch==true){
      //フクロウスイッチ
    pushMatrix();
    translate(xx,yy);
    drawOwl(0,0);
    popMatrix();
    }
    fill(cc);
    stroke(0);
    quad(730,73,726,80,730,87,734,80);//フクロウスイッチ
    text(er,730,110);//フクロウスイッチオンオフ表示
    fill(0,0,70);
    noStroke();
    rect(380,445,20,20);
      text("back",20,20);
  if(song[select].isPlaying()){
    //音楽再生中の動作
    rect(410,445,5,20);
    rect(420,445,5,20);
  }else{
    //音楽停止中の動作
    triangle(410,445,410,465,430,455);
  }
  if(mousePressed==true){
    if(dist(390,455,mouseX,mouseY)<10){
      xx=730;//フクロウ初期位置に
      yy=80;
      yw=350;//音符バー初期位置に
      yww=350;
      eye=0;//フクロウの目を初期位置に
      eye1=0;
      Owlswitch=false;
      er="off";
      cc=color(120);
      
}
  }
}
}
    void mouseClicked(){
        if(seen==sentaku){
    if(dist(50,200,mouseX,mouseY)<25){
      seen=saisei;
      select=0;
    }
    if(dist(110,260,mouseX,mouseY)<25){
      seen=saisei;
        select=1;
    }
    if(dist(170,320,mouseX,mouseY)<25){
      seen=saisei;
        select=2;
    }
    if(dist(230,380,mouseX,mouseY)<25){
      seen=saisei;
      select=3;
    }
    if(dist(290,440,mouseX,mouseY)<25){
      seen=saisei;
      select=4;
  }
  if(dist(450,205,mouseX,mouseY)<15){
    if(song[0].isPlaying()){
      song[0].pause();
    }else{
      song[0].play();
    }
  }
  if(dist(450+60,205+60,mouseX,mouseY)<15){
    if(song[1].isPlaying()){
      song[1].pause();
    }else{
      song[1].play();
    }
  }
  if(dist(450+120,205+120,mouseX,mouseY)<15){
    if(song[2].isPlaying()){
      song[2].pause();
    }else{
      song[2].play();
    }
  }
  if(dist(450+180,205+180,mouseX,mouseY)<15){
    if(song[3].isPlaying()){
      song[3].pause();
    }else{
      song[3].play();
    }
  }
  if(dist(450+240,205+240,mouseX,mouseY)<15){
    if(song[4].isPlaying()){
      song[4].pause();
    }else{
      song[4].play();
    }
  }
  if(dist(20,485,mouseX,mouseY)<25/2){
    if(song[0].isPlaying()||song[1].isPlaying()||song[2].isPlaying()||song[3].isPlaying()||song[4].isPlaying()){
    song[0].rewind();
   song[0].pause(); 
    song[1].rewind();
    song[1].pause();
     song[2].rewind();
     song[2].pause();
      song[3].rewind();
      song[3].pause();
       song[4].rewind();
       song[4].pause();
        }else{
          song[0].play();
          song[1].play();
          song[2].play();
          song[3].play();
          song[4].play();
        }
  }
        }
  if(seen==saisei){
      if(dist(390,455,mouseX,mouseY)<10){
        song[select].pause();
        song[select].rewind();
    }
  if(dist(420,455,mouseX,mouseY)<10){
  if(song[select].isPlaying()){
    //音楽再生中の動作
    song[select].pause();
  }else{
    //音楽停止中の動作
    song[select].play();
}
}
if(Owlswitch==false && dist(730,80,mouseX,mouseY)<10){
  cc=color(359,99,99);
  //フクロウスイッチオフのときの動作
  Owlswitch=true;
  er="on";
}else if(Owlswitch==true && dist(730,80,mouseX,mouseY)<10){
  cc=color(120);
  //フクロウスイッチオンのときの動作
  Owlswitch=false;
  er="off";
    }
  if(dist(20,20,mouseX,mouseY)<textWidth("back")/2){
  seen=sentaku;  
  //song[select].pause();
  //song[select].rewind();
   xx=730;//フクロウ初期位置に
      yy=80;
      yw=350;//音符バー初期位置に
      yww=350;
      eye=0;//フクロウの目を初期位置に
      eye1=0;
      Owlswitch=false;
      er="off";
      cc=color(120);
  }
    }
        }
void stop(){
  //おまじない
  song[select].close();
  minim.stop();
  super.stop();
}

