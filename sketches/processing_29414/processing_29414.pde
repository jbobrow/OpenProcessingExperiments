
int r = 150;
int g = 0;
int b = 0;

void setup(){
  size(200,200);
 }

void draw(){
  background(r,g,b);
  stroke(255);
  
  if(mouseX > width/2){
    r = r + 1;
  }else {
    r = r -1;
  }
  if (r > 255){
    r = 255;
  }
  if (r > 255){
    r = 255;
  }
}
  
 

  



