
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

// kanonens vinkel (45 grader)
float cannonA = -PI / 4.0;

// målskivens position
float targetX = 300;
float targetY = 300;

void setup() {
  size(600, 400);
  smooth();
  
  ellipseMode(CENTER);
}

void draw() {
  //--- først opdaterer vi kanonkuglen mm ---
  
  // flyt kanonkuglen  
  kugleX += dx;
  kugleY += dy;
  
  // skift retning når bolden rammer venstre eller højre kant
  if (kugleX > width || kugleX < 0) {
    dx = -dx;
    kugleX = constrain(kugleX, 0, width);
  }
  
  // skift retning når bolden rammer toppen eller bunden
  if (kugleY > height || kugleY < 0) {
    dy = -dy;
    kugleY = constrain(kugleY, 0, height);
  }
   
  // flyt målet til et nyt tilfældigt sted, hvis bolden rammer målet 
  if (dist(kugleX, kugleY, targetX, targetY) < 30) {
    targetX = 100 + random(400);
    targetY = 100 + random(200);
  }   
  
  //--- dernæst tegner vi grafikken igen ---
   
  // slet skærmen med en himmelblå farve
  background(200, 200, 255);

  // tegn kanonkugle
  fill(0);
  ellipse(kugleX, kugleY, 20, 20);  
  
  // tegn målskiven
  fill(255, 0, 0);
  ellipse(targetX, targetY, 40, 40);
  
  // tegn kanonen
  strokeWeight(20);
  line(0, 400, 50 * cos(cannonA), 400 + 50 * sin(cannonA));
  strokeWeight(1);
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
    kugleX = 0;
    kugleY = 400;
    
    // kanonkuglens start hastighed
    dx = 10 * cos(cannonA);
    dy = 10 * sin(cannonA);
  }  
}


