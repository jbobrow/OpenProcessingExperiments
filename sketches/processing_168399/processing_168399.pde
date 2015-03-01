
int x=5;
float y;
void setup() {
  size (400, 400);
  //initialize y
  float n = norm(x, 0.0, 250.0);
  y=pow (n, 8);
}

void draw() {
  if(x < 400) {
    
    if(y<400) {
      float g = y++;
      fill (200, g=g-1, 19);
      noStroke ();
      ellipse (x, y, 20, y++);
      y +=10;
    }else{
      x+=5;
      
      //reset y
      float n = norm(x, 0.0, 250.0);
      y=pow (n, 8);
    }
  }
}

