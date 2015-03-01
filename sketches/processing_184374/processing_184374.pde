
int counter;
void setup(){
  size(400,400);
  }
  void draw(){
    if(mouseY>height/2){
       background(250,250,250);
}else{
  if(mouseY<height/2){
    background(0,0,0);
     }
}
ellipse(40,40,20,20);
}
