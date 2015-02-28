
//alvaro gonzalez 
// spacebar = start over
//1 = stained-yellow paintbrush
//2 =  orange 
//3 = black line
//4 - yellow line
//5 = red line
//6 = black paintbrush





int previousX;
int previousY;
int mode;
void setup() {
  mode = 1;
  smooth();
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  noStroke();
  size(243, 429);
  background(0, 0, 100);
}

void draw () {




  if (mousePressed) {
    if (mode == 1) {
      noStroke();
      fill (42,100, 87);
      ellipse (mouseX, mouseY, 18, 18);
    }   
    
    if (mode == 2) {
      noStroke();
      fill (20,100,80);
      ellipse (mouseX, mouseY, 30, 30);
    }
    
      if (mode == 3) {
      stroke(0,0,0);
      strokeWeight(4);  
      line (previousX,previousY,mouseX,mouseY);
    }
    
    if (mode == 4) {
     stroke(47,100,93);
      strokeWeight(4);
      line (previousX,previousY,mouseX,mouseY);
    }
    if (mode == 5) {
     stroke(355,100,80);
      strokeWeight(7);
      line (previousX,previousY,mouseX,mouseY);
    }
      if (mode == 6) {
      noStroke();
      fill (0,0,0);
      ellipse (mouseX, mouseY, 18, 18);
    }
    
  }

  if (keyPressed) {
    if (key == ' ') {
      background(0, 0, 99);
    }
   
    if (key == '1') {
      mode = 1;
    }
    if (key == '2') {
      mode = 2;
    }
    if (key == '3') {
      mode = 3;
    }
    if (key == '4') {
      mode = 4;
    }
     if (key == '5') {
      mode = 5;
    }
    if (key == '0') {
      mode = 0;
    }
    if (key == '6') {
      mode = 6;
    }
  }
 
  previousX = mouseX;
  previousY= mouseY;
}
