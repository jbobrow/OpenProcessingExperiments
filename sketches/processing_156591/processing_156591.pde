
float posX;
float posY;
int triangleColor = 0;
int arcColor = 240;


void setup(){
  size(800,600);
  frameRate(30);
}

void draw(){
  
  fill(100, 110);
  //translate(width/2, height/2);
  background(255);
  triangle(mouseX, mouseY, mouseX + 125, mouseY + 25, 35, 0);
  triangle(mouseX, mouseY, mouseX + 25, mouseY + 125, 45, 0);
  posX += (mouseX - posX)*0.05;
  posY += (mouseY - posX)*0.05;

pushMatrix();
  stroke(1);
  fill(triangleColor ++);
  translate(width/2, height/2);
  triangle(mouseX, mouseY, mouseX + 125, mouseY + 25, 35, 0);
  triangle(mouseX, mouseY, mouseX + 25, mouseY + 125, 45, 0);
  triangle(posX, posY, posX + 125, posY + 25, 30, 20);
  triangle(posX, posY, posX -125, posY - 115, 55, 20);
popMatrix();
}




