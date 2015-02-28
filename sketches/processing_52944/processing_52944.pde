
float sw;
float amount;
float c1, c2, c3;
float cam1, cam2, cam3;

void setup() {
  size(600, 400);
  background(255);
  sw=0.2;
  amount=1;
  c1=random(255);
  c2=random(255);
  c3=random(255);
  cam1=10;
  cam2=10;
  cam3=10;
  smooth();
}

void draw() {
  if (mouseButton==RIGHT) {
    background(255);
  } 
  if (sw>15 || sw<0.2) {
    amount=-amount;
  }
  if (c1>255 || c1<0) {
    cam1=-cam1;
  }

  if (c2>255 || c2<0) {
    cam2=-cam2;
  }  
  if (c3>255 || c3<0) {
    cam3=-cam3;
  }

  sw=sw+amount;
  c1=c1+cam1;
  c2=c2+cam2;
  c3=c3+cam3;
  stroke(c1, c2, c3);
  strokeWeight(sw);
}

void mouseDragged() {
  line(mouseX, mouseY, pmouseX, pmouseY);
}  

void keyPressed() {
  c1=random(255);
  c2=random(255);
  c3=random(255);
}




                
                                                                
