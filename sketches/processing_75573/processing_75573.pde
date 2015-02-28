

void setup() {
  frameRate(150);
  background(0);
  colorMode(HSB);
  size(600, 600);
   for (int w = 0; w < 600; w++) {
    stroke(151, w*.5, 48);
    line(w, 0, 600, 600);

    colorMode(HSB);
    size(600, 600);
    for (int z = 0; z < 600; z++) {
      stroke(151, z*0.5, 48);
      line(z, 0, 0, 600);
    }
  }
}
void draw() {
    
  smooth();
  float h= random (100);
  float star7= random (600);
  float star8= random (600);

  if (h<10) {
    fill(0);
    stroke(0);
    strokeWeight(5);
    quad (star7, star8, star7, star8, star7, star8, 300, 300);
  
   float OZ= random (500);
    stroke(OZ, OZ, OZ);
    strokeWeight(5);
    noFill();
    
   for (int A = 0; A <650; A+=40){
     for (int B = 0; B<650; B+=40){
  quad(B, A, B, 40, 40, 40, 40, A);
     
     
     float me= random (1000);
      if (mousePressed) {
        
    stroke(me, me, me, me);
   ellipse (mouseX, mouseY, 0, 0);
  }
}
}
}
}


