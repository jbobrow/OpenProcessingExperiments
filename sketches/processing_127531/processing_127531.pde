
int x=50;           //variables
int y=50;

int dx=1;          // velocity
int dy=1;

void setup() (  //setup function called inicially , once mors
size(500,500);
background(255);      //set background white
}
void draw() { // draw function loops
ellipse(x,y,20,20);    //ball
x=x+dx;
y=y+dy;

if (x>500){
     dx=-9;
}
else if (x<0) {
     dx=9;
}
if(y>250) {
dy*=-1;
}
else if (y<0){
dy*=-1;
 }
}
