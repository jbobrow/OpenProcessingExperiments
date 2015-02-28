
// returns true if mouse is inside this rectangle
boolean inside(int left, int top, int right, int bottom ) {
  
  if (mouseX>left && mouseX<right && mouseY>top && mouseY<bottom ) {

    return true;
  }

  else {
    return false;
  }
}


