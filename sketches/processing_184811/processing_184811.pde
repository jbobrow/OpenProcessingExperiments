
float y, y2, theta;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(0);
}

void draw() {  //draw function loops
    
    
    
    translate(width/2, height/2);
    rotate(theta);
    
    stroke(#ff0000);
    y+=2*cos(2*theta);
    point(0, y);
    
    stroke(#00ffff);
    y2+=1.5*sin(4*theta);
    point(0, y2);
    
    theta+=TWO_PI/360;
}
