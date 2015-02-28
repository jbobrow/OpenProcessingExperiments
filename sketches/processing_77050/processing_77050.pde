
float angle=0.0;
float noiseval;
float xpos;

void setup() {
  size(700, 400);
  background(0);
  noiseval=0;
  xpos=-50;
}

void draw() {
  xpos+= 3;
  float valorSeno = sin(angle);
  float valorCoseno = cos(angle);
  float r = map(valorSeno, -1, 1, 0, 50);
  float g = map(valorSeno, -1, 1, 150, 0);
  float b = map(valorCoseno, -1, 1, 0, 200);
  float a = random(80,10);
  float d = random(10,70);
  float noiseval = 0;
  angle += 0.05;
  noiseval +=1;
  noStroke();
  fill(b,g,g,a);  
  ellipse(xpos-100, random(-150,120), d, d);
  fill(b,r,g,a); 
  ellipse(xpos-200, random(200,400), d, d);
  fill(g,b,r,a); 
  ellipse(xpos-50, random(300,500), d, d);
  fill(r,g,b,a); 
  ellipse(xpos, random(0,200), d, d);
  fill(g,b,b,a); 
  ellipse(xpos-50, random(100,300), d, d);
  
}
