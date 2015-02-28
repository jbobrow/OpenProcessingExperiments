
int halfcir, wCen, yCen, clocir, halfcir1, halfcir2 ;  PImage a;int x;

void setup(){
  size(600,600);
}

void draw(){

  
  noStroke();
  noStroke();
  fill(225);
  //back img
a=loadImage("img3.png");
x=5;
image(a,0,0,600,600);

//time
wCen = width/2;
yCen = height/2;
  
  noStroke();
  smooth();
 
  fill(255);
  ellipse(300,300, 10, 10);
 
  float s = map(second(), 0,60,0 , TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 12, 0, 12,0, TWO_PI) - HALF_PI;
  stroke(0);
  clocir =140;
  halfcir = 90;
  halfcir1 = clocir/2-10;
  halfcir2 = clocir/2;
  strokeWeight(2);
  line(300,300, cos(s) * halfcir1 +  wCen, sin(s) * halfcir1 +yCen);
  strokeWeight(3);
  line(300, 300, cos(m) * halfcir + wCen, sin(m) * halfcir + yCen);
   strokeWeight(5);
  line(300, 300, cos(h) * halfcir2 + wCen, sin(h) * halfcir2 +yCen);
 }

