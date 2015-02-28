
  int Y_AXIS = 1; 
  int X_AXIS = 2; 

void bgColor() {

  color b1 = color(25.0,96);
  color b2 = color(54,97,255); 
  setGradient(0, 0, width, height, b1, b2, Y_AXIS);
  
  //moon
  fill(208,208,208);
  ellipse(300, 700, 100, 100);
  fill(54,97,255);
  ellipse(288,690,70,70);

  
  int counter = 0; 
  while(counter <7){
    fill(255); 
    float r = random(10);
    ellipse(random(width), random(height), r,r);
    counter = counter +1;
  }
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis) {

  float deltaR = red(c2) - red(c1);
  float deltaG = green(c2) - green(c1);
  float deltaB = blue(c2) - blue(c1); 

  if (axis == Y_AXIS) {
    for (int i =x; i <=(x+w); i ++) {
      for (int j=y; j <= (y+h); j++) {
        color c = color((red(c1) + (j-y)*(deltaR/h)), (green(c1) + (j-y)*(deltaG/h)), (blue(c1) + (j-y)*(deltaB/h))); 
        set(i, j, c);
      }
    }
  }

  else if (axis == X_AXIS) {
    for (int i=y; i<=(y+h); i++) {
      for (int j=x; j<=(x+w); j++) {
        color c = color((red(c1) + (j-y)*(deltaR/h)), (green(c1) + (j-y)*(deltaG/h)), (blue(c1) + (j-y)*(deltaB/h))); 
        set(j, i, c);
      }
    }
  }
}


