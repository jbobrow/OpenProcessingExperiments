
void setup() {	
  size(600, 600);	
  colorMode(HSB, width, 180, width);
}	


void draw() {	
  background(0);
  for (int x=20;x<300;x+=20) {	
    stroke(mouseX, x, width);
    //connecting lines at different angles
    strokeWeight(6);
    line(x+width/2, height/2, 2*x, 590);
    strokeWeight(2);	
    line(x, height/2, 2*x, 590);
    strokeWeight(3);
    line(width/2, x, 2*x, width/2);
    strokeWeight(1);
    line(x, 0, x, height/2);
    strokeWeight(3);
    line(0, x, width/2, x);
    strokeWeight(6);
    line(x, height/2, width-x, height/2);

    //interactive balls
    strokeWeight(2);
    noFill();
    ellipse(mouseX, height/4, x, x);
    ellipse(width-mouseX, 3*height/4, x, x);
  }
}	


