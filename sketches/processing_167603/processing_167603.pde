

//import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 


void setup() {
  size(600, 600);
  background(255);
  //beginRecord(PDF, "every.pdf");
}

void draw() {

 noFill();


  x = r * cos(angle); 
  y = r * sin(angle);

  //noStroke();
  stroke(random(360), 100, 100,100);

  translate(width/2 , height/2); 
  rotate(r); 

  ellipse(x+10,y*0.8,x+10,y*0.8);
 // ellipse(0, x/10, 0,y/10);
  //line(x, y/0.5,y,x/0.5); 

  angle = angle + 100;
  r = r - diff;

  if ( r == 0 || r == 600) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
