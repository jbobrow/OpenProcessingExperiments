
int i = 0;
void setup() {
  size(600, 600);
  background(255);
  colorMode(RGB, 600);
  strokeWeight(2);
 
  
}
int y = 0;
void draw() {
 
  for (int x =0; x<width; x+=10) {
    i+=(.001*x);
   stroke(x*noise(i), 0*noise(i, i), y*noise(i, i,i),10);//tweak this 
    line(x, y, width/2, height/2);
   
   
   
  }
  
if (y<height) {
    y++;
  } else {
    noLoop();
  }
}
