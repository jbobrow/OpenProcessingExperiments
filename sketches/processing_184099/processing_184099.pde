
float x,y,z;
int counter;

void setup() {  //setup function called initially, only once
  size(1000, 1000,P3D);
  x = width/2;
  y = height/2;
  z = 0;
  counter = 0;
}

void draw() {  //draw function loops
  background(209,246,134);
  translate(x,y,z);
  //rectMode(CENTER);
  fill(179,120,211);
  rotateY((counter*PI)/90);
  rotateX((counter*PI)/90);
  rotateZ((counter*PI)/90);
  //rect(0,0,100,100);
  //noFill();
  fill(209,246,134);
  box(401 + sin(counter/ 25)*140, 200 + sin(counter/ 25)*160,200 + sin(counter/ 25)*160);
  fill(209,246,134);
  box(200 + sin(counter/ 25)*160, 200 + sin(counter/ 25)*160,401 + sin(counter/ 25)*140);
  fill(209,246,134);
  box(200 + sin(counter/ 25)*160, 401 + sin(counter/ 25)*140,200 + sin(counter/ 25)*160);
  fill(179,120,211);
  box(400 + sin(counter/ 25)*140, 400 + sin(counter/ 25)*140,400 + sin(counter/ 25)*140);
  counter++;
}
