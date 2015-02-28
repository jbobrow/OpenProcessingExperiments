
Walker[] walkers = new Walker[20];

void setup(){
  size(500,500);
  smooth();
  for (int i = 0; i < 20; i++) {
    PVector l = new PVector(width/2+random(10,30),height/2+random(10,30));
    PVector v = new PVector(0,0);  
    PVector a = new PVector(0,0);
    walkers[i] = new Walker(l,v,a);
  }
}

void draw(){
  background(0);
  for (int i = 0; i < 20; i++) {
    walkers[i].go();
  }
  if (mousePressed) {
    PVector m = new PVector(mouseX,mouseY);
    for (int i = 0; i < 20; i++){
      PVector diff = PVector.sub(m,walkers[i].getLoc());
      diff.normalize();
      float factor = 1;
      diff.mult(factor);
      walkers[i].setAcc(diff);
    }
  } 
  else {
    for (int i = 0; i < 20; i++){
      walkers[i].setAcc(new PVector(0,0));
    }
  }
}


