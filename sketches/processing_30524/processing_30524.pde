
void setup() {
  size(800,500);
  rectMode(CENTER);
  colorMode(RGB,width);
  background(width);
}

void cros(int x,int y,float z){
  noFill();
  strokeWeight(random(2));
  stroke(x,y,5*z);
  rect(x,y,z,z);
}
int n=1;

void draw(){
  for(int countX = 0; countX < width/50; countX++) {
    for(int countY = 0; countY < height/50; countY++){
      cros(25+(countX * 60),25+(countY * 50),random(0,50));
       noLoop();
    }
  }


 
}



                
                
