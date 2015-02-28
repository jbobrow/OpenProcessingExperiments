
//Liliana Osorio
//Comp Sci-Lab
//September 28,2010

float x, y;
float sX, sY;
float r;
float gravity;
float damping;
float friction;

void setup() {
  size(400, 400);
  smooth();
  background(23,46,123);

  sX = 2.25;
  sY = 0.0;
  r = 15.0;
  gravity = .03;
  damping = .80;
  friction = .85;

}

void draw() {
  
 
  fill(23,46,123);
  rect(-1, -1, width+1, height+1);
  
 for(int i=0; i<2; i++){
  fill(87,56,123);
  stroke(0);
  ellipse(x*.5, random(y), r*2, r*2);
  x+=sX;
  sY += gravity;
  y+=sY;
 }
  
  
  for(int i=0; i<2; i++){
  fill(187,66,143);
  stroke(0);
  ellipse(random(x*.6), y*.5, r*2, r*2);
  x+=sX;
  sY += gravity;
  y+=sY;
  }
  
  
  if (x>width-r){
    x = width-r;
    sX*=-1;
  } else if (x < r) {
    x = r;
    sX*=-1;
  } if (y>height-r){
    y = height-r;
    sY*=-1;
    sY *= damping;
    sX *= friction;
  } else if (y<r) {
    y = r;
    sY*=-1;
  }
  
  
}

