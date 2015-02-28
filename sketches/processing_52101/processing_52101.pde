
int x = 80;
int y = 30;
int w = 80;
int h = 60;

void setup() {
  size(440, 620);
}

void draw() {
  noStroke();
  background(250,3,247);
  if ((mouseX > x) && (mouseX < x+w) &&
      (mouseY > y) && (mouseY < y+h)) {
    fill(random(0,255), random(0,255), random(0,255));
    
    
    for (int y = 200; y <= height-20; y += 15) {
  for (int x = 20; x <= width-20; x += 15) {
   
    
    rect(x+y, y-x, 25, 2.5);
    ellipse(x-y,y+70,5,5);
    arc(x-y, y+x, 20,20, radians(x), radians(y+x));
    rect(y-x, x-y, 50,50);
    
    rect(100-x,x+200, 5, 75);
    
        
    
    
    strokeWeight(1);
    stroke(x/2);
    stroke(0,51,255,80);
    
  }
    
    }
    
  } else {
    fill(255);
  }
  rect(x, y, w, h);
}

