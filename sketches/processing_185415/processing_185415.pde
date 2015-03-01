
void setup () {
  size(600, 600);
  }
  void draw(){
    if (mouseY<height/2) {
      background(255);
        }
        else  {
background(0);
}

if (mouseY>300){
ellipse (width/2, height/2, 200, 200);
fill (255);
stroke (255);
}

if (mouseY<300){
ellipse (width/2, height/2, 200, 200);
fill (0);
stroke (0);
}

}
