
// Move mouse in quadrant to changecolor

float r=0;
float g=0;
float b=0;
void setup() {
  size(500, 500);

}

void draw() {
  background(r, g, b);
  stroke(255);
  line(width/2, 0, width/2, height);
   line(0,height/2,width,height/2);
  if (mouseX>width/2 && mouseY<height/2) {
    r=r+1;
    g=g-1;
    b=b-1;
  }
  else if (mouseX<width/2 && mouseY<height/2) {
    r=r-1;
    g=g-1;
    b=b+1;
  }
  if (mouseX<width/2 && mouseY>height/2) {
    r=r-1;
    g=g+1;
    b=b-1;
  }
  if (mouseX>width/2 && mouseY>height/2) {
    r=r+1;
    g=g+1;
    b=b+1;
  }
  if (r>255) {
    r=255;
  }
  if (r<0) {
    r=0;
  }
  if (g>255) {
    g=255;
  }
  if (g<0) {
    g=0;
  }
   if(b>255){
    b=255;
  }
  if(b<0){
    b=0;
  }
  
  smooth();
}


