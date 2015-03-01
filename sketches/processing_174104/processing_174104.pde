

float w = 5;
float h = 100;

float speed = 500;
float cycle = 100;
float amp= 250;

boolean inverse = false;

void setup() {
  size(400, 650, P2D);
}
void draw() 



{
  if (mousePressed) {
    background(300, 30, 5);
  }
  else {
    background(400,300,0);
  }
  
  

  stroke(#1F437C);
  
  fill(153);
  int cnt = 0;
  for (float x = 0 ;x<width ;x+=w) {
    for (float y = (int)(-amp) ;y<height + amp;y+=h*2) {

      float shift = sin(x/cycle +frameCount / speed)*amp;
      fill(inverse?255:0);
      rect(x, y+shift, w, h);
    }
    stroke(0);
    line(x, 0, x, height);
  }
  

}




