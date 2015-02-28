
float start=0.785;
float stop=5.497;
int xPos=-50;
float value=.01;

void setup(){
  size(800,100);
  noStroke();
  fill(250,230,3);
}
void draw(){
  background(0);
  pacman(5);
}
void pacman(float chomp, int yPos){
  float incr=value*chomp;;
 //Draw PacMan
  arc(xPos,50,80,80,start,stop);
  start=start-incr;
  stop=stop+incr;
  if(start<=0||start>=0.786){
    value=-value;
}
}
  //Move Pacman
  xPos=xPos+3;
  if(xPos>=850){
    xPos=-50;
    }
