
//Hasan. M
//PS-1: Question 5

int size = 50;

void setup(){
  size(400,400);
  stroke(0);
  background(0);

}
void draw(){
  for (int x=0; x< width; x+= size) {
  for (int y=0; y< height; y+= size){
    if ( (x+y) % 20 ==0) {
    fill(0);
    }
  
  else {
    fill(0,215,0); }
  
  rect(x,y,50,50);
  }
  } 
}

