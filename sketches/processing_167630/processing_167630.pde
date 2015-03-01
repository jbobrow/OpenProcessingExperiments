
/* @pjs font = "Baskerville-Bold-48.vlw"; */

PFont word;
int x = 150;
int y= 150;

void setup () {
  size (300, 300);
  word = loadFont ("Baskerville-Bold-48.vlw");
  textFont (word);
  fill (255);
  noStroke ();
 

  
}

void draw () {
  fill (242, 105, 121);
  rect (0, 0, 100, 300);
  fill (107, 242, 105);
  rect (100, 0, 100, 300);
  fill (105, 220, 242);
  rect (200, 0, 100, 300);
  if ((mouseX >= 0) && (mouseX <= 100)) {
    fill (255, 15, 23);
    text ("RED", mouseX-50, mouseY-50);
  }else if ((mouseX >= 100) && (mouseX <=200)){
    fill (10, 142, 11);
    text ("GREEN", mouseX-50, mouseY-50);
  }else if ((mouseX >=200) && (mouseX <= 300)){
    
    fill (44, 197, 255);
    text ("BLUE", mouseX-50, mouseY-50);
  }

  
  }




