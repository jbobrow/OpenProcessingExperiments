
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
  smooth();
}
void draw() {
  fill (255, 12);
  if (desenhar == true){
    stroke(random(255), random(255), random(255), 40);
    translate (mouseX, mouseY);
    angulo += random(30);
    rotate (radians(angulo));
    //rect (0,0,random(100),random(100));
    ellipse (random(100),random(100), 60, 60); 
    //line(0, 0, 100, 0);
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
