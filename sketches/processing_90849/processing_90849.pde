
class Flower {
  float x; 
  float y; 
  float p;
  int d;
  
 Flower(){
    d = 20;
    x = random(50, 575);
    y = random(390, 480);
    p = random(236, 359);
 }

     void display(){
      noStroke();
      fill(p, 100, 100);
      ellipse(x, y, d, d);
      }
    }

float a = 255;
float b = random(50, 575);
float c = random(415, 480);
float i;
Flower flower1;
Flower flower2;
Flower flower3;
Flower flower4;
Flower flower5;
Flower flower6;
Flower flower7;
Flower flower8;
Flower flower9;
Flower flower10;
Flower flower11;
Flower flower12;
Flower flower13;
Flower flower14;
Flower flower15;
 
void setup() {
size(800, 500);
colorMode(HSB, 360, 100, 100);
noStroke();
rectMode(CORNERS);
flower1 = new Flower();
flower2 = new Flower();
flower3 = new Flower();
flower4 = new Flower();
flower5 = new Flower();
flower6 = new Flower();
flower7 = new Flower();
flower8 = new Flower();
flower9 = new Flower();
flower10 = new Flower();
flower11 = new Flower();
flower12 = new Flower();
flower13 = new Flower();
flower14 = new Flower();
flower15 = new Flower();
}
 
void draw(){
//sky and grass
if(mouseX < 400){
  a = (mouseX*100/width);
  background(181, 19+a*2, 96);
  fill(107, a*=3, 99-a*.25);
  curveTightness(2.7);
  curve(0, 175, 0, 375, width, 375, width, 175);
  rect(0, 375, width, height);
}
if(mouseX > 400){
  a = (mouseX*75/width);
  background(181, 198-a*2.4, 96);
  fill(107, 170-a*2.3, a*=1.5);
  curveTightness(2.7);
  curve(0, 175, 0, 375, width, 375, width, 175);
  rect(0, 375, width, height);
}
 
//leaves
if(mouseX < 300){
  fill(107, a*=2, 99-(a*.25));
  ellipse(600, 200, 220, 220);
}
if(mouseX > 300){
  a = ((mouseX-300)*175/width);
  fill(107-a*1.5, 99-a*1.3, 30+a*1.35);
  ellipse(600, 200, 220, 220);
}

//flowers
  if((mouseX > 275) && (mouseX < 520)){
  flower1.display();
  flower2.display();
  flower3.display();
}
  if((mouseX > 200) && (mouseX < 540)){
  flower4.display();
  flower5.display();
}
  if((mouseX > 320) && (mouseX < 400)){
  flower6.display();
  flower7.display();
  flower8.display();
}
  if((mouseX > 300) && (mouseX < 555)){
  flower9.display();
  flower10.display();
  flower11.display();
}
  if((mouseX > 180) && (mouseX < 530)){
  flower12.display();
  flower13.display();
  flower14.display();
  flower15.display();
}

fill(3, 94, 22);
rect(585,220,615, 450);
 
 fill(255);
 text ("Drag mouse across the screen", 5, 495);
}

