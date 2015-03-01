

float x, y;
float angle = 0; 
float r = 500;
float diff = 1; 


void setup() {
  size(600, 600);
  background(255);

}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.5); 
  stroke(x*255,y*255,200, 50); 

  translate(width/2, height/2); 
  rotate(r); 


  ellipse(-200, -200, x/2, y);
  ellipse(200, 200, x/2, y);
  rect(0,0,x,y);
  

  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}



