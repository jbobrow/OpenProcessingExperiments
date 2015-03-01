
int i = 0;
void setup() {
  size(600, 600);
  colorMode(RGB, 600);
  //strokeWeight(5);
  
}
int y = 0;
void draw() {
  for (int x =0; x<width; x++) {
    i+=(.001*x);
   stroke(x/(y+1)*noise(i),50);//tweak this 
    line(x, y, width/2, height);
    
  }
  
if (y<height) {
    y+=20;
  } else {
    noLoop();
  }
}

