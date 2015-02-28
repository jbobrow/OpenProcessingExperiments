

void setup() {
  size (800,400, P3D);
  background (255);
  smooth();
  frameRate(200);
}



void draw() 

{
 dessiner();
 nettoyer();
}



void dessiner() {


lights();
translate(width/2, height/2, 0); //translate(x, y, z);
rotate(PI/mouseX+mouseY);
sphere(150);
  
  }
  
   void nettoyer() 
 {  
if (mousePressed == true) {
  background (255);
  }
}

