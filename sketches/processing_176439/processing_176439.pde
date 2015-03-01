
PVector[][] finalpositions = { 
  {new PVector(90, 60), new PVector(120, 60), new PVector(60, 90), new PVector(60, 120), new PVector(60, 150), new PVector(90, 180), new PVector(120, 180)},
  {new PVector(210, 60), new PVector(240, 60), new PVector(180, 90), new PVector(270, 90), new PVector(180, 120), new PVector(270, 120), new PVector(180, 150), new PVector(270, 150), new PVector(210, 180), new PVector(240, 180)},
  {new PVector(330, 60), new PVector(360, 60), new PVector(330, 90), new PVector(390, 90), new PVector(330, 120), new PVector(390, 120), new PVector(330, 150), new PVector(390, 150), new PVector(330, 180), new PVector(360, 180)},
  {new PVector(450, 60), new PVector(480, 60), new PVector(510, 60), new PVector(450, 90), new PVector(450, 120), new PVector(480, 120), new PVector(510, 120), new PVector(450, 150), new PVector(450, 180), new PVector(480, 180), new PVector(510, 180)},
  {new PVector(270, 240), new PVector(300, 240), new PVector(240, 270), new PVector(270, 270), new PVector(300, 270), new PVector(330, 270), new PVector(240, 300), new PVector(270, 300), new PVector(300, 300), new PVector(330, 300), new PVector(270, 330), new PVector(300, 330)},
  {new PVector(150, 390), new PVector(180, 390), new PVector(120, 420), new PVector(210, 420), new PVector(120, 450), new PVector(150, 450), new PVector(180, 450), new PVector(210, 450), new PVector(120, 480), new PVector(210, 480), new PVector(120, 510), new PVector(210, 510)},
  {new PVector(270, 390), new PVector(300, 390), new PVector(330, 390), new PVector(270, 420), new PVector(330, 420), new PVector(270, 450), new PVector(300, 450), new PVector(270, 480), new PVector(330, 480), new PVector(270, 510), new PVector(330, 510)},
  {new PVector(390, 390), new PVector(420, 390), new PVector(450, 390), new PVector(420, 420), new PVector(420, 450), new PVector(420, 480), new PVector(420, 510)}
};

float red, green, blue = 0;

public float r;

void setup() {
  size(570, 570, P2D);
  smooth();
  noStroke();
  colorMode(RGB, 100);
  for (int i = 0; i < dots.length; i++) {
    dots[i] = new Dot();
  }
}

void draw() {
  background(100);
  stroke(red, green, blue);
  
  //draw grid of lines;
  int grid = 30;
  strokeWeight(0.3);
  for (int i = 0; i < width; i += grid) {line(i, 0, i, height);}
  for (int i = 0; i < height; i += grid) {line(0, i, width, i);}
  
  //draw dots
  for (int i = 0; i < dots.length; i++) {
    dots[i].checkEdges();
    if ((((floor(abs(mouseX-pmouseX))==0)) || (floor(abs(mouseX-pmouseX))==1)) && ((floor(abs(mouseY-pmouseY))==0) || (floor(abs(mouseY-pmouseY)))==1)) {
      dots[i].displayFinal();
    } else {
      dots[i].displayMove();
    }    
  }
}

void mouseMoved() {
  red = map(mouseX, 0, width, 0, 100);
  green = map(mouseY, 0, height, 0, 100);
  blue = map(mouseX+mouseY, 0, width+height, 100, 0);
}

Dot[] dots = new Dot[80];
 
class Dot {
  PVector location;
  PVector velocity;
  PVector acceleration;
   
  Dot() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void displayMove() {    
    r = lerp(r, 8, 0.8);
    for (int i = 0; i < dots.length; i++) {
      fill(red, green, blue);
      stroke(red, green, blue);
      ellipse(location.x, location.y, r, r);
      dots[i].followMouse();
    }
  }  
  
  void followMouse() {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(location);
    mouse.setMag(0.1);
    acceleration = mouse;
     
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(5);
  } 
  
  void displayFinal() {
    r = lerp(8, 12, 0.8);    
    for (int i = 0; i < finalpositions.length; i++) {
      for (int j = 0; j < finalpositions[i].length; j++) {
        stroke(red, green, blue);
        strokeWeight(0.3);
        point(location.x, location.y);
        stroke(red, green, blue);
        fill(red, green, blue);        
        ellipse(finalpositions[i][j].x, finalpositions[i][j].y, r, r);
      }
    }
  }
   
  void checkEdges() {
    if ((location.x+r/2 > width) || (location.x-r/2 < 0))  {
      velocity.x *= -1;
    }
    if ((location.y+r/2 > height) || (location.y-r/2 < 0)) {
      velocity.y *= -1;
    }    
  }
}
