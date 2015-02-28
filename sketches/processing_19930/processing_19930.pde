
float myScaler = 0;
boolean isGoingRight = true;
void setup() {
  size(360,200);
  smooth();
  background(255);
}
void draw() {
  background(255);
  float angle = 0;
  for(int x = 0; x <= width; x += 1) {
    stroke(0,255,0,63);
    float y = map(sin(angle), -1, 1, height, 0);
    angle += PI / myScaler;
  line(x,y,0,0);
   stroke(255,0,0,63);
   line(x,y,width,height);
   stroke(0,0,255,63);
   line(x,y,width,0);
   stroke(255,255,0,63);
   line(x,y,0,height);
   
   
  }
  if(isGoingRight) {
    if(myScaler > (width * 2)) {
      isGoingRight = false;
    } 
    else {
      myScaler += 5;
    }
  } 
  else {
    if(myScaler < 60) {
      isGoingRight = true;
    } 
    else {
      myScaler -= 5;
    }
  }
}

