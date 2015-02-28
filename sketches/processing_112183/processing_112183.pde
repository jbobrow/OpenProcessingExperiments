
void setup(){
  smooth();
  size(600, 600);
  background(73,158,43);
}
  
  void draw(){
   
  for(int x=10;x<width; x=x+10){
    for(int y=0; y<height; y=y+10){
    fill(116,209,54);
    ellipse(x, y, 7, 7);
    }
  }
 
  }





