
void setup(){
 size(200,200);
  noFill();
  
}
int x_1 = 0;
int y_1 = 0;
int rndm_clr;

void draw(){
  func1();
}

void func1(){
  for(int e=0; e<height; e+=12){
  for(int i=0; i<width; i+=12){
    rndm_clr = int(random(0,2550));
    strokeWeight(rndm_clr/50);
    stroke(rndm_clr);
  rect(i,e, 10,10);
  }
  }
}
