


PFont font;
float a=0.0;
float b=-20;
float speed = 10;
float dis=0.1;

void setup() {
  size(250, 250); 
  frameRate(100);
  font= loadFont("Kisstelle-48.vlw");
}

void draw()
{
  background(#f2bbb3);
  stroke(#1d1812,50);//floor
  strokeWeight(1.5);
  fill(#6f5c44);
  quad(90,140,170,140,250,197,0,197);
  stroke(#1d1812,20);
  strokeWeight(1.5);
  line(0,197,250,197);
  stroke(#1d1812);
  strokeWeight(0.5);
  line(90,0,90,140);
  line(170,0,170,140);
  smooth();
  fill(#856067,110);//background text
  textFont(font,50);
  text("D",115,90);



for(int i=0;i<50;i+=2){//bottom rect
  noStroke();
  smooth();
  fill(#6f5c44,20);
  quad(0,197,250,197,250,197+i,0,197+i);
}
  fill(#de605d);
  smooth();
  textFont(font,60);
  text("M6L3R",35,a);
  a=a+speed;// bouncing
  speed=speed+dis;
  if (a>=180){
  speed = speed*-0.46;
  } 
}


