
void setup() {
  size(450,450);
  background(0);
}

void draw(){
  
  for(int i=0; i<5; i++){
    line(random(450), random(450), random(450), random(450));
    strokeWeight(random(1,5));
    stroke(random(255), random(255), random(255));
  }
}
                
                                
