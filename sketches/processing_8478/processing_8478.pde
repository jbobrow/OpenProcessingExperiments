
import processing.pdf.*;

void setup(){
  size(400,400);
  smooth();
  background(0);
  noStroke();

}

void draw(){
  noStroke();
 /* if (mousePressed){
    beginRecord(PDF, "/capturas/pdfs/recursion"+random(3000)+".pdf"); 

    background(0);
    translate(width/2,height/2);
    circle(width*2,10);

    endRecord();
  }
  else{*/
    background(0);
    translate(width/2,height/2);
    circle(width*2,10);
  //}
}

void circle(float r,float f){
  r *= 0.5;
  f += 30;
  fill(f);
  if (r > 1){
    pushMatrix(); 
    noStroke();
    ellipse(0,0,r,r);
    translate(r/4,0);
    rotate(radians(map(mouseX,0,width,0,180)));
    circle(r,f);
    popMatrix();

    pushMatrix();
    translate(-r/4,0);
    rotate(radians(map(mouseY,0,height,0,180)));
    circle(r,f);
    popMatrix();
  }
}






