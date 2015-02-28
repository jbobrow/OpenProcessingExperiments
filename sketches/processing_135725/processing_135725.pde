
float r = 0;
float p=0;
float q=0;
float u=0;
float theta = 0;
float c= random(50, 100);



void setup() {
  size(700, 700);
  background(0);
  smooth();
}

void draw() {
  float x = r*cos(theta);
  float y = r*sin(theta);

  stroke(r+150, r/2, 0, 70); 
  line(x+width/2, y+height/2, r, q+height);
  line(x+width/2, y+height/2, u+width, r); 

  theta++;
  r++;

  if (x>=500) {
    background(0);
    r=0;
    theta=0;
  }
}



