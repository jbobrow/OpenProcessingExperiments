
float zoom = 1;
float x = width+PI/400;
float y = height/20;
float h;
float opacity;
float w = 0; 
float a= 0.0;

void setup() {
  size(1000, 900, P3D);
  background(0);
  //lights();
  smooth(8);
}
void draw() {
  a += 0.005;
  if (a > TWO_PI) { 
    a = 0.0;
  }

  cirk();
}

void cirk() {

  pushMatrix();
  translate(width/2, mouseY, mouseX+zoom);
  noFill();
  
  for(int i =0; i < 200; i++) {
    
  /////////
  rotateX(a);
  rotateY(a * 2.0);
  stroke(0,0,200,2);
  box(x+40, 1, 1);
  
  //////////
  stroke(130, 10, 66, 5);
  rotateX(a * 9.001);
  rotateY(a * 2.002);
  box(x+60, -1, 1);
  
  //////////
  stroke(0,200,190,4);
  box(x+80, -1, 1);
  
  /////////black
  rotateX(a * 1.001);
  rotateY(a * 4.002);
  stroke(0,0,0,50);
  box(x+120, 1, 1);


  
  }
  
  popMatrix();
}



void mouseReleased() {
  background(0);
}





