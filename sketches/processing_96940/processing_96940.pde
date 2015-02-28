
void setup() {
  size (300, 300, P3D);
}
 
 
void draw() {
  background(0);
  stroke(255);
  spotLight(200, 200, 0, mouseX, 160, 600, 0, 0, -1, PI/2, 600);
  noCursor();
// camera(mouseX, mouseY, 120.0, width/2, height/2, 0.0, 0.0, 1.0, 0.0);
   
  pushMatrix();
  translate (50, 50);
   
    beginShape();
    vertex(0, 50); //top right
    vertex(100, 50); //bottom right
    vertex(100, 150); //bottom left
    vertex(0, 150); //top left
    endShape(CLOSE);
     
    beginShape();
    vertex(50, 0); //top left
    vertex(150, 0); //top right
    vertex(150, 100); //bottom right
    vertex(50, 100); //bottom left
   endShape(CLOSE);
 
    beginShape();
    vertex(0, 150); //top right
    vertex(50, 100); //bottom right
    vertex(150, 100); //bottom left
    vertex(100, 150); //top left
    endShape(CLOSE);
     
fill(200);
    beginShape();
    vertex(0, 50); //top left
    vertex(50, 0); //top right
    vertex(50, 100); //bottom right
    vertex(0, 150); //bottom left
   endShape(CLOSE);
 
    beginShape();
    vertex(100, 50); //top left
    vertex(150, 0); //top right
    vertex(150, 100); //bottom right
    vertex(100, 150); //bottom left
    endShape(CLOSE);
 
  popMatrix();
   
   
}



