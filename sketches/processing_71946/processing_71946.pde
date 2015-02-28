
void setup() {
  size(600, 600);
  colorMode(HSB,200);
  noStroke();
  ellipse(width/2, height/2, 10, 10);
  background(0);
}

int tInc=0;
int c=0;
int cInc=1;

void draw() {
  for (int t=0;t<360;t+=60) {
    float x = c*sin(radians(t+tInc));
    float y = c*cos(radians(t+tInc));
    fill(c,200,200,30);
    ellipse(x+(width/2), y+(height/2), 5, 5);
  }
  
  tInc++;
  if(c > 200 || c < 0){
    cInc = cInc*(-1);
  }
   c+=cInc; 
  println(cInc);
}


