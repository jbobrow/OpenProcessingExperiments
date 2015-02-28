
float moveUp = 0;
float moveOffsetUp1 = 100;
float moveOffsetUp2 = 250;
float scaleUp;
float Origin1 = 0;
float ab;
float radius = 100;

float moveDown = 0;
float moveOffsetDown1 = 200;
float moveOffsetDown2 = 400;
float moveOffsetDown3 = 550;
float scaleDown;
float Origin2 = 0;
float bc;

void setup () {
  size (600, 600);
  background (155, 200);
  smooth ();
  frameRate (10);
  
}

void draw () {
  stroke (random(150));
  smooth ();
  
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
      ellipse(x, y, 6, 2);
      ellipseMode (CENTER);
      stroke (230, 100);
      moveDown += ab;
      
    }
    
     //wave scaling Down
    for (int x = 0; x <= width; x += 5) {
      float y = moveOffsetDown2 + (sin(moveDown) /scaleDown);
      ellipse(x, y, 6, 2);
      ellipseMode (CENTER);
      stroke (230, 100);
      moveDown += ab;
      
    }
   //wave scaling Down
    for (int x = 0; x <= width; x += 8) {
      float y = moveOffsetDown3 + (sin(moveDown) /scaleDown);
      ellipse(x, y, 6, 2);
      ellipseMode (CENTER);
      stroke (230, 100);
      moveDown += ab;
      
    }
  
  
     //wave scaling Up
    for (int x = 0; x <= width; x += 5) {
      float y = moveOffsetUp1 - (sin(moveUp) / scaleUp);
      ellipse(x, y, 6, 2);
      ellipseMode (CENTER);
      stroke (120, 50);
      moveUp += bc;
    
    }
    
  
     //wave scaling Up 2
    for (int x = 0; x <= width; x += 6) {
      float y = moveOffsetUp2 - (sin(moveUp) / scaleUp);
      ellipse(x, y, 6, 2);
      ellipseMode (CENTER);
      stroke (120, 50);
      moveUp += bc;
    
    }
   
   Origin1 += 0.2;
   Origin2 +=0.1;
}

