
ArrayList<Circle> drops;
void setup() {
  size(600,600);
  drops=new ArrayList();
}
float r=0;
void draw() {
  fill(108, 192, 255);
  noStroke();
  rect(0, 0, width, height);
  for (int i=0;i<drops.size();i++) {
    Circle drop=drops.get(i);
    drop.display();
    drop.movement();
  } 
}

void mousePressed() {
  drops.add(new Circle(mouseX, mouseY, r));
}



class Circle{
  float x;
  float y;
  float rad;
Circle(float tempX,float tempY,float tempR){
x=tempX;
y=tempY;
rad=tempR;

}
void display(){
  noFill();
  stroke(255,255-rad/2);
  strokeWeight(0.5);
  ellipse(x, y,rad,rad);

}

void movement(){
 rad++;
 if(255-rad/2<0){
 drops.remove(0);
 }
}

}


