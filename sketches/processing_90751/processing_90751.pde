
void setup(){
  size(800,100);
  noStroke();
  fill(255,183,0);
}

void draw(){
  background(0);
  
}



void pacman(int chomp){
  //variables
  int chomp = 1;
  float start = 0.786;
  float stop = 5.497;
  float incr = 0.03 * chomp;
  int xPos = 0;

  //Draw Pacman
  incr = incr*chomp;
  arc(xPos,50,80,80,start,stop);
  start = start - incr;
  stop = stop + incr;
  if(start <= 0 || start >= 0.786){
    incr = incr *-1;
  }
  //Move Pacmam
  xPos = xPos +1;
  if(xPos >= 850){
    xPos = -50;
  }
  println("start= " + start + "   stop= " + stop);
}
