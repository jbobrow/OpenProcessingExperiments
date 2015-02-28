

//rainbow thing by _ks


int x;
int y;

void setup () {
  size(700,400);
  colorMode (HSB);
  frameRate (15);
}

void draw () {
  for (int i = 0; i <= width; i += 5){
    for (int j = 0; j <= height; j += 5){
      
      x = mouseX;     
      y = mouseY;
      
      float Mim = dist (i,i,x,y);      
      PracticeFunction (i, j, Mim);
            
    }
  }
}

void PracticeFunction (float a, float b, float c){
  float r = random (0,15);
  float r2 = random (60,65);
  float r3 = random (60,65);

  fill (r+c, r2+c, r3+c);
  rect (a, b, c, c);
}




