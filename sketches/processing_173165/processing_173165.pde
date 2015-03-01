
int iter = 30;
int maxtrans= 3;

void setup() {
  size(800, 800);
  smooth();
  
}

void draw() {
  float r = 0;

  background(255);
  noFill();
  noStroke();
  strokeWeight(2);
  translate(width/2, height/2);

 
  for (int i = iter ; i>0; i--) {
    r=i*15;
    if(i%2==0)fill(0);
    else fill(255);
    pushMatrix();
    rotate(radians((float)frameCount)*map(i,0,iter,1,maxtrans));
    translate(r/9, 0);
    ellipse(0, 0, r, r);
    popMatrix();
    
  }
 
}
