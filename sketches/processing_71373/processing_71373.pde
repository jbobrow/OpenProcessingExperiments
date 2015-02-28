
int radius; 
float posX; 
float posY;
int posX2; 
int posY2; 
int posX3; 
int posY3; 
int x; 
int y; 
float plX; 
float plY;
int R; 
int plX2; 
int plY2; 
int plX3; 
int plY3; 
void setup(){ 
  
  posX = 50; 
  posY = 20; 
  posX2= 40; 
  posY2= 100; 
  posX3= 60; 
  posY3= 200; 
  x = 50; 
  y = 60; 
  radius = 5; 
  plX = 2;
  plY = 4;
  plX2= 3; 
  plY2= 5; 
  plX3= 1; 
  plY3= 10; // different speeds and directions for the three balls 
  R = 15;  // radius of bouncing balls 
  size (500, 500); 
  smooth(); 
  ellipseMode(RADIUS); 
} 

void draw(){ 
 
  background (190, 240, 150); 
  fill(220, 30, 230, 100); 
  noStroke(); 
  ellipse(posX, posY, 30, 30); 
  ellipse(posX2, posY2, 30, 30); 
  ellipse(posX3, posY3, 30, 30); // three bouncing balls 
 
  
  posX+= plX; //make balls move 
  posY+= plY;  
  
  posX2+= plX2; 
  posY2+= plY2; 
  
  posX3+= plX3; 
  posY3+= plY3; 

  if ((posX >= width- R ) || (posX <= 0 + R)) { //within width 
    plX *= -1;
  }
  if ((posY >= width- R)|| (posY <= 0 + R)) {// within height (sq w.e)
    plY*= -1;
  }
  
    if ((posX2 >= width- R ) || (posX2 <= 0 + R)) { //within width 
    plX2 *= -1;
  }
  if ((posY2 >= width- R)|| (posY2 <= 0 + R)) {// within height (sq w.e)
    plY2*= -1;
  }
  
    if ((posX3 >= width- R ) || (posX3 <= 0 + R)) { //within width 
    plX3 *= -1;
  }
  if ((posY3 >= width- R)|| (posY3 <= 0 + R)) {// within height (sq w.e)
    plY3*= -1;
  }
    float d = dist(mouseX, mouseY, x, y); 
  if (d < radius) { 
    frameRate(10); 
    radius++; 
    fill(255, 0, 200, 23);
    fill(random(255), random(255), random(255), random(255)); 
    ellipse(posX, posY, 30, 30); 
    ellipse(posX2, posY2, 30, 30); 
    ellipse(posX3, posY3, 30, 30); 
  } else{ 
    frameRate(60); 
    fill(208, 208, 208, 32); 
  
  } 
  fill(100, 100, 100, 190); 
  ellipse(x, y, radius, radius); 
  ellipse(x+100, y, radius, radius); 
  ellipse(x+200, y, radius, radius); 
  ellipse(x+300, y, radius, radius); 
  ellipse(x+400, y, radius, radius); 
  ellipse(x, y+100, radius, radius); 
  ellipse(x, y+200, radius, radius); 
  ellipse(x, y+300, radius, radius); 
  ellipse(x, y+400, radius, radius); 
  ellipse(x+100, y+100, radius, radius); 
  ellipse(x+200, y+200, radius, radius); 
  ellipse(x+300, y+300, radius, radius); 
  ellipse(x+400, y+400, radius, radius); 
  ellipse(x+100, y+200, radius, radius); 
  ellipse(x+100, y+300, radius, radius); 
  ellipse(x+200, y+100, radius, radius); 
  ellipse(x+200, y+300, radius, radius); 
  ellipse(x+100, y+400, radius, radius); 
  ellipse(x+300, y+100, radius, radius); 
  ellipse(x+300, y+400, radius, radius); 
  ellipse(x+200, y+400, radius, radius); 
  ellipse(x+300, y+400, radius, radius); 
  ellipse(x+400, y+300, radius, radius);
  ellipse(x+400, y+200, radius, radius); 
  ellipse(x+400, y+300, radius, radius); 
  ellipse(x+400, y+100, radius, radius); 
  ellipse(x+300, y+200, radius, radius); 
  
  
  
   if (keyPressed == true) { 
    if (key == CODED) { 
      if (keyCode == UP) { 
        fill(0);
        ellipse(posX, posY, 40, 40); 
      } 
      if (keyCode == DOWN) { 
       fill(255); 
       ellipse(posX2, posY2, 40, 40); 
      } 
      if (keyCode == CONTROL) { 
       fill(50); 
       ellipse(posX3, posY3, 40, 40); 
      } 
    }
        
  } 
}

