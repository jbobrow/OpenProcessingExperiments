

int w;
int h;



void setup () {
  size (400, 400);
  background (255, 255, 255);
  w = width/2;
  h = height/2;
}

void draw () {
  background (255, 255, 255);
  line (200, 0, 200, 400);
  line (400, 200, 0, 200);

  if ((mouseX < width/2) && (mouseY < height/2 )) {
    fill (255, 0, 0);
    rect (0, 0, w, h);
    
  } else if ((mouseX < width/2) && (mouseY > height/2)) {
    fill (0,255,0);
    rect (0,width/2,w,h);
    
  } else if ((mouseX > width/2) && (mouseY < height/2)) {
    fill (0,0,255);
    rect (width/2,0,w,h);
    
  } else if ((mouseX > width/2) && (mouseY > height/2)) {
    fill (255,255,0);
    rect (width/2,height/2,w,h);
    
    
  }
  
  
}


