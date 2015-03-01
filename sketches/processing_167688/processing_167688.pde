
float x, y;
float angle = 0; 
float r = 0;
float diff = 1; 
float c1 = 0;
float a = 0;
float b = 10;
void setup() {
  size(600, 600);
  background(0);

  colorMode(HSB, 100);
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle) ;


  c1 = c1+1;
  if(c1 > 100){
    c1 = 0;
  }
    stroke(c1, 100, 100, 100 ); 
    strokeWeight(4);
  translate(width/2, height/2); 
  


  rect (x/2, y/2, a, b);
  rect (x, y, a, b);
  angle = angle +0.5;
  r = r - diff;
 
  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}

