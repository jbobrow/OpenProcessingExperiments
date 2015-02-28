
void setup() {
  size (600,400,P3D);
  background(50);
  smooth();
  
}
void draw() {
  if(mousePressed) {
    translate(mouseX,mouseY,mouseY-200);
    rotate(mouseX);
    fill(mouseX-50,mouseY-100,100,mouseY);
    stroke(mouseY,mouseX,100,mouseY);
    box(60);
  }else{
    translate(mouseX,mouseY,mouseX-400);
    rotate(mouseY-100);
    fill(mouseY-100,100,mouseY-100,mouseX-200);
    stroke(mouseX,mouseY,100,30);
    sphere(40);
    }
    if (keyPressed){
      save("3d2.jpeg");
    }
  }



