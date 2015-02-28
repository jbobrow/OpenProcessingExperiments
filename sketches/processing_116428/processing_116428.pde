
import processing.opengl.*;

void setup(){

  size(500, 500, OPENGL);
  background(255);
  frameRate(30);
  smooth();

}

void draw(){
  
  //OJOS
  pushMatrix();
  translate((width-100)/2, height/2-50);
  noFill();
  stroke(0);
  strokeWeight(2);
  ellipse(0, 0, 50, 100);
  fill(0);
  ellipse(12, 20, 10, 30);
  strokeWeight(10);
  line(-20, -50, 20, -60);
  strokeWeight(2);
  noFill();
  stroke(0);
  ellipse(100, 0, 50, 100);
  fill(0);
  ellipse(88, 20, 10, 30);
  strokeWeight(10);
  line(80, -60, 120, -50);
  popMatrix();
  
  //Pelo
  
  for ( int i= (width -150)/2 ; i <= width/2 + 80 ; i = i + 10) {
  
    strokeWeight(5);
    line(i, height/2-170, i, height/2-140);
  
  }   
  
  
  // oreja
  
  
   pushMatrix();
   translate((width -200)/2, height/2- 50);
   oreja();
   popMatrix(); 
   pushMatrix();
   rotateZ(radians(180));
   translate(-(width +200)/2, -height/2+50);
   oreja();
   popMatrix(); 
   
   //boca
   pushMatrix();
   noFill();
   stroke(0);
   strokeWeight(3);
   translate(width/2, height-200);
   ellipse(0, 0, 60, 10);
   popMatrix(); 
   
   // Barba
   
   
    for ( int i= (width -50)/2 ; i <= width/2 + 20 ; i = i + 4) {
  
    strokeWeight(2);
    line(i, height-140, i, height-100);
    
    }
   
   
 
 
  

}

void oreja(){

  
  strokeWeight(3);
  ellipse(0, 0, 20, 50);
  noStroke();
  rectMode(CENTER);
  rect(5, 0, 14, 50);
}  

