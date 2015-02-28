

void drawPic(color c) {
  
  float r = red(c);
  float g = green(c);
  float b = blue(c);
  
  tint(c);
  
  if(counter < 125) {
    image(img,newx,newy);
  } else if(counter >= 125 && counter < 250) {
    image(img1,newx,newy);
  } else if(counter >= 250 && counter < 375) {
    image(img2,newx,newy);
  } else {
    image(img3,newx,newy);
  }
  
  if(counter >= 500) {
    counter = 0;
  }
  
}

