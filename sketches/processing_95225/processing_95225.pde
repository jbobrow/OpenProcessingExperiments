
void setup() {
  size (600, 300, P3D);
}


void draw() {
  background(0);
  stroke(255);
  
//  camera(mouseX, mouseY, 120.0, width/2, height/2, 0.0, 0.0, 1.0, 0.0);
  
  pushMatrix();
  translate (50, 50, 0);
  
//front box
fill(150, 39, 129);
    beginShape();
    vertex(0, 50); //top right
    vertex(100, 50); //bottom right
    vertex(100, 150); //bottom left
    vertex(0, 150); //top left
    endShape(CLOSE);
    
//back box
fill(50, 250, 196);
    beginShape();
    vertex(50, 0); //top left
    vertex(150, 0); //top right
    vertex(150, 100); //bottom right
    vertex(50, 100); //bottom left
   endShape(CLOSE);

//bottom box
fill(250, 60, 100);
    beginShape();
    vertex(0, 150); //top right
    vertex(50, 100); //bottom right
    vertex(150, 100); //bottom left
    vertex(100, 150); //top left
    endShape(CLOSE);
    
//left box
fill(200);
    beginShape();
    vertex(0, 50); //top left
    vertex(50, 0); //top right
    vertex(50, 100); //bottom right
    vertex(0, 150); //bottom left
   endShape(CLOSE);

//right box
fill(200, 73, 253);
    beginShape();
    vertex(100, 50); //top left
    vertex(150, 0); //top right
    vertex(150, 100); //bottom right
    vertex(100, 150); //bottom left
    endShape(CLOSE);

  popMatrix();
  
  
   pushMatrix();
  translate (300, 50, 0);
  
//front box
fill(150, 39, 129);
    beginShape();
    vertex(0, 50); //top right
    vertex(100, 50); //bottom right
    vertex(100, 150); //bottom left
    vertex(0, 150); //top left
    endShape(CLOSE);
    
//back box
fill(50, 250, 196);
    beginShape();
    vertex(50, 0); //top left
    vertex(150, 0); //top right
    vertex(150, 100); //bottom right
    vertex(50, 100); //bottom left
   endShape(CLOSE);

//bottom box
fill(250, 60, 100);
    beginShape();
    vertex(0, 150); //top right
    vertex(50, 100); //bottom right
    vertex(150, 100); //bottom left
    vertex(100, 150); //top left
    endShape(CLOSE);
    
//left box
fill(200);
    beginShape();
    vertex(0, 50); //top left
    vertex(50, 0); //top right
    vertex(50, 100); //bottom right
    vertex(0, 150); //bottom left
   endShape(CLOSE);

//right box
fill(200, 73, 253);
    beginShape();
    vertex(100, 50); //top left
    vertex(150, 0); //top right
    vertex(150, 100); //bottom right
    vertex(100, 150); //bottom left
    endShape(CLOSE);

  popMatrix();
}
