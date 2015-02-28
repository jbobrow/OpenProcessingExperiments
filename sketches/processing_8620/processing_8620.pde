
//Global Variables
float lineMove=1;
float lineMove2=1; 
 
void setup(){
size(900,600);
smooth();
}

void draw(){
  
// Draw Ellipses, see code outside of void draw
for (int a=17; a<width+34; a+=34){
for (int b=17; b<height+34; b+=34){
drawEllipse (a,b,5);
}
}
for (int c=0; c<width+34; c+=34){
for (int d=0; d<height+34; d+=34){
drawEllipse (c,d,5);
}
}

//1st set of horizontal lines - moving down
for (int y=0; y<height; y +=17) {
stroke (0,0,0);
strokeWeight (2);
line (0,y+lineMove,width,y+lineMove);
}

//1st set of verticle lines - moving right
for (int x=0; x<width; x +=17) {
  line (x+lineMove,0,x+lineMove,height);
}

//2nd set of horizontal lines - moving up
for (int y=0; y<height; y +=17) {
stroke (0,0,0);
strokeWeight (2);
line (0,y+lineMove2,width,y+lineMove2);
}

//2nd set of vert lines - moving left
for (int x=0; x<width; x +=17) {
  line (x+lineMove2,0,x+lineMove2,height);
}

//Move Lines
lineMove=lineMove+1;
lineMove2=lineMove2-1;

//Reset lines to 0 for 'looping' effect
if (lineMove>17){
  lineMove=0;
}
if (lineMove2 < -17){
  lineMove2=0;
}
}

//Put this outside of draw to finish drawing ellipses
void drawEllipse (int e, int f, int r){
noStroke();
fill (0);
ellipse (e,f,r*7,r*7);
fill (255);
ellipse (e,f,r*6,r*6);
fill (0);
ellipse (e,f,r*4,r*4);
fill (255);
ellipse (e,f,r*3,r*3);
fill (0);
ellipse (e,f,r*1,r*1);
}


//SCOTT - Rose helped you A LOT!!!

