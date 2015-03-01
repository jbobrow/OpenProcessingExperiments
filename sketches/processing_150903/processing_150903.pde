
void setup() {
  size(600, 600, P3D);
  background(#eeeeee);
}

void draw(){
  float dia = dist(mouseX, mouseY, pmouseX, pmouseY);
  triangle(mouseX, mouseY, dia, dia, 10, 10);
{ 
lights();
for (int i = 30; i < width; i+=70){
  
pushMatrix();
translate(500, 400, -i);
//triangle(0, 0, 100, 100, 50, 50);
rotateX(radians(mouseX));
rotateY(radians(mouseY));
box(300);
popMatrix();

pushMatrix();
translate(width/7, height/9, -1000);
rotateX(radians(mouseX));
rotateY(radians(mouseY));
//noFill();
box(30, 500, -500);
popMatrix();



}
}
}

