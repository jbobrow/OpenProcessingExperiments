
int i = 0;
void setup() {
  size(600, 600);
  colorMode(HSB, 600);
  strokeWeight(.5);
  
}
int y = 0;
int y2 =600;
void draw() {
  for (int x =0; x<width; x+=10) {
    i+=(.001*x);
   stroke(x*noise(i), 600,600);//tweak this 
    line(x, y, width/2, height/2);
    line(x, y2, width/2, height/2);
    
  }
  
if (y<height/2) {
    y++;
    y2--;
  } else {
    noLoop();
  }
}
