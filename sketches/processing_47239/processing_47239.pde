
import processing.opengl.*;

void setup(){
  size (800,800, OPENGL);
  fill (0,0,200,180);
  
}

void draw(){
  background(255);
  lights();
  pushMatrix();
    translate(width/2,height/2,0);
    rotateY(map(mouseX,0,width,0,PI*2));
    rotateX(map(mouseY,0,height,0,PI*2));
    drawShape();
    popMatrix();
}

void drawShape(){
  for(int i=0; i <360; i++){
  rotateZ(radians (1));
  beginShape();
    vertex(200,100,100);
    vertex(200,200,100);
    vertex(100,200,100);
    vertex(200,100,100);
  endShape();
}

translate(0,0,-200);
box(40);
ellipse(40,30,90,70);
triangle(100,100,100,1001,50,80);
}
                
                                
