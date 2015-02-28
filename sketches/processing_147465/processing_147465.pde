
int sz;
float theta;
color[] palette = {
  #FF8601, #FFF724, #2B2C67, #418BB5
};

void setup() {
  size(500, 300);
  noStroke();
  
  sz = width/8;
}


void draw() {
  rectMode(CORNER);
  for (int i=0; i<4; i++) {
    fill(palette[i%4]);
    rect(i*width/4, 0, width/4, height);
  }
  rectMode(CENTER);
  float x = map(sin(theta),-1,1, width/4-sz/2, width/2-sz/2+5);
  float x2 = map(sin(theta),-1,1, 3*width/4+sz/2, width/2+sz/2-5);  ;

  fill(#AC5B0E);
  rect(x, height/2, sz, 2*sz);
  rect(x2, height/2, sz, 2*sz);
  
  theta += 0.0523/4;
  
  //if (frameCount%1==0 && frameCount<121) saveFrame("image-###.gif");
  
}

