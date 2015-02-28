
//Aviva Silberstein
//February 26, 2013
//Arrays

void setup() {
  size(350, 600);
}
void draw(){
  background(0);
  
  for(int x=0; x<width; x+=1){
    stroke(157, 146, 219, 55);
    line(mouseX, mouseY, x, 0);
  }
for(int x=0; x<width; x+=1){
    stroke(157, 146, 219, 55);
    line(mouseX, mouseY, x, 600);
}
for(int x=0; x<height; x+=1){
    stroke(157, 146, 219, 55);
    line(mouseX-20, mouseY, 0, x);
}
for(int x=0; x<height; x+=1){
    stroke(157, 146, 219, 55);
    line(mouseX+20, mouseY, width, x);
}
}
