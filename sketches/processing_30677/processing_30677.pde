
class Circle {

  int posX;
  int posY;
  color[] colors = {color(255,146,1), color(255,208,71), color(195), color(63,199,222), color(0,143,199)};

  
  Boolean mouseOver;

  Circle (int _posX, int _posY) {
    posX = _posX;
    posY = _posY;
  }
  
  void display() {
    //mouse over circle test
    if( sqrt(sq(posX - mouseX) + sq(posY - mouseY)) < 50/2 ) {
      mouseOver = true;
    } else {
      mouseOver = false;
    }
    
    if(mouseOver) {
      fill(40, 40, 40);
    } else {
      fill(colors[int(random(colors.length))]);
    }
    
    ellipseMode(CENTER);
    
    //draw the outer circles
    noStroke();
    ellipse(posX, posY, 42, 42);
    
    
    //draw the inner circles
    if(mouseOver) {
      fill(40, 40, 40);
      stroke(24, 24, 24);
    } else {
      fill(255);
      stroke(51, 51, 51);
    }
    
    strokeWeight(2);
    ellipse(posX, posY, 35, 35);
  }
}


