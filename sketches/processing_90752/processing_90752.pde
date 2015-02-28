
float start = 0.785;
float stop = 5.497;
float incr = .03 * chomp;
int xPos = -50; //

void setup(){
  noStroke();
  fill (255,183,0);
}

void draw (){
  background (0);
    arc(50,58,80,80,start,stop);
    start = start - incr;
    stop = stop + incr;
    if (start <= 0 || start >=0.786){
      incr = incr *-1;
    }
  //print ("starts= " + start = " stop= " =stop);
}
x Pos = x Pos = 1; //
if(xPos >= 800){ //
  xPos = 0;//
} //
printIn ("start = " + start + " stop= " + stop);
}
