
int x = 120;
int y = 60;
int radius = 152;

void setup() {
  size(300, 300);
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  background(0);
  float d = dist(mouseX, mouseY, x, y);
  if (d < radius) {
    radius--;
    
   
   if (d <= 20) { //Making the cirle bigger after it hits 0
     radius++;
   }
    
   
    
    noStroke();
    fill(255);
    ellipse(pmouseX, pmouseY, mouseX, mouseY);
    
    
    float speed = dist(pmouseX, pmouseY, mouseX, mouseY); //PMOUSE = PRESSED MOUSE
  
  fill(random(0,255), random(0,255), random(0,255)); //RANDOM COLOR
  ellipse(mouseX, mouseY, speed+10, speed+10);
    ellipse(mouseX, mouseY, speed+10, speed+10);
    


    
    
   } else {
    fill(255);
  }
  
  noStroke();
  ellipse(x, y, radius, radius);
}


