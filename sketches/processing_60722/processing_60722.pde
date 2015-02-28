
float angulo=mouseX;
PFont miTipo;
void setup(){
size(500,400);
background(255);
miTipo=loadFont("Serif-48.vlw");
}
void draw(){
if (mousePressed == true){
  rotate(angulo);
  textFont( miTipo);
fill(random(255),random(0),random(100));
text("Frankie",mouseX,mouseY);
textFont(miTipo);
angulo=angulo+0.1;

}
}
