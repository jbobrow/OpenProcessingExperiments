
size(400,400);
fill(0,0,0);
textSize(40);
text("comienzo:",1,50);

var x=0;
var ballX=0;
var ballY=0;

void setup(){
   noStroke();
   }
void draw(){
   background(111, 240, 79);
   fill(245,111,8);
   ellipse(x, 290, 80, 80);
   x=x+5;
   }
if( ballX <= 390){
   x=-x;
   }
