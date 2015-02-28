
//Week 2 HW
//Graham Strang
//line symmetry type P111
//point symmetry types below
void setup(){
  size(900, 300);
  smooth();
  strokeWeight(.5);
  background(0);
  pushMatrix(); //red C72
  translate(0, height/2);
  for(int i = 0; i < 1200; i++){
    translate(100,0);
    for(int j = 0; j < 360; j++){
      rotate(radians(5));
      stroke(255, 0, 0, 100);
      line(0,0,0,100);
    }
  }
  popMatrix();
  pushMatrix(); //green C90
  translate(0, height/3);
  for(int i = 0; i < 1200; i++){
    translate(125,0);
    for(int j = 0; j < 360; j++){
      rotate(radians(4));
      stroke(0, 255, 0, 50);
      line(0,0,0,125);
    }
  }
  popMatrix();
  pushMatrix();  //blue C60
  translate(0, height/1.5);
  for(int i = 0; i < 1200; i++){
    translate(75,0);
    for(int j = 0; j < 360; j++){
      rotate(radians(6));
      stroke(0,0, 255, 50);
      line(0,0,0,75);
    }
  }
  popMatrix();
}


