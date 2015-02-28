
float start = 0.785;
float stop = 5.497;
float incr = 0.2;
int xPos= 0;

void setup(){
  size (800,100);
  noStroke();
  fill(255,183,0);
}
void draw(){
  background(0);
  //pacman
  arc(xPos,50,80,80,start,stop);
  start = start - incr;
  stop = stop +incr;
  xPos = xPos+1;
  if( start <= 0 ||start >=0.786){
    incr = incr *-1;
  }
  if(xPos>=800){
    xPos = 0;
  }
 
}
