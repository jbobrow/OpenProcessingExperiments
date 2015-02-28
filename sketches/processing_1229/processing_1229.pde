
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import processing.opengl.*;

PeasyCam cam;
int centerX = 0;
int centerY = 0;
int afstand = 0;
int limiet = 355;
int aantal = 100;
int speed = 10;
boolean omhoog = true;

void setup(){
  size(800,500,OPENGL); 
  cam = new PeasyCam(this,800);
  cam.pan(0,200);

}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      aantal+=1;
    } 
    if (keyCode == DOWN) {
      aantal-=1;
    } 
    if (keyCode == LEFT) {
     speed+=1;
    } 
    if (keyCode == RIGHT) {
      speed-=1;
    } 
  }
}

void draw(){

  if(afstand>limiet){
    omhoog=false;
  }
  if(afstand<0){
    omhoog=true;
  }

  if(omhoog){
    afstand+=speed;
  }
  else{
    afstand-=speed;
  } 
  background(255);


  for(int i=0;i<aantal;i++){
    //line(centerX,0,centerY, centerX+255*cos(i),0, centerY+255*sin(i));
    //curve(beginpositie,punt,punt,eindpositie);
    stroke(afstand,0,100);
    noFill();
    bezier( 
    centerX+255*cos(i),255, centerY+255*sin(i), 
    centerX+255*cos(i),0, centerY+255*sin(i),
    centerX,afstand,centerY,
    centerX,0,centerY) ;
    pushMatrix();
    translate(0,254*2,0);
    bezier( 
    centerX+255*cos(i),-255, centerY+255*sin(i), 
    centerX+255*cos(i),0, centerY+255*sin(i),
    centerX,-afstand,centerY,
    centerX,0,centerY) ;
    popMatrix();
  }
}




