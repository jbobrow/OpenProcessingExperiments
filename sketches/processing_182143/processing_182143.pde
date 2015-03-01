
float i = 0;
float x,y,z;

void setup() {
  size(700,700,P3D);
  background(10,10,50);
}

void draw() {
  clear();
  stroke(170,190,240);
  fill(230,0,100);
  lights();
  //println("wassup world");
  //ellipse((mouseX+i)/2, (mouseX+i)/2, mouseX+i, (mouseX+i));
  x = 350;
  y = 350;
  z = 350;
  translate(x,y,z);
  rotateY(-PI + mouseX/100.0);
  pushMatrix();
  //rotateZ(PI/12);
  //rotateX(-PI/12);
  rectMode(CENTER);
  box(100);
  popMatrix();
  noFill();
  pushMatrix();
  sphere(100);
  popMatrix();
  //println(mouseY, " ", mouseY - 350);
}

void mouseClicked(){
  clear();
}

void mouseWheel(MouseEvent event){
  i += 30*event.getCount();
}

void delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}

class Eclipse{
  int width;
  int height;
}
