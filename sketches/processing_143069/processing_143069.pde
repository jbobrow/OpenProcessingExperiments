
Rocket r1;
Rocket r2;
 
void setup() {
  size(300,850,JAVA2D);
  smooth();
  frameRate(60);
  r1=new Rocket(color(255,0,0),100,825,-125);
  r2=new Rocket(color(0,255,0),200,825,-120);
}
 
void draw() {
  background(#C9F5FF);
  r1.display();
  r1.go();
  r2.display();
  r2.go();
}
 
class Rocket {
  color c;
  float xpos;
    float ypos;
    float yspeed;
    Rocket(color tempC, float tempXpos, float tempYpos, float tempYspeed) {
    c=tempC;
    xpos=tempXpos;
    ypos=tempYpos;
    yspeed=tempYspeed;
  }
  void display() {
    noStroke();
    fill(#ff9A03);
    triangle(xpos-7.5,ypos+26,xpos,ypos+45,xpos+7.5,ypos+26);
    stroke(c);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,15,50);
    rect(xpos-10,ypos+17.5,5,18);
    rect(xpos+10,ypos+17.5,5,18);
    triangle(xpos-7.5,ypos-25,xpos,ypos-45,xpos+7.5,ypos-25);
    }
  void go() {
    ypos=ypos+yspeed*0.001;
    if(ypos<750){
      ypos=ypos+yspeed*0.003;
    }
      if(ypos<675) {
      ypos=ypos+yspeed*0.005;
     }
     if(ypos<350){
       ypos=ypos+yspeed*0.009;
     }
    if(ypos<-150){
      ypos=825;
  }
  }
   
}

