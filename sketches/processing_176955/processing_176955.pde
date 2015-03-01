
float deg = 25;
float dd = 0;

void setup() {
  size(600, 600, P3D);
  frameRate(30);
}

void draw() {
  //deg = 45;
  //strokeWeight(1);
  
  background(255);
  line(width/2, height, width/2, height-200);
  
  
  
  translate(width/2, height-200);
  //rotateY(radians(dd));
  rotate(PI);
  drawtree(50, 15);
  //noLoop();
  //dd++;
}

void drawtree(float l, int num) {
  
  if(num>1) {
  //deg = deg - 1;
  pushMatrix();
  rotateY(radians(dd));
  rotate(radians(deg));
  line(0, 0, 0, l);
  translate(0, l);
  
  drawtree(l*0.9, num-1);
  popMatrix();
  
  pushMatrix();
  rotate(radians(-deg));
  rotateY(radians(dd));
  line(0, 0, 0, l);
  translate(0, l);
  
  drawtree(l*0.9, num-1);
  popMatrix();
  
  
  }
  dd++;
  
}
    
