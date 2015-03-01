
float angle;
int amount = 5;
int rings = 8;
int numFrames = 180;

void setup(){
 size(500,500,P2D);
 smooth(8);
 noStroke();
}
 
void draw(){
  background(#1D0B38);
  
  fill(0);
  float x = ((frameCount % numFrames) / (float)numFrames);
  angle = (3*x*x - 2*x*x*x)*(TWO_PI/amount);
  for(int r = 1; r <= rings; r++) {
    for(int i = 0; i < amount*r; i++) {
      float offset = i*(TWO_PI/(amount*r))+(TWO_PI/7);
      color c = lerpColor(#F0C27B ,#4B1248 ,  1.0/rings*r);
      fill(c);
      ellipse(width/2+cos(angle+offset)*80*r/2,height/2+sin(angle+offset)*80*r/2,25,25);
    }
  }
  fill(#F0C27B);
  ellipse(width/2,height/2,25,25);
  
  if(keyPressed) {
    if(keyCode == LEFT) flipHori();
    if(keyCode == RIGHT) flipVert();
    if(keyCode == UP) {
      flipHori();
      flipVert();
    }
  }
    
  // saveFrame("output/###.gif");
  // if(frameCount == numFrames) exit();
}

void flipHori() {
  loadPixels();
  for (int x=width/2; x<width; x++) {
    for (int y=0; y<height; y++) {
      pixels[x+y*width] = pixels[(width-x)+y*width];
    }
  }
  updatePixels();
}

void flipVert() {
  loadPixels();
  for (int y=height/2; y<height; y++) {
    for (int x=0; x<width; x++) {
      pixels[x+y*width] = pixels[x+((height-y)*width)];
    }
  }
  updatePixels(); 
}
