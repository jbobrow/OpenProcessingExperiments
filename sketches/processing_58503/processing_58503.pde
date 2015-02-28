
PGraphics normal_1;
PImage glow;

void setup() {
  size(350,350);
  background(255);
  normal_1 = createGraphics(width,height,JAVA2D);
  normal_1.beginDraw();
  normal_1.smooth();
  normal_1.stroke(200,50,250);  
  normal_1.strokeWeight(2);
  drawMaze();
  normal_1.endDraw();
 
}

void draw() {
  
  glow = normal_1.get(0,0,normal_1.width,normal_1.height);
  glow.resize(0,width/4);
  glow.filter(BLUR,3);
  glow.resize(0,width);
  image(glow,0,0);
  image(normal_1,0,0);
}

void drawMaze()
{
normal_1.line(0, 50, 195, 50);
normal_1.line(195, 50, 195, 75);
normal_1.line(195, 120, 195, 295);
normal_1.line(50, 195, 195, 195);
normal_1.line(195, 295, 300, 295);
normal_1.line(300, 295, 300, 225);
normal_1.line(300, 55, 300, 155);
normal_1.line(300, 55, 400, 55);
normal_1.line(220, 55, 260, 55);
normal_1.stroke(232,242,253); 
}
void mouseDragged() {
  normal_1.beginDraw();
  normal_1.line(mouseX,mouseY,pmouseX,pmouseY);
  normal_1.endDraw();
}




