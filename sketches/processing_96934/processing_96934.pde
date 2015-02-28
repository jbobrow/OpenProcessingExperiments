
void setup() {
  size (600, 300, P3D);
}
 
 
void draw() {
  background(255);
  stroke(90,90,90);
  pushMatrix();
   
  rotateY(map(mouseX, 0, width, 0, 0.2*PI));

  translate (50, 50, 0);
   
//front box
fill(250,230,232);
    beginShape();
    vertex(0, 50); //top right
    vertex(100, 50); //bottom right
    vertex(100, 150); //bottom left
    vertex(0, 150); //top left
    endShape(CLOSE);
     
//back box
fill(255,164,173);
    beginShape();
    vertex(50, 0); //top left
    vertex(150, 0); //top right
    vertex(150, 100); //bottom right
    vertex(50, 100); //bottom left
   endShape(CLOSE);
 
//bottom box
fill(199,129,136);
    beginShape();
    vertex(0, 150); //top right
    vertex(50, 100); //bottom right
    vertex(150, 100); //bottom left
    vertex(100, 150); //top left
    endShape(CLOSE);
     
//left box
fill(247,198,203);
    beginShape();
    vertex(0, 50); //top left
    vertex(50, 0); //top right
    vertex(50, 100); //bottom right
    vertex(0, 150); //bottom left
   endShape(CLOSE);
 
//right box
fill(255,168,177);
    beginShape();
    vertex(100, 50); //top left
    vertex(150, 0); //top right
    vertex(150, 100); //bottom right
    vertex(100, 150); //bottom left
    endShape(CLOSE);
 
  popMatrix();

}



