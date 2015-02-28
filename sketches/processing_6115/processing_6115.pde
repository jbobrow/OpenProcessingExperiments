
PImage tecfa1;
void setup() {
size(500,700);
tecfa1= loadImage("tecfa-affiche.gif");
}
void draw(){
 

  
image(tecfa1,random(-5,5), random (-5,5));
}

