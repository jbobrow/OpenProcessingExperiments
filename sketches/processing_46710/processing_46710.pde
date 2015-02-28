
/**
 * Processing Workshop 2
 * Open Space Aarhus 
 * http://gfx.osaa.dk
 *
 * Drej kanonen med piletasterne og skyd med mellemrumstasten
 */

// kanonkuglens position
float kugleX = 0;
float kugleY = 400;

// kanonkuglens hastighed
float dx = 0;
float dy = 0;

// kanonkuglens acceleration
float ax = 0;
float ay = 0.1;

// kanonens vinkel
float cannonA = 0;

// målskivens position
float targetX = 300;
float targetY = 300;

void setup() {
  size(600, 400);
  smooth();
  
  ellipseMode(CENTER);
}


void draw() {
  // slet skærmen med en himmelblå farve
  background(200, 200, 255);

  // tyngdekraft
  dy += ay;
  
  // vindmodstand
  dx *= 0.995;
  dy *= 0.995;

  // flyt kanonkuglen  
  kugleX += dx;
  kugleY += dy;
  
  // skift retning når bolden rammer venstre eller højre kant
  if (kugleX > width || kugleX < 0) {
    dx = -dx;
  }
  
  // skift retning når bolden rammer toppen eller bunden
  if (kugleY > height || kugleY < 0) {
    dy = -dy;
  }
   
  // flyt målet til et nyt tilfældigt sted, hvis bolden rammer målet 
  if (dist(kugleX, kugleY, targetX, targetY) < 30) {
    targetX = 100 + random(400);
    targetY = 100 + random(200);
  }   
   
  // tegn kanonkugle
  fill(0);
  ellipse(kugleX, kugleY, 20, 20);  
  
  // tegn målskiven
  fill(255, 0, 0);
  ellipse(targetX, targetY, 40, 40);

  fill(255, 255, 255);  
  ellipse(targetX, targetY, 30, 30);
  
  fill(255, 0, 0);
  ellipse(targetX, targetY, 10, 10);
  
  // tegn kanonen
  translate(0, 400);
  rotate(cannonA);  
  rect(0, -10, 50, 20);
}

void keyPressed() {
  if (keyCode == LEFT) {
    // drej kanon mod uret
    cannonA -= 0.05;    
  } else if (keyCode == RIGHT) {
    // drej kanon med uret
    cannonA += 0.05;
  } else if (key == ' ') {
    // kanonkuglens start position
    kugleX = 50 * cos(cannonA);
    kugleY = 400 + 50 * sin(cannonA);
    
    // kanonkuglens start hastighed
    dx = 10 * cos(cannonA);
    dy = 10 * sin(cannonA);
  }  
}

