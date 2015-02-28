
void drawToast(){
  float a = x+30;
  float b = y+30;
  float c = x-30;

  if (mousePressed){
    x = mouseX;
    y = mouseY;
  }
  image (t, x+15, y+15, 30, 30);
  image (lleg, x-5, lpos-40, 20, 30);
  image (rleg, x+35, rpos-40, 20, 30);
  image (tb, x, y, 50, 60);
  if (y < height/2 && x>width/2){
    y = y+5;
    image (ewing1, a, y-5);
    image (eface, a, b);
    image (ewing2, c, y-10, 50,50);
  }
  else if (y >height/2 && x >width/2){
    y = y-5;
    image (sface, a+15, b, 70, 40);
    image (sfin, x+5, y-15, 50, 50);
    image (stail, c-55, b, 90, 45);
  }
}


