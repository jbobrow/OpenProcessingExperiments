
// Drawing nightsky with glowing stars
// I attempted to install live stars on top of one of the 
// famous pictures by Van Gogh "Starry Night"
// I first wanted to install them bu mouse input but I couldnt manage
// so I installed them individually.
// By pressing S you will save screenshot
// Thank You.
class Star {
float stepx;
float stepy;
float sz;
float minsz;
float maxsz;
float grow;
color[] palette={#FCFF64};
Star (float tx, float ty, float tsz) {

  stepx = tx;
  stepy= ty;
  sz= tsz;
  maxsz= 20;
  minsz=10;
  grow= 0.2;
}

void live() {
  fill(palette[0]);
ellipse (stepx, stepy, sz, sz );
sz= sz +grow;
if (sz > maxsz){
sz=maxsz;
grow= -grow;
}
if (sz < minsz){
sz= minsz;
grow = -grow;
}
}

}
Star[] star1=new Star[100];
Star star2;
PImage nightsky;

void setup() {
size (800, 600 ) ;
nightsky = loadImage("nightsky.jpg");
background(nightsky);
star1[0]= new Star (70, 17, 15); 
star1[1]= new Star (177,97, 15);
star1[2]= new Star (270,320, 20);
star1[3]= new Star (495,47, 20);
star1[4]= new Star (574,135, 20);
star1[5]= new Star (88,285, 20);
star1[6]= new Star (270,17, 15);
star1[7]= new Star (252,193, 15);
}

void draw() {
  

star1[0].live();
star1[1].live();
star1[2].live();
star1[3].live();
star1[4].live();
star1[5].live();
star1[6].live();
star1[7].live();
}


//Key functions
void keyReleased() {
if (key== 's' || key== 'S' ) saveFrame("screenshot.png");
}

