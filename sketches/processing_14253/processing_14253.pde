
int color1 = 0; 
int color2 = 0; 
int color3 = 0;
int color4 = 0;


void setup () {
  size (200, 200);
}
void draw () {
  background (255);
  stroke (0);
  line (100, 0, 100, 200);
  line (0, 100, 200, 100);
  

  if (mouseX < 100 && mouseY < 100) {
    color1 = 0;
    fill (0);
    rect (0, 0, 100, 100);
  } else {
   color1 = color1 + 5;
   fill (color1, 0, 0, 125);
   rect (0, 0, 100, 100);
  }
    
  if (mouseX > 100 && mouseY < 100) {
    color2 = 0;
    fill (color2);
    rect (100, 0, 200, 100);
  } else {
  fill (0, 0, color2, 125);
   color2 = color2 + 5;
   rect (100, 0, 200, 100);
  }
  
  
  if (mouseX < 100 && mouseY > 100) {
   color3 = 0; 
    fill (0, color3, 0, 125);
   rect (0, 100, 100, 200);
  } else {
  fill (color3);
   color3 = color3 + 5;
   rect (0, 100, 100, 200);
  }
  
  if (mouseX > 100 && mouseY > 100) {
    color4 = 0;
    fill (color4);
    rect (100, 100, 200, 200);
  } else {
  fill (color4, color4/3, color4, 255);
   color4 = color4 + 5;
   rect (100, 100, 200, 200);
  }
  
  
  color1 = constrain (color1, 0, 255);
  color2 = constrain (color2, 0, 255);
  color3 = constrain (color3, 0, 255);
  color4 = constrain (color4, 0, 255);
}

