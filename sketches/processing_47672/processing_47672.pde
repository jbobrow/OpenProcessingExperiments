
PImage bild;

 
 
 
void setup() {
  size(800,800);
  smooth();
 
  bild = loadImage("Silva.jpg");
}
 
int g = 11;
 
void draw() {

   randomSeed(0);
  background (255);
 
   
  for (int i = 0; i< width/15.0; i++) {
    for (int j =0; j< height/15.0; j++){
       
 
      float val = 255-brightness(bild.get(i*g, j*g));
      float r =  brightness(bild.get(i*g, j*g))/200;
 
      fill(bild.get(i*g, j*g) );
 
 
      pushMatrix();
      translate(i*g, j*g);
      stroke(255);
 
      strokeWeight(val/200);
      line (i*g/2,j*g/2,val/2.5,val/2.5+mouseY);
      noStroke();
      ellipse (i*g/2,j*g/2,val/10.5+mouseX,val/10.5+mouseY);
      popMatrix();
    
 
  }
}
}


