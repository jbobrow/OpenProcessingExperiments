
void setup(){
  size(1450,900);
  background(109,255,13);
  smooth();
}
void draw(){
  frameRate(2);
  for (int i=0; i<=50; i++){
    drawX (int(random(255)), int(random(10)), int(random(width)),
    int (random(height)),300);
    }
    //noLoop();
}
 
void drawX (int gray,int weight, int X, int Y, int Size){
  stroke (gray);
  strokeWeight (weight);
  line (X,Y,X+Size, Y+Size);
  line (X+Size,Y,X,Y+Size);
}
