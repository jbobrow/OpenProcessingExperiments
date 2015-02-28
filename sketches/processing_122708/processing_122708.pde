
int x, y, a, b, c, d, e; //zahyou
int space = 5; //haba

void setup() { //settei
  size(600, 600);
  background(255);
  noStroke();
  smooth();
  fill(0);
 a = 0;
  b = 0;
  c = 0;
  d = 10;
  e = 10;
}

void draw() { 
  ellipse(mouseX, mouseY, 10, 10);
}

void mouseDragged() { //mausu ugoku sennkaku
  fill(a);
  ellipse(mouseX, mouseY, 10, 10);
  fill(255);
}

void keyPressed() { 
  if (key == CODED) {
    if (keyCode == SHIFT) {

      rect(0, 0, 600, 600);
    }
    
     else if (keyCode == UP) { //kurosenn
      a = 0;
      b = 0;
      c = 0;
    }
        else if (keyCode == ALT) { //kesigomu
      d = 20;
      e = 20;
      a = 255;
      b = 255;
      c = 255;
    }
  }
}



