
float r = 0;
float theta = 0;
float c= random(50, 100);
float p=0;


void setup() {
  size(400, 400);
  background(0);
  smooth();
}

void draw() {
  float x = r*cos(theta);
  float y = r*sin(theta);

  stroke(255, r*2, 0, 70);
  line(x+width/2, y+height/2, width/2, height/2); 
  line(x+width/2, y+height/2, r, r); 
  line(x+width/2, y+height/2, p+width, p+height); 
  noStroke();
  theta++;
  r++;
  p--;
  println(x);

  if (x>=200) {
    background(0);
    r=0;
    theta=0;
    p=0;
  }
  println("color"+ c);
}



