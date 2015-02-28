
int d = 40;

float r = 0;
float g = 126;
float b = 30;

void setup(){
  size(400, 400, P2D);
  smooth(8);
  
}

void draw(){

  fill(r, g, b, 20);
  ellipse(pmouseX, pmouseY, d, d);
  
  if(pmouseY > 0 && mousePressed){
    d = d + 2;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  if(d > 500) {
    d = 0;

  }
  
}

void mouseReleased() {
  d = 0;
}
