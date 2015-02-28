
// A sketch to help me recognise which iteration has been made and 
// including the coordinates of each iteration.
// Code from Petros Koutsolampros from StackOverflow

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode

}
void draw(){
for(int i = 10; i <255; i +=24) {
int x = i;
int y = i+10;
  fill(i,255,255);
   rect (x, y, 50, 50);
   fill(0);
   text(x + "," + y,x,y,100,100);
} 
}
