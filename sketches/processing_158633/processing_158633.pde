
float i = 0;
void setup() {
  size(600, 400);
}
void draw() {
  //background(255);
i=i+0.05;
float posicionX = 100*sin(i);
float posicionY = 100*cos(i);
  ellipse(width/2+posicionX, height/2+posicionY, 120, 120);
    ellipse(width/2+posicionX, height/12+posicionY, 80, 80);
  fill (250, 250, 0);
  float logo = 0;
  logo=logo+0.8;
 ellipse(width/2+posicionX, height/2+posicionY, -65, -65);
 ellipse(width/4+posicionX, height/4+posicionY,75, 75);

}
