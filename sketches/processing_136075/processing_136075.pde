
float x=15;
float y=20;

float a=10;
float b=10;


void setup(){
  size(700,700);
  background(0,0,random(255));
}
  
  
  void draw(){
    fill(random(255),random(100),random(150));
    stroke(5);
    frameRate(15);
    translate(350,350);
    rotate(x);
    rect(1+x,0,y,y);
    x=x+5;
    
    fill(random(35),random(200), random(95));
    stroke(10);
    frameRate(10);
    translate(100,100);
    rotate(a);
    ellipse(3+a,0,b,b);
    a=a+10;
  }
