
//toyo univ. Takekiyo Ishikawa
//2012/1/30

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim; //Minim型変数
AudioPlayer player;  //サウンドデータ
FFT fft;    //フーリエ
PFont font;


PFont Font; // 時計表示用フォント 
float minutes; 
float angle;

int x = 0; 
int speed = 10; //ball speed

float radS = TWO_PI/360*35;
float camZ = -4500;
float scZ = -1000;

float xRotate = random(0);
float yRotate = random(0);
float zRotate = random(0);


float weight = random(0.6);

float r = random(-10, 5);
float strokeH = random(170, 255);
float strokeS = random(150, 255);
float strokeB = random(160, 255);
float a = random(50, 255);



int[][] va = {
  {-100,-100,-10, 100,-100,-10}, 
  { 100,-100,-10, 100, 100,-10}, 
  { 100, 100,-10,-100, 100,-10}, 
  {-100, 100,-10,-100,-100,-10}, 
  {-100,-100, 10, 100,-100, 10}, 
  { 100,-100, 10, 100, 100, 10}, 
  { 100, 100, 10,-100, 100, 10}, 
  {-100, 100, 10,-100,-100, 10}, 
  {-100,-100,-10,-100,-100, 10}, 
  { 100,-100,-10, 100,-100, 10}, 
  { 100, 100,-10, 100, 100, 10}, 
  {-100, 100,-10,-100, 100, 10},
  
  {-130,-130,-40, 130,-130,-40}, 
  { 130,-130,-40, 130, 130,-40}, 
  { 130, 130,-40,-130, 130,-40}, 
  {-130, 130,-40,-130,-130,-40}, 
  {-130,-130, 40, 130,-130, 40}, 
  { 130,-130, 40, 130, 130, 40}, 
  { 130, 130, 40,-130, 130, 40}, 
  {-130, 130, 40,-130,-130, 40}, 
  {-130,-130,-40,-130,-130, 40}, 
  { 130,-130,-40, 130,-130, 40}, 
  { 130, 130,-40, 130, 130, 40}, 
  {-130, 130,-40,-130, 130, 40}, 
  
  { 200, 200, 20,-200, 200, 20},
  {-200, 200, 20,-200,-200, 20},
  {-200,-200, 20, 200,-200, 20}, 
  { 200,-200, 20, 200, 200, 20}, 
  { 200, 200,-20,-200, 200,-20}, 
  {-200, 200,-20,-200,-200,-20}, 
  {-200,-200,-20, 200,-200,-20}, 
  { 200,-200,-20, 200, 200,-20}, 
  { 200, 200, 20, 200, 200,-20},
  {-200, 200, 20,-200, 200,-20}, 
  {-200,-200, 20,-200,-200,-20}, 
  { 200,-200, 20, 200,-200,-20}, 
  
  { 280, 280, 15,-280, 280, 15}, 
  {-280, 280, 15,-280,-280, 15}, 
  {-280,-280, 15, 280,-280, 15}, 
  { 280,-280, 15, 280, 280, 15},
  { 280, 280,-15,-280, 280,-15}, 
  {-280, 280,-15,-280,-280,-15}, 
  {-280,-280,-15, 280,-280,-15}, 
  { 280,-280,-15, 280, 280,-15},
  { 280, 280, 15, 280, 280,-15}, 
  {-280, 280, 15,-280, 280,-15}, 
  {-280,-280, 15,-280,-280,-15}, 
  { 280,-280, 15, 280,-280,-15},
  
  { 300, 20, 90,-300, 20, 90}, 
  {-300, 20, 90,-300,-20, 90}, 
  {-300,-20, 90, 300,-20, 90}, 
  { 300,-20, 90, 300, 20, 90},
  { 300, 20,-90,-300, 20,-90}, 
  {-300, 20,-90,-300,-20,-90}, 
  {-300,-20,-90, 300,-20,-90}, 
  { 300,-20,-90, 300, 20,-90},
  { 300, 20, 90, 300, 20,-90}, 
  {-300, 20, 90,-300, 20,-90}, 
  {-300,-20, 90,-300,-20,-90}, 
  { 300,-20, 90, 300,-20,-90},
  
  { 430, 20, 190,-430, 20, 190}, 
  {-430, 20, 190,-430,-20, 190}, 
  {-430,-20, 190, 430,-20, 190}, 
  { 430,-20, 190, 430, 20, 190},
  { 430, 20,-190,-430, 20,-190}, 
  {-430, 20,-190,-430,-20,-190}, 
  {-430,-20,-190, 430,-20,-190}, 
  { 430,-20,-190, 430, 20,-190},
  { 430, 20, 190, 430, 20,-190}, 
  {-430, 20, 190,-430, 20,-190}, 
  {-430,-20, 190,-430,-20,-190}, 
  { 430,-20, 190, 430,-20,-190},
    
  { 400, 400, 40,-400, 400, 40},
  {-400, 400, 40,-400,-400, 40}, 
  {-400,-400, 40, 400,-400, 40},
  { 400,-400, 40, 400, 400, 40}, 
  { 400, 400,-40,-400, 400,-40}, 
  {-400, 400,-40,-400,-400,-40}, 
  {-400,-400,-40, 400,-400,-40}, 
  { 400,-400,-40, 400, 400,-40}, 
  { 400, 400, 40, 400, 400,-40}, 
  {-400, 400, 40,-400, 400,-40}, 
  {-400,-400, 40,-400,-400,-40}, 
  { 400,-400, 40, 400,-400,-40}
};
//rect's line


