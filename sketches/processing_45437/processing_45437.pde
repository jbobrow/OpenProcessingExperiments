
import processing.opengl.*; // CON open se observan figuras solidas
float noisese=0.10;
 
void setup(){
  size(800, 800,P3D);// aqui el resultado cambia entre P3D y OPENGL
  strokeWeight (.5);
  frameRate(30);
  noCursor();
}


void draw() {
  background(0);
  for(int x=0; x < height; x++) {
     float noiseVal = noise((mouseX+x)*noisese, mouseY*noisese, mouseY);
      stroke(pmouseX/5 , mouseX/2, pmouseY/2, 200);
    line(mouseX/noiseVal, mouseY/noiseVal, x*10, height/2,mouseX/noiseVal,noiseVal/pmouseY);
       line(mouseY/noiseVal, mouseX/noiseVal, x, x++);
       }
}

