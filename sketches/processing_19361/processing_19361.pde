
void setup() {
  size(400,400);
  rectMode(CENTER);
  colorMode(RGB,width);
  background(width);
}
//custom function:
void cros(int x,int y,float z){
  noFill();
  strokeWeight(random(1,3));
  stroke(x,y,8*z);
  rect(x,y,z,z);
}
int n=0;
//loop grid
void draw(){
  for(int countX = 0; countX < width/50; countX++) {
    for(int countY = 0; countY < height/50; countY++){
      cros(25+(countX * 50),25+(countY * 50),random(0,50));
    }
  }
n++;
if (n>5){
  noLoop();
}
}



