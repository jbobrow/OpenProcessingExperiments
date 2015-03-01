


float x, y , a, b, c;
float angle = 0; 
float r = 400;
float diff = 1; 


void setup() {
  size(600, 600);
  background(255);
 
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);
  
  a = mouseX;
  b = mouseY;
  c = a+b;
  

//strokeWeight(5); 
//stroke(0, 50); 
// noStroke();
stroke (b,a,c,30);
  translate(width/2, height/2); 
  rotate(r); 

 ellipse(0, 0, a, b);
 // ellipse(a, 0, b, c);
//line( 0, 0, a, c); 

  angle = angle +0.5;
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

