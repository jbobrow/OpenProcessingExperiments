
// Example: Two Car 
color c1,c2;
float x1,y1,x2,y2,speed1,speed2;


void setup() {
  size(400,200);
  c1= color(255,100,100);
  c2 = color(100,190,255);
  x1 =0;
  y1 =120;
  x2 = 0;
  y2 =70;
  speed1 =2;
  speed2 =1;

}

void draw() {
  background(255);
  drawRoad();
  x1 += speed1;
  if(x1>width) x1 = 0;
  
  x2 +=speed2;
  if(x2>width) x2 = 0;

stroke(0);
fill(c1);
rect(x1,y1,20,10);
rect(x1+3,y1,12,10);

fill(c2);
rect(x2,y2,20,10);
rect(x2+3,y2,12,10);
}

void drawRoad() {
 noStroke();
  fill(130,255,180); 
 rect(0,0,width,height);
 fill(140,160,160);
 rect(0,50,width,100);
 fill(255);
 rect(0,98,30,4);
 rect(50,98,30,4);
 rect(100,98,30,4);
 rect(150,98,30,4);
 rect(200,98,30,4);
 rect(250,98,30,4);
 rect(300,98,30,4);
 rect(350,98,30,4);
}
