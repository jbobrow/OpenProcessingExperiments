
void setup () {
  size(640,360);
  stroke(255,100);
  
}

void draw () {
  background(0,0,0);
  for(int epr=0; epr<640; epr++){
  line(epr*3,120,epr*3,240); 
  }
}
