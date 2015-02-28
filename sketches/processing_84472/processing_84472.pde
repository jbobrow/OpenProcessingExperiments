
//Actividad 02
//Elaborado por MariCarmen González Videgaray
//Diciembre 2012
void setup(){
  size(600,600);
  background(137,247,127);
  smooth();
  frameRate(10);
}
void draw(){
 stroke(48,118,42);
 fill(random(255),random(255),0,140);
 float diametro=random(100);
 ellipse(mouseX,mouseY,diametro,diametro); 
}


