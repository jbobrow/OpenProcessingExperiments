
void setup() {
  
  size(500,500);
  background(255);
  smooth();
  frameRate(20);
  
}

void draw() {
      float x;
      float y;
      float w;
      float h;
      float b;
      float c;
      float d;
      
//background of bubbles
  
  x = random(255);
  y = random(255);
  w = random(255);
  h = random(255);
  b = random(20);
  c = random(width);
  d = random(height);
  
//drawMyKirigami(){
    noStroke();
    fill(x,y,w,h);
    ellipse(c,d,b,b);
    ellipse(c+5,d+5,b,b);
    triangle(c,d,b,50,50,50);
 

     
}



