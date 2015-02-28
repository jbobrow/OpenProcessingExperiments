
float i = 0;
void setup() {
  size(400, 400);
  background(300, 90, 90);
}
void draw() {
//background(255);
fill(i*2, 500, 102, 102);
i=i+0.05;
float posicionX = 200*sin(i);
//oscilandode forma no coordinada
float posicionY = 100*cos(i);
  ellipse(width/2+posicionX, height/2+posicionY, 20, 20);
  ellipse(width/2+posicionY, height/2+posicionX, 20, 20);
 fill(500, 300, 10);
  i=i+0.05;
float posicionT = 200*sin(i);
//oscilandode forma no coordinada
float posicionE = 100*cos(i);
  ellipse(width/2+posicionX, height/2+posicionY, 10, 10);
  ellipse(width/2+posicionY, height/2+posicionX, 10, 10);
  fill(i*5, 110, 190, 190);
  ellipse(mouseX,mouseY,5,5);  
}



