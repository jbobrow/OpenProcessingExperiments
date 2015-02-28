
void setup(){ 
  size(500,500); 
  background(255);
  fill(0); 
} 
 
void draw() { 
  int w = 20, h = 20; 

  if (keyPressed) 
    background(255); 

  if (mousePressed){ 
    for (int x = 0; x < width; x += w)
      for (int y = 0; y < height; y += 2*h)
        if (mouseX >= x && mouseX <= x+w)
          if (mouseY >= 2*abs(mouseX-x-w/2)+y && mouseY <= y+h)
            triangle(x,y+h,x+w/2,y,x+w,y+h);

    for (int x = -w/2; x < width; x += w)
      for (int y = h; y < height; y += 2*h)
        if (mouseX >= x && mouseX <= x+w)
          if (mouseY >= 2*abs(mouseX-x-w/2)+y && mouseY <= y+h)
            triangle(x,y+h,x+w/2,y,x+w,y+h);

    for (int x = -w/2; x < width; x += w)
      for (int y = 0; y < height; y += 2*h)
        if (mouseX >= x && mouseX <= x+w)
          if (mouseY <= -2*abs(mouseX-x-w/2)+y+h && mouseY >= y)
            triangle(x,y,x+w/2,y+h,x+w,y);

    for (int x = 0; x < width; x += w)
      for (int y = h; y < height; y += 2*h)
        if (mouseX >= x && mouseX <= x+w)
          if (mouseY <= -2*abs(mouseX-x-w/2)+y+h && mouseY >= y)
            triangle(x,y,x+w/2,y+h,x+w,y);
  }
}


