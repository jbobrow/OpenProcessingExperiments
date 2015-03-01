
float x;
float y;

void setup (){
  size (300, 300);
  smooth ();
  noStroke ();
  randomSeed (10);
  
}

void draw (){
  background (0);
  rect (0, 0, width, height);
if ((mouseX >= 0) && (mouseX <= 100)) {
    fill (32, 116, 131);
    rect (0, 0, 100, 300);
    fill (41, 208, 240);
    ellipse (mouseX, mouseY, 70, 70);
  }else if ((mouseX >= 100) && (mouseX <=200)){
    fill (41, 62, 240);
    rect (100, 0, 100, 300);
    fill (186, 192, 240);
    ellipse (mouseX, mouseY, 70, 70);
  }else if ((mouseX >=200) && (mouseX <= 300)){
    fill (15, 255, 69);
    rect (200, 0, 100, 300);
    fill (207, 250, 217);
    ellipse (mouseX, mouseY, 70, 70);
    
   
  
  
  }
}


