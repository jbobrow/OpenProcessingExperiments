
float moveUp = 0;
float moveOffsetUp1 = 200;
float moveOffsetUp2 = 400;
float scaleUp;
float Origin1 = 0;
float ab;
float radius = 100;

float moveDown = 0;
float moveOffsetDown1 = 100;
float moveOffsetDown2 = 300;
float moveOffsetDown3 = 500;
float scaleDown;
float Origin2 = 0;
float bc;

void setup () {
  size (600, 600);
  background (150, 120);
  smooth ();
  frameRate (10);
  
}

void draw () {
  stroke (random(150));
  smooth ();
  
 float r = random (120, 400);
  float g = random (88, 350);
  float b = random (50, 200);
  float c = random (80, 150);
  stroke(r, g, b, c);
  
  
  moveUp = random (35);
  moveDown = random (35);  
  scaleUp = random (20);
  scaleDown = random (20);
  
moveUp = Origin1;
moveDown = Origin2;

ab = PI/random (35);
bc = PI/random (35);
  
  
    //wave scaling Down
    for (int x = 0; x <= width; x += 5) {
      float y = moveOffsetDown1 + (sin(moveDown) /scaleDown);
      rect(x, y, 5, 2);
      ellipseMode (CENTER);
      stroke (g, r, 130, 180);
      moveDown += ab;
      
    }
    
     //wave scaling Down
    for (int x = 0; x <= width; x += 5) {
      float y = moveOffsetDown2 + (sin(moveDown) /scaleDown);
      rect(x, y, 6, 2);
      ellipseMode (CENTER);
      stroke (b, g, 90, 140);
      moveDown += ab;
      
    }
   //wave scaling Down
    for (int x = 0; x <= width; x += 8) {
      float y = moveOffsetDown3 + (sin(moveDown) /scaleDown);
      rect(x, y, 6, 2);
      ellipseMode (CENTER);
      stroke (c, b, 50, 120);
      moveDown += ab;
      
    }
  
  
     //wave scaling Up
    for (int x = 0; x <= width; x += 5) {
      float y = moveOffsetUp1 - (sin(moveUp) / scaleUp);
      rect(x, y, 6, 2);
      ellipseMode (CENTER);
      stroke (r, g, 80, 110);
      moveUp += bc;
    
    }
    
  
     //wave scaling Up 2
    for (int x = 0; x <= width; x += 6) {
      float y = moveOffsetUp2 - (sin(moveUp) / scaleUp);
      rect(x, y, 6, 2);
      ellipseMode (CENTER);
      stroke (r, b, 60, 100);
      moveUp += bc;
    
    }
   
   Origin1 += 0.2;
   Origin2 +=0.1;
}

