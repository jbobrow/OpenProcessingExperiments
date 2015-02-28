
void animate() {
    
  if (scanImage1) {
    tint(255,200);
    image(startScreen, 0, 0);
    noTint();
    image(image1,0,100);
    stroke(0);
  }
  
  if (scanImage2) {
    tint(255,200);
    image(startScreen, 0, 0);
    noTint();
    image(image2,0,100);
    stroke(0);
  }
  
  if (scanImage3) {
    tint(255,200);
    image(startScreen, 0, 0);
    noTint();
    image(image3,0,100);
    stroke(0);
  }
  
  if (scanImage4) {
    tint(255,200);
    image(startScreen, 0, 0);
    noTint();
    image(image4,100,50);
    stroke(0);
  }
  
  if (xScroll) {
    line(x,0,x,height);
    x++;
  }
  
  else {
    line(x,0,x,height);
    x--;
  }
  
  if (yScroll) {
    line(0,y,width,y);
    y++;
  }
  
  else {
    line(0,y,width,y);
    y--;
  }
  

  
}

