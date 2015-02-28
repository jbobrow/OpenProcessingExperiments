
// Transformações
// Rotate, Translate, Scale
float px, py, angulo, escala;
boolean desenhar = false;
void setup() {
  size(500, 500);
  background(0);
  stroke(255, 30);
  noFill();
  px = 0;
  py = 0;
  angulo = 0;
  escala = 0;
  frameRate(30);
}
void draw() {
  if (desenhar == true){
    translate (mouseX, mouseY);
    angulo += 15;
    rotate (radians(angulo));
    //escala += 0.001;
    //scale(escala);
    rect (0,0,30,30);
    ellipse (60, 60, 60, 60); 
    line(0, 0, 100, 0);
  }
}
void mouseDragged (){
  desenhar = true;
}
void mouseReleased(){
  desenhar = false;
}
void keyPressed(){
  saveFrame ("line-######.png");
}
