
float diameter; 
float angle = 0; 

void setup() {
 
 size(1280, 720);
smooth();

}

void draw() {
 
 if (key == 'q' || key == 'Q') {
  poop();
 } 
 
 if(key == 'w' || key == 'W') {
   pooptwo();
 }
 
 if(key == 'e' || key == 'E') {
   poopthree();
 }
 
}

void poop() {
  
  fill(255,0,0);
  background(255);
  float d2 = 10 + (sin(angle + height/2) * width/2) + diameter/2;
  ellipse(mouseX, height/2, d2, d2);

  angle += 0.05;
}

void pooptwo() {
  
   background(0);
   if (mousePressed) {
    fill(0);
  } else {
    fill(255);
    noStroke();
  } 
  rect(mouseX, height/2, mouseX/2+11, mouseY/2+11);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/2, (inverseY/2)+11, (inverseY/2)+11);
  
}

void poopthree() { 
  
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 60, 60); 

}


