
void  mousePressed() {

  //Course selector - goes to hole 1
  if (mouseX > courseX && mouseX < courseY && mouseY > courseX1 && mouseY < courseY1 && c1 == false) {
    c1 = true;
    courseX = courseX+1000;
    courseX1 = courseX1+1000;
    courseY = courseY+1000;
    courseY1 = courseY1+1000;
  }

  //Weather Button
  if ( mouseX > wthrX && mouseX < wthrX1 && mouseY > wthrY && mouseY < wthrY1 )
  { 
    wthr = true;
    wthrX = wthrX+1000;
    wthrX1 = wthrX1+1000;
    wthrY = wthrY+1000;
    courseY1 = wthrY1+1000;
  }

  //Menu Button
  if (mouseX > homeX && mouseX < homeX1 && mouseY > homeY && mouseY < homeY1 && c1 == true && menu == false) {
    menu = true;
    c1 = false;
    courseX = courseX-1000;
    courseX1 = courseX1-1000;
    courseY = courseY-1000;
    courseY1 = courseY1-1000;
  }

  //FWD Button
  if (mouseX > fwdX && mouseX < fwdX1 && mouseY > fwdY && mouseY > fwdY1 && c1 == false && menu == false) {
    c1 = false;
    menu = false;
    c2 = true;
    courseX = courseX+1000;
    courseX1 = courseX1+1000;
    courseY = courseY+1000;
    courseY1 = courseY1+1000;
  }
}



