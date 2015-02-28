
float r = 2;
float theta = 0;
float beta = 0;
float back = 0;

void setup() {
  size(200, 200);
  background(0);
  smooth();
}

void draw() {
  float x = r * cos(theta); //polar to cartesian conversion
  float y = r * sin(beta);

  noStroke();
  fill(back+200, back+255, back+50, 25);
  ellipse(x+width/2, y+height/2, r/5, r/5);

  theta += 0.02; //increment angle
  beta += 1;
  r+=0.02;
  println(x);
  
if(x>=100){
  background(0);
  r=2;
  
}

}



