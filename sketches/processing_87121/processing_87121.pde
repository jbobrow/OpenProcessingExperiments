
/*
Maze Tile 1
Ira Greenberg, November 25, 2005
revised October 18, 2006
*/
// declare some vars
float x, y, y2, x2, h, w, xShift, yShift;
//these values can be changed
int xSclFactor = 4;
int ySclFactor = 4;
float wStep = 10;
float hStep = 3;

void setup(){
//these values can be changed
size(920, 580);
background(0);
strokeWeight(2);

stroke(255,0,0);
noFill();
smooth();
//end changeable stuff
x = width/xSclFactor;
y = height/ySclFactor;
y2 = x2 = 0;
for (int i=0; i<width; i+=x){
for (int j=0; j<height; j+=y){
h = w = 0;
yShift = j;
xShift = i;
createMaze();

}
}
}
void createMaze(){
beginShape();
vertex((x-w)+xShift, (y2+h)+yShift);
for (float i=min(width/xSclFactor, height/ySclFactor); 
i>min(width/xSclFactor, height/ySclFactor)/2; 
i-=max(wStep, hStep)){
vertex((x-w)+xShift, (y-h)+yShift);
vertex((x2+w)+xShift, (y-h)+yShift);
vertex((x2+w)+xShift, (y2+h)+yShift);
w+=wStep;
vertex((x-w)+xShift, (y2+h)+yShift);
h+=hStep;
}
endShape();
}
void draw(){};
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
