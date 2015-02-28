
int barWidth = 10;
int lastBar = 5;


void setup(){
size(600,600);
colourmode(HSB,200,150,height);
noStroke();
background(255);
}
void draw(){
int whichBar = mouseX/barWidth;
if (whichBar !=lastbar){
  int barX = whichBar * barWidth;
  fill(barX,100,mouseY;
  rect(barX,0,barWidth,Height);
  lastBar = whichBar;
}

}
                
