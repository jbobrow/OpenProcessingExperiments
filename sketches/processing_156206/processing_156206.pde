
float rect1x = 100; 
float rect1y = 100;
float rect1size = 200; 

float rect2x = 300; 
float rect2y = 100;
float rect2size = 200; 

float ellipseX = 300; 
float ellipseY = 300; 
float ellipseSize = 200; 

void setup() {
  size(600, 600);
} 

void draw() {  

  if ( mouseX > rect1x && mouseX < rect1x + rect1size &&
    mouseY > rect1y && mouseY < rect1y + rect1size) {
    fill(random(255), random(255), random(255)); // do something
  } 
  else if (mouseX > rect1x && mouseX < rect1x + rect1size) {
    fill(random(255), 0, 0 );
  }
  else { 
    fill(255, 0, 0);
  }
  rect(rect1x, rect1y, rect1size, rect1size); 

  if ( mouseX > rect2x && mouseX < rect2x + rect2size &&
    mouseY > rect2y && mouseY < rect2y + rect2size) {
    fill(random(255), random(255), random(255)); // do something
  } 
  else if (mouseX > rect2x && mouseX < rect2x + rect2size) {
    fill(0, 0, random(255) );
  }
  else { 
    fill(0, 0, 255);
  }

  rect(rect2x, rect2y, rect2size, rect2size); 

  ellipseX += 0.1;
  ellipseY += 0.1; 


  float distance = dist(mouseX, mouseY, ellipseX, ellipseY); 
  if (distance < ellipseSize/2) {
    fill(255);
  } 
  else {
    fill(0);
  }


  ellipse(ellipseX, ellipseY, ellipseSize, ellipseSize);

  println(distance);
}


void mousePressed() {
  if ( mouseX > rect1x && mouseX < rect1x + rect1size &&
    mouseY > rect1y && mouseY < rect1y + rect1size) {
    background(200, 0, 0);
  } 
  else if ( mouseX > rect2x && mouseX < rect2x + rect2size &&
    mouseY > rect2y && mouseY < rect2y + rect2size) {
    background(0, 0, 200);
  } 
  else { 
    background(180);
  }


  float distance = dist(mouseX, mouseY, ellipseX, ellipseY); 
  if (distance < ellipseSize/2) {
    ellipseX = mouseX; 
    ellipseY = mouseY;
  } 
  else {
  }
} 



