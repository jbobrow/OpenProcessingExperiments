
void setup(){
  
//Setup
  size(500, 500);
  background(255);
  translate(250, 250);
  smooth();
  
  float grow = 1.5;
  int rot = 15;
  
  noFill();  
  stroke(0, 100);

//Loop
  for(int i = 0; i < rot*6; i++){
    ellipse(0, 0, 75, 200);
    rotate(PI/30);
      if(i == rot*1){
        scale(grow);
      }
      if(i == rot*2){
        scale(grow);
      }
      if(i == rot*3){
        scale(grow);
      }
      if(i == rot*4){
        scale(grow);
      }
      if(i == rot*5){
        scale(grow);
      }
  }
}

void draw(){}


