
String bumps[];
float x;
float y;
float yspeed;
int jumptime;
int level;
int jumpmount;
float speed;
int frameratetime;
int frameratechange;
PFont txt;



void setup(){
  frameratechange = -1000;
  frameratetime = 0;
  frameRate(100);
  jumpmount = 0;
  size(400,400);
  bumps = loadStrings("bumps.txt");
  txt = loadFont("txt.vlw");
  jumptime = 0;
  textFont(txt);
  yspeed = 0;
  level = 1;
  x = 10;
  y = 200;
}

void draw(){
  speed = (60/frameRate);
  background(255);
  fill(0);
  if(frameratetime + 1000 <= millis()){
    frameratetime = millis();
    frameratechange = int(frameRate);
  }
  text(frameratechange,10,20);
  fill(255);
  if(x <= 1 && level == 1){
    x = 1;
  }
  if(x >= 399 && level == 1){
    bumps = loadStrings("bumps2.txt");
    level = 2;
    x = 10;
    y = 200;
  }
  if(x <= 1 && level == 2){
    bumps = loadStrings("bumps.txt");
    level = 1;
    x = 390;
    y = 200;
  }
  if(x >= 399 && level == 2){
    x = 399;
  }
  String bumpscurrent = bumps[int(x)];
  int bumpscurrentnum = int(bumpscurrent);
  String bumpscurrent2 = bumps[int(x+1)];
  int bumpscurrentnum2 = int(bumpscurrent2);
  String bumpscurrent3 = bumps[int(x-1)];
  int bumpscurrentnum3 = int(bumpscurrent3);
  if(level == 1){
    line(0,300,200,300);
    line(200,350,400,350);
  }
  else{
    line(0,210,100,210);
    line(100,350,200,350);
    line(200,110,400,110);
  }
  rect(x,y, 10,10);
  if(y >= bumpscurrentnum - 10){
    yspeed = 0;
    y = bumpscurrentnum - 10;
    jumpmount = 0;
  }
  if(keyPressed){
    if(keyCode == RIGHT && bumpscurrentnum2 + 10 >= y){
      x = x + (1*speed);
    }
    if(keyCode == LEFT && bumpscurrentnum3 + 10 >= y){
      x = x - (1*speed);
    }
    if(keyCode == UP && millis() - jumptime >= 1000 && jumpmount == 0){
      yspeed = -(4 * speed) ;
      jumptime = millis();
      jumpmount++;
    }
  }
  y += yspeed;
  yspeed += (0.1 * speed);
}

