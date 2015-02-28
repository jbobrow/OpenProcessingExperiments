
void setup() {
  size(400,400);
  colorMode(HSB,width);
}
//custom function:
void cros(int x,int y,float z){
  stroke(x,y,10*z);
  line(x,y,x+z,y+z);
  line(x,y+z,x+z,y);
}
int n=0;
//loop grid
void draw(){
  for(int countX = 0; countX < width/20; countX++) {
    for(int countY = 0; countY < height/20; countY++){
      cros(countX*20,countY*20,random(0,20));
    }
  }
n++;
if (n>200){
  noLoop();
}
}

