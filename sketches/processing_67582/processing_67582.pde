
float rectmove_1 = 0;
void setup(){
  size(400,400);
}
void draw(){
  background (51);
  rect(rectmove_1,200,50,50);
  rectmove_1 = rectmove_1 + 5;
  if(rectmove_1 > 400){
    rectmove_1 = 0;
  }
}


