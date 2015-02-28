
int x = 200;
int y = 150;
int radius = 200;
int radius2 = 48;


void setup() {
  size(500, 500);
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  background(100);
  float d = dist(mouseX, mouseY, x, y);
  if (d < radius) {
      if(radius2 > 5){
        radius++;
        radius2--;
    }
      fill(255);

  }else{
      fill(0);
      if(radius2 > 48){
        radius2++;
     }
  }
    
  ellipse(x, y, radius, radius);
  if(mousePressed) {
    fill(255);
    strokeWeight(10);
  } 
  else {
    fill(0);
    strokeWeight(10);

  }
    ellipse(mouseX, mouseY, radius2, radius2);
    
   
}       
