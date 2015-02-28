
void setup () {
  size (200,200);
}
void draw () {
background(255);
int y= 0;
while(y<height) {
  stroke(0);
  line(0,y,200,y);
  y = y + 10;
}

}



