

float x, y,z,a;
float angle = 0; 
float angle2 = 200;
float r = 600;
float diff = 1; 


void setup() {
  size(600, 600);
  background(0);
 
}

void draw() {

  noFill();
  stroke(0);



  x = r * cos(angle); 
  y = r * sin(angle);
  z = r * cos(angle2);
  a = r * sin(angle2);

  //red
  strokeWeight(0.1); 
  stroke(132,41,41); 

  translate(width/2, height/2); 
  rotate(r+20); 

  ellipse(0, 0, 50, y);
 
  //yellow
  strokeWeight(0.1); 
  stroke(123,163,22); 
 
  ellipse(0, 0, x, 50);
  //pink
   strokeWeight(0.1); 
  stroke(104,13,43,100); 
  triangle(0,0,z,y,y,x);
  
   //purple
   strokeWeight(0.1); 
  stroke(95,52,117,100); 
  triangle(0,0,x,z,z,x);
  
  
  


  //ellipse(x, 0, x, 50);
  //line( 0, 0, x, y); 

  angle = angle +2;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}

