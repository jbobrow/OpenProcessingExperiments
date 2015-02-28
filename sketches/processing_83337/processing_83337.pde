
void keyPressed() {
  println(keyCode);
  //left
  if (keyCode == 37) {
    xloc = xloc - speed;
    l= l+1;
    r=0;
  }
  //right
  if (keyCode == 39) {
    xloc = xloc + speed;
    r=r+1;
    l=0;
  }

}


