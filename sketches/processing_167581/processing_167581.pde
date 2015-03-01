

float x, y;
float angle = 0; 
float r = 300;
float d = 1; 


void setup() {
  size(600, 600);
  background(40,20,0);
}

void draw() {
fill(40,20,0);
  x = r * sin(angle); 
  y = r * cos(angle);

     strokeWeight(2); 
 stroke(30, 120, 150);
  translate(width/2, height/2); 
  rotate(r); 
   rect(0,0,x,y);
     

 angle = angle +10;
// angle += 300;
  r = r - d;
  if ( r == 0 || r == 300) { 
    d =  d * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }

 }

