
void setup(){
  size(400,400,P3D);
  noSmooth();
  //stroke(255);
  //noFill();
}

void draw(){
  background(0);
  translate(200,160);
  scale(1);
  rotateY(radians(millis()*0.04));
  for(int k = 0;k < mouseX/60; k++){
    pushMatrix();
    translate(0,0,k*20);
    for(int i = 0;i < 6; i++){
      translate(20,0,0);
      pushMatrix();
      //box(10); 
      for(int j = 0;j < 6; j++){
        pushMatrix();
        translate(0,20*j,0);
        rotateX(radians(millis()*0.04));
        //rotateY(radians(millis()*0.4));
        //rotateZ(radians(millis()*0.04));
        box(10);
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
}

