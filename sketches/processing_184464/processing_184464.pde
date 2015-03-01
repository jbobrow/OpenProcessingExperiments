
float px = 1;
float py = 300;
float v = 12.7;
void setup() {
size (600,600);
background (2457);
}
void draw () {
if( px < width/2){
  px=px+10;
} else {
  py=py-(v*1.5);
}
ellipse(px,py,10,10);
}
