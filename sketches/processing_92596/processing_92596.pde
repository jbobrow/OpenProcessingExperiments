
//  
//  Hot/Cold - Thick/Thin Line
//  Jürg Dietrich
//  11.03.2013


void setup() {
  size(800,800);
  background(0);
}
 
void draw() {
  if (key == '0'){
      background(0);
  }
  if (mousePressed) {
    if (key == '1'){
      hotColdLine(mouseX, mouseY, pmouseX, pmouseY);
    }
    else if (key == '3'){
      patternLine(mouseX, mouseY, pmouseX, pmouseY);
    }
    else if (key == '2'){
      thickLine(mouseX, mouseY, pmouseX, pmouseY);
    }

  }
}

 
void hotColdLine(int x, int y, int px, int py) {
  
  float speed = 3*(abs(x-px) + abs(y-py));

  strokeWeight(8);
  stroke(speed,0,255-speed);
  
  line(x, y, px, py);
}

void patternLine(int x, int y, int px, int py) {
  
  float speed = 3*(abs(x-px) + abs(y-py));
  
  strokeWeight(1);
  if (key == '2')
  stroke(200,200,200);
  
  line(px+speed/20, py-speed/20, x, y);
  line(px-speed/20, py+speed/20, x, y);
  line(px, py, x+speed/20, y-speed/20);
  line(px, py, x-speed/20, y+speed/20);
}

void thickLine(int x, int y, int px, int py) {
  
  float speed = (abs(x-px) + abs(y-py))/10;
  smooth();
  strokeWeight(speed);
  stroke(200,200,200);
  
  line(px, py, x, y);
}
