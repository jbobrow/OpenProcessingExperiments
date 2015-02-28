

int rSize = 30;

void setup(){
  size(400,400,P3D);
  smooth();
}

void draw(){
  background(255);
  noFill();
  translate(width/2, height/2);

  for(int n = 0; n < 360; n = n+20){
    scale(1.1);
    rect(0,0,rSize,rSize);
    rotateZ(PI/9);
    rotateY(PI/36); 
  }
}

