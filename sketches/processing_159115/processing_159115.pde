
void setup (){
  print(50);
  size(600,400);
}


void draw() {
 for(int x = 0; x<600; x=x+10){
  for(int y = 0; y<400; y= y+10) {
     ellipse(x,y,5,5);
}
}
}
