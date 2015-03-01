
float px = 1;
void setup() {
size (600,600);
}
void draw () {
if( px < width/2){
  px=px+10;
}

ellipse(px,300,10,10);
}

