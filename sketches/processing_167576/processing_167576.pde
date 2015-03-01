
//import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 200;
float diff = 1; 


void setup() {
  size(600, 600);
  background(0);
 // beginRecord(PDF, "every.pdf");
 
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(1); 
   stroke(random(250), 200, 255, 30);  

  translate(width/2, height/2); 
  rotate(r); 

// ellipse(00, 0, x, y);
  
  
 strokeWeight(3); 
   stroke(random(250), 200, 255, 30);    
  //ellipse(x, 0, x, 50);
 line( 0, 0, x, y); 
  line( 20, 0, x, y);  
 line( 30, 0, x, y); 

  angle = angle +50;
  r = r - diff;

  if ( r == 0 || r == 700) { 
    diff =  diff * -1;
  }
}


//void keyPressed() {
 // if (key == 'q') {
  //  endRecord();
  //  exit();
 // }
//}

