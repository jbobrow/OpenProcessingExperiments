
/*
 
Eleni Bazezew
2/22/2013

Animation of Mr. Pacman 

*/



// Variables
  float start=0.785;
  float stop =5.497;
  float incr = .03 ;
  int xPos= -50;

void setup(){
  size(800,100);
  noStroke();
  fill(252,252,0);
}

void draw(){
  background(0);
  pacman(2);
}

void pacman(int chomp ) {
  chomp = 1;
  incr = incr * chomp; 
 
 //Draw Pacman

  arc(xPos,50,80,80,start,stop);
  start = start - incr;
  stop = stop + incr;
  if(start <= 0 || start >= 0.786){
    incr = incr*-1;
  }
 //Move Pacman 
  xPos= xPos+1;
  if (xPos >= 850) {
    xPos=-50;
  } 
}

