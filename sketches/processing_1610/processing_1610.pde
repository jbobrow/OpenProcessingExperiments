
PImage bg;
int a;
 
void setup() {
  size(366, 248);
  frameRate (30);
 bg=loadImage ("sketchbook_blank.jpg");
 //noLoop ();
}

void draw() {
  stroke(0,0,0,255);
  background(bg);
  //a= (a+1)%(width+32);
  //line(0,a,width,a-26);
  //line(0,a-6,width,a-32);

  if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}



