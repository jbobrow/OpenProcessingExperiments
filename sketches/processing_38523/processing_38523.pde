
//isolate an area of the interactive screen
void setup(){
  size(400,400);
}
void draw(){
  background(224,210,155);
  if(mouseX < 200 && mouseY < 200){
  fill(125,155,224);
  rect(0,0,200,200);
}
  if(mouseX <200 && mouseY > 200){
  fill(105,126,139);
  rect(0,200,200,200);
}
if(mouseX >200 && mouseY < 200){
  fill(75,50,139);
  rect(200,0,200,200);
}
if(mouseX >200 && mouseY > 200){
  fill(100,50,69);
  rect(200,200,200,200);
}
}

