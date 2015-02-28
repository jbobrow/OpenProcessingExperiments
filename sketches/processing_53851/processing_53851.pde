
import processing.opengl.*;
float x,y,z,angle;



void setup(){
  size(1000,1000,OPENGL);
  y = 0;
  x = 0;
  angle = 0;
  smooth();
  background(255);
  //filter(BLUR,.01);
  
}

void draw(){
  ambientLight(60,60,255, 500,800,0);
  shininess(10.0);
  pushMatrix();
    rotateY(map(millis(),0,60,0,PI*2));
    rotateX(map(millis(),0,60,0,PI*2));
    //rotateZ(map(second(),0,60,0,PI*2));
    drawShape();
  popMatrix();
  
  
}

void drawShape(){
  x = cos(radians(angle)) * 1000 + width/2;
  y = sin(radians(angle)) * 1000 + height/2;
  z = cos(radians(angle)) + width/2;
  pushMatrix();
    translate(x,800,y);
    rotateY(cos(z));
    rotateX(sin(z));
    float timeLight = sin(radians(second()));
    timeLight = map(timeLight, -1,1,0,255);
    stroke(timeLight*second()/60,timeLight*minute()/60,timeLight*hour()/12);
    //fill(timeLight*second()/60,timeLight*minute()/60,timeLight*hour()/12);
    noFill();
    strokeWeight(.001);
    box(1,1,10*second());
  popMatrix();
  angle++;
}  






void mouseDragged(){ 
    pushMatrix();
      rotateZ(map(mouseX,0,width,0,PI*2));  
    popMatrix();
}
  



