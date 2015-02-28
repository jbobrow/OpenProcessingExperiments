
float x,y;
float n;
int i;

void setup(){
size(640,640);
background(225,240,250);
}

void draw(){
  //line
  fill(255);
 for (int x = 0; x < 100; x++) {
  float n = norm(x, 0.0, 100.0); 
  float y = pow(n, 8); 
  y *= 100; 
  noStroke();
 // fill(y,2*x,255,1);
  rectMode(CENTER);
 
  fill(y/5+50,120,250,1);
  ellipse(320+y*3,320-x*2, 72+x,72+x);
  ellipse(320-y*3,320+x*2, 72+x,72+x);

  //point(x*2,y*2);
 }
}


