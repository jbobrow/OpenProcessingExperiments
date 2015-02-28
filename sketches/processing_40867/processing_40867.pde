
void setup()  {
  size(400,400);
  background(#0A90FA);

}
int R = 5;
  int G= 1;
  int B= 3;
  int Shoot=98;

void draw() {
  fill(R,G,B);
  ellipse(50, 245, 20, 20);
  ellipse(50, 275, 40, 40);
  ellipse(50, 325, 60, 60);
  fill(100,150,200,255);
  rect(40, 200, 20, 35);
  rect(35, 235, 30, 2);
  fill(0);
  text("Frosty throws a rave and a fireball",10,10);
  ellipse(50, 315, 3, 3);
  ellipse(50, 325, 3, 3);
  ellipse(50, 305, 3, 3);
  ellipse(50, 285, 3, 3);
  ellipse(50, 275, 3, 3);
  ellipse(50, 265, 3, 3);
  ellipse(46, 243, 3, 3);
  ellipse(55, 243, 3, 3);
  fill(252, 153, 10);
  quad(50, 245, 75, 255, 50, 250, 50, 245);
  fill(0,255,0);
  rect(0,355, 400, 400);
  fill(R,G,B);
  text("Thou Furious", mouseX, mouseY);
  line(70,275,90,275);
  line(90,275, 95, 280);
  line(90,275, 95, 265);
  fill(R,G,B,R);
  ellipse(Shoot,275,10,10);
  fill(R,G,B);
  ellipse(398,10, 70,70);
  R=R*3;
  G=G*3;
  B=B*3;
  Shoot=Shoot+1;
}

