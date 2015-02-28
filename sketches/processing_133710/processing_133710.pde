
void setup(){
  size(400,400);
}
void draw(){
  background(0);
  for(int i=0;i<400;i+=20){
    redSquare(i,i);}}
void redSquare(int x, int y){
noStroke();
fill(200,0,0);
rect(x,y,20,20);
}