void setup()
{
  size(600, 600);
  frameRate(30);
  colorMode(HSB);
  noSmooth();
  noFill();
  background(255);
  smooth();
  
  //directionalLight(10, 20, 100, 0, 0, -1); //r,g,b,nx,ny,nz

  font = createFont("Arial", 14);
  textFont(font);

  minim = new Minim(this);
  
  player = minim.loadFile("Ankle Injuries.mp3", 1024); //music file
  player.loop();


  fft = new FFT(player.bufferSize(), player.sampleRate());
  println("sampling reate is " +player.sampleRate());
  println("spec size is " +fft.specSize());
  println("bandwidth is: " +fft.getBandWidth());

  //BandWidth*i=周波数
  for (int i = 0; i < fft.specSize(); i++)
  {  
    println(i + " = " + fft.getBandWidth()*i + " ~ "+ fft.getBandWidth()*(i+1));
  }

  smooth(); 
  Font = loadFont("STHeitiSC-Light-30.vlw"); // フォント読み込み
  textFont(Font); 
  textAlign(CENTER);
}

void draw()
{
  background(255);
  //drawBall();

  fft.forward(player.mix);

  float R = random(0, 255);
  float G = random(0, 255);
  float B = random(0, 255);
  float a = random(0, 255);



  fill(R, G, B, a);
  
  text("MUSIC", 205, 550);
  ellipse(350, 180, fft.getBand(16), fft.getBand(16));    //1h
  ellipse(375, 205, fft.getBand(28), fft.getBand(28));    //2h

  ellipse(385, 240, fft.getBand(23), fft.getBand(23));    //3h

  ellipse(375, 275, fft.getBand(29), fft.getBand(29));    //4h
  ellipse(350, 305, fft.getBand(37), fft.getBand(37));    //5h

  ellipse(310, 315, fft.getBand(21), fft.getBand(21));    //6h

  ellipse(265, 305, fft.getBand(41), fft.getBand(41));    //7h
  ellipse(245, 275, fft.getBand(33), fft.getBand(33));    //8h
  
  ellipse(235, 240, fft.getBand(18), fft.getBand(18));    //9h

  ellipse(245, 205, fft.getBand(20), fft.getBand(20));    //10h
  ellipse(270, 180, fft.getBand(25), fft.getBand(25));    //11h

  ellipse(310, 165, fft.getBand(13), fft.getBand(13));    //12h

  ellipse(310, 130, fft.getBand(20), fft.getBand(38));      //J
  ellipse(175, 130, fft.getBand(19), fft.getBand(30));      //T
  ellipse(450, 130, fft.getBand(15), fft.getBand(27));    //E



ellipse(350, 180, fft.getBand(61), fft.getBand(61));    //1h
  ellipse(375, 205, fft.getBand(82), fft.getBand(82));    //2h

  ellipse(385, 240, fft.getBand(132), fft.getBand(132));    //3h

  ellipse(375, 275, fft.getBand(92), fft.getBand(92));    //4h
  ellipse(350, 305, fft.getBand(73), fft.getBand(73));    //5h

  ellipse(310, 315, fft.getBand(121), fft.getBand(121));    //6h

  ellipse(265, 305, fft.getBand(141), fft.getBand(141));    //7h
  ellipse(245, 275, fft.getBand(133), fft.getBand(133));    //8h
  
  ellipse(235, 240, fft.getBand(118), fft.getBand(118));    //9h

  ellipse(245, 205, fft.getBand(202), fft.getBand(202));    //10h
  ellipse(270, 180, fft.getBand(52), fft.getBand(52));    //11h

  ellipse(310, 165, fft.getBand(213), fft.getBand(213));    //12h

  ellipse(310, 130, fft.getBand(64), fft.getBand(54));      //J
  ellipse(175, 130, fft.getBand(81), fft.getBand(61));      //T
  ellipse(450, 130, fft.getBand(100), fft.getBand(50));    //E


  fill(255, 0, 0);
  text("TOKYO", 180, 100); 
  text("JAPAN", 310, 100);
  text("in EARTH", 450, 100);
  text("CLOCK with", 90, 550);
  text("TAKEKIYO Ishikawa", 130, 580);

  int y = year(); 
  int mo = month(); 
  int d = day();
  int h = hour(); 
  int m = minute(); 
  int s = second();

  fill(100); 
  textSize(20); 
  text(d + "/" + mo + "/" + y, 310, 360);

  fill(100); 
  textSize(24); 
  text(nf(h, 2) + ":" + nf(m, 2) + ":" + nf(s, 2), 310, 390);

  translate(width/1.93, height/2.5); 
  fill(320); 
  noStroke(); 

  pushMatrix(); //H
  minutes = (hour()%12)*60 + minute(); 
  angle = minutes / (12*60) * 360;
  rotate(radians(angle));
  strokeWeight(1);
  stroke( 110, 0, 110 ); 
  line( 0, 0, 0, -40 );
  popMatrix();

  pushMatrix(); //M 
  angle = float(minute()) / 60 * 360; 
  rotate(radians(angle)); 
  strokeWeight(1);
  stroke( 110, 0, 110 );
  line( 0, 0, 0, -60 ); 
  popMatrix();

  pushMatrix(); //S
  angle = float(second()) / 60 * 360; 
  rotate(radians(angle));
  strokeWeight(1);
  stroke( 0, 300, 300 );
  line( 0, 0, 0, -70 );
  popMatrix();

  for (int i=0; i<va.length; i++) {
    draw3DLine(va[i][0], va[i][1], va[i][2], va[i][3], va[i][4], va[i][5], xRotate, yRotate, zRotate);
  }
  xRotate += TWO_PI/360;
  yRotate += TWO_PI/360;
  zRotate += TWO_PI/360;
}

