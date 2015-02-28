
float start = 0.785;
float stop = 5.497;
float incr = .020;
int xPos = 0;

void setup(){
  noStroke();
  size (400,100);
  fill(255,183,0);
  frameRate (500);
}

void draw(){
  background(0);
  arc(xPos,50,80,80,start,stop);
  start = start - incr;
  stop = stop + incr;
  if(start <= 0 || start >=0.766){
    incr = incr *-1;
  }
  
  xPos = xPos + 1;
  if(xPos >= 850){
    xPos = -50;
  }

}
