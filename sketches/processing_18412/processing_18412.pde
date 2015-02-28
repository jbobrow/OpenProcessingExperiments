
void setup (){
  size (600, 600);
  colorMode (HSB, 400);
  smooth ();

      background (400);
}

float x = 0;

void draw (){

  
  x++;
  
  
  
  fill (abs(x));
  
  ellipse (mouseX, mouseY, abs (x), abs (x));
  
  
  if(x > 400) {  
    x = -400;
  }
  
}

