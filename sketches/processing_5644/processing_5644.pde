
//sketch by _ks

void setup (){
  size (700,400);
  smooth();
  noStroke();
  colorMode (HSB);
}

//are all variable declarations local?
void draw (){
  for (int i = 0; i <= width; i += 20){
    for (int j = 0; j <= height; j += 20){
      
      float MDist; MDist = dist(mouseX, mouseY, i, j);
      float hypot; hypot = dist(0,0,width,height);
      float rWidth; rWidth = ((MDist / hypot) * 55);
      float rHeight; rHeight = ((MDist / hypot) * 55);
      
 
 
      fill(MDist, i, j);
      rect (i,j, rWidth, rHeight);
    }
  } 
}

