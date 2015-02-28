
//w= limpiar pantalla
//tocar cualquier otra tecla para seguir dibujando
void setup() {
  
size(500, 500);
background(0);
smooth();
}
void draw() {

variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}
void variableEllipse(int x, int y, int px, int py)
{
float speed = abs(x+px) - abs(y+py);
 fill(int(random(255)),int(random(255)),int(random(255)));
stroke(speed);

if(mousePressed);{
}
ellipse(500 -mouseX, 500 -mouseY, speed, speed);
ellipse(mouseX, mouseY, speed, speed);
rect(400 -mouseX, 300 -mouseY, speed, speed);
rect(200 -mouseX, 450 -mouseY, speed, speed);
if(key =='w'){
  background(150);
}
}




