
//Hasan. M
//PS-1: Question 4

void setup(){
  size(400,400);
  stroke(0);
  background(0);

}
void draw(){
  for (int x=0; x< width; x+=50) {
  for (int y=0; y< height; y+=50){ 
  fill(0);
  stroke(0,215,0);
  rect(x,y,50,50);
  }
  } 
}


