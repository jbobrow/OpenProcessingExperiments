
int move;
int incmove;
int h;
int inch;
//---------
void setup(){
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  background(320, 75, 100);
  fill(320, 75, 100, 25);
  rect(0, 0, 500, 500);
  move = 0;
  incmove = 1;
  
  h = 0;
  inch=1;
  }
//----------
void draw(){
  h = h + inch;
  fill(h, 75, 100, 25);
  rect(0, 0, 500, 500);
  move= move + incmove;
  for(int ollie=0; ollie<20; ollie++){
  //for(int skate = 0; skate < 20; skate++){
  
  //println(ollie);
  fill(ollie*(360/20), 100, 100);
  ellipseMode(CORNER);
  ellipse(move, ollie*25, 25, 25);
  println(move);
   } 
   
    if(move > 475){
    incmove = incmove * -1;
   
   } 
  if(move < 0){
    incmove = incmove * -1;
    }
    //}
   if(h > 255){
     inch = inch*-1;
     }
   if(h < 0){
    inch = inch*-1;
    } 
  }