void draw3DLine(float x1, float y1, float z1, float x2, float y2, float z2, float rx, float ry, float rz)
{
  float z1cash = z1;
  float z2cash = z2;
  z1 = x1 * sin(ry) - z1cash * cos(ry);
  z2 = x2 * sin(ry) - z2cash * cos(ry);
  x1 = x1 * cos(ry) + z1cash * sin(ry);
  x2 = x2 * cos(ry) + z2cash * sin(ry);

  z1cash = z1;
  z2cash = z2;
  z1 = y1 * sin(rx) - z1cash * cos(rx);
  z2 = y2 * sin(rx) - z2cash * cos(rx);
  y1 = y1 * cos(rx) + z1cash * sin(rx);
  y2 = y2 * cos(rx) + z2cash * sin(rx);

  float x1cash = x1;
  float x2cash = x2;
  float y1cash = y1;
  float y2cash = y2;

  x1 = x1 * sin(rz) + y1cash * cos(rz);
  x2 = x2 * sin(rz) + y2cash * cos(rz);
  y1 = y1 * sin(rz) - x1cash * cos(rz);
  y2 = y2 * sin(rz) - x2cash * cos(rz);

  float x1b = width/2.5 + x1 * (camZ + z1) * tan(radS/2) / (scZ + z1) * tan(radS/2);
  float y1b = height/2.5 + y1 * (camZ + z1) * tan(radS/2) / (scZ + z1) * tan(radS/2);
  float x2b = width/2.5 + x2 * (camZ + z2) * tan(radS/2) / (scZ + z2) * tan(radS/2);
  float y2b = height/2.5 + y2 * (camZ + z2) * tan(radS/2) / (scZ + z2) * tan(radS/2);

  translate(0, 0);

  stroke(strokeH, strokeS, strokeB);
  strokeWeight(weight);

  line(x1b, y1b, x2b, y2b);
}

//void drawBall(){ //move ball
  //x = x + speed; if ((x > width) || (x < 0)) {
    //speed = speed * 1;
  //}
  //float R = random(0, 255);
  //float G = random(0, 255);
  //float B = random(0, 255);
  //float a = random(0, 255);

  //fill(R, G, B, a);  
  
  //ellipse(x, 100, 800, 800);    
//}


void stop()
{
  // アプリケーション終了前にAudioPlayerを終了
  player.close();
  // minimを終了
  minim.stop();

  //ソフト全体を終了
  super.stop();
}


