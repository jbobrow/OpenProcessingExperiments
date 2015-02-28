
void setup(){
  size(800,500);
  background(random(255),random(255),random(255));
  frameRate(.5);
}
int circle=0;
int a=0;
int b=0;
int c=0;

void draw(){
  a= int(random(2));
  b= int(random(2));
  c= int(random(2));
  if(a==1){
    noStroke();
    fill(255,random(255),random(255),150);
    rect(random(width)-50,random(height)-50,random(width)-50,random(height)-50);
  }
  if(b==1){
    fill(random(255),35,random(255),225);
    circle = int(random(50));
    ellipse(random(height),random(width),circle,circle);
  }
  if(c==1){
    stroke(1);
    line(random(height),random(width),random(height),random(width));
  }
}
