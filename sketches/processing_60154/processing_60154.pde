
Molec[] molecs;
float d[];
float moveX[];
float moveY[];
float addx[];
float addy[];
PVector[] mover;
   
   
void createmolec(int amt) {
   
  molecs = new Molec[amt];
   
  for (int i = 0; i < amt; i++) {
   
    molecs[i] = new Molec(random(width), random(height),0,0);
  }
}
   
   
void setup() {
  size(900, 100);
  createmolec(70);
}
   
   
void draw() {
   
  background(255);
   
  for (int i = 0; i < molecs.length; i++) {
    molecs[i].update();
    molecs[i].attract();
//    molecs[i].mouseReleased();
      
    for (int j = 0; j < molecs.length; j++) {
      mover[j] = new PVector(0, 0);
    }
  }
}


