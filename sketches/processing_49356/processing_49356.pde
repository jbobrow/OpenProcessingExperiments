

class Benedict {
  color c;
  float x, y, h;
  
  //Benedict constructor
  Benedict(float tempX, float tempY, float tempH, color tempC) {
    x = tempX;
    y = tempY;
    h = tempH;
    c = tempC;
  }
  
  //Display Benedict
  void display (float tempX, float tempY) {
    x = tempX;
    y = tempY;
    
    ellipseMode(CENTER);
    rectMode (CENTER);
    
    //Benedict's Shadow
    fill(255);
    ellipse(x, height * .9, y-h*4, h/5);
    
    //Benedict's Suit
    fill(255);
    stroke(255);
    strokeWeight(h * .52);
    line(x, y - h/5, x, y + h/5);
    
    //Benedict's Face
    stroke(0);
    strokeWeight(h * .38);
    line(x, y - h/7, x, y - h/25);

   //Benedict's Eyes and Mouth
    fill(255);
    noStroke();
    ellipse(x - h/10, y - h/15, h/20, h/20);
    ellipse(x + h/10, y - h/15, h/20, h/20);
    stroke(255);
    strokeWeight(h * .02);
    line(x - h/50, y + h/25, x + h/50, y + h/25);
    
    //Benedict's Antenna
    strokeWeight(h * .03);
    line(x, y - h * .45, x, y - h/1.7);
    
    //Benedict's Nodes
    fill(c);
    noStroke();
    arc(x - h * .26, y - h/15, h/7.5, h/7.5, radians(90), radians(270));
    arc(x + h * .26, y - h/15, h/7.5, h/7.5, radians(270), radians(450));
    ellipse(x, y - h/1.7, h/20, h/20);
  } 
}

