
void setup(){
  size(300,300);
  smooth();
}

void draw () {
  background (255);
  
  float r= mouseY +50 + random (0-70);
  
  for (int x=0; x <= height; x= x+10){
    for (int y=0; y<= height; y= y+10){
      
      strokeWeight (0.5);
      fill(-y +r);
      rect(x,y, 9, 9);
    }
  }
}

