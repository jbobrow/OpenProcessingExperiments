

//import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 20;
float diff = 1; 


void setup() {
  size(600, 600);
  background(0);
 // beginRecord(PDF, "every3.pdf");
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  
  strokeWeight(0.5); 
  
  stroke(r*0.1, r, r*0.8); 

  translate(width/2, height/2); 
  rotate(r); 

    
  ellipse(x, 0, x, 50);
  
  
  strokeWeight(0.8); 
  
  stroke(r, r*0.1, r*3); 

  translate( width/10, height/10); 
  rotate(r); 

    
   line( 0, 0, x*0.2, y*0.2); 
 

  strokeWeight(0.2); 
  stroke(r*2, r*0.8, r*0.2); 
  
    
    line(0, 0 , x*0.9, y*0.9); 
   

  angle = angle +10;
  r = r - diff;

  if ( r == 0 || r == 255) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
