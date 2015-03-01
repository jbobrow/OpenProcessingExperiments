
/* @pjs font = "Baskerville-Bold-48.vlw"; */

PFont word;
int x = 150;
int y= 150;

void setup () {
  size (300, 300);
  word = loadFont ("Baskerville-Bold-48.vlw");
  textFont (word);
  fill (255);

  
}

void draw () {
  fill (0);
  rect (0, 0, width, height);
  fill (0);
  if ((mouseX >= x) && (mouseX <= x +100) && 
  (mouseY >= y-100) && (mouseY <=y)){
    fill (255, 15, 23);
  }else{
    fill (255);
  }
    text ("RED", x, y);
    
  
  }




