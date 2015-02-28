
/* 
 Daniel C. Young
 Kaleidoscope
 10/22/2011
 */

PImage drummer, piano, singer;
float x,y;

void setup(){
  size(600,600);
  
  drummer = loadImage("drummer.png");
  piano = loadImage("piano.png");
  singer = loadImage("singer.png");

}

void draw(){
  background(#1C032C);
  float mx = map(mouseX,0,width,0,250);
  float ma = map(mouseX,0,width,45,1);
  
  drawShape(singer, ma, mx);
  drawShape(piano, ma/2, mx+10);
  drawShape(drummer, 30, mx+20);
}

void drawShape(PImage _img, float _max, float _mx){
  pushMatrix();
  translate(width/2,height/2);
  for(float ang=0;ang<360-_max;ang+=_max){
    x = _mx * cos(radians(ang));
    y = _mx * sin(radians(ang));
    rotate(radians(ang));
    image(_img, x, y);
  }
  popMatrix();
}

