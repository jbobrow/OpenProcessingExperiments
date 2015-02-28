
/**
 * Processing Workshop 3
 * Open Space Aarhus 
 * http://gfx.osaa.dk
 *
 * Drej kanonen med piletasterne og skyd med mellemrumstasten
 */

// antal kanonkugler
int ANTAL = 10;

int JORD_Y = 350;

// kanonkuglens position
float[] kugleX = new float[ANTAL];
float[] kugleY = new float[ANTAL];

// kanonkuglens hastighed
float[] dx = new float[ANTAL];
float[] dy = new float[ANTAL];

// tyngdeacceleration
float tyngdeAcc = 0.1;

// kanonens vinkel (45 grader)
float cannonA = -PI / 4.0;

// målskivens position
float targetX = 300;
float targetY = 300;

// hvilken kugle skyder vi med næste gang
int skydermed = 0;

void setup() {
  size(600, 400);
  smooth();
  
  ellipseMode(CENTER);
  noStroke();
}

void draw() {
  // slet skærmen med en himmelblå farve
  background(200, 200, 255);
  
  // tegn jorden med en grønlig farve
  fill(100, 200, 0);
  rect(0, JORD_Y - 50, width, 100);
  
  for (int i = 0; i < ANTAL; i++) {
    opdaterKugle(i);
  }
  
  // vi skal tegne alle skygger før alle kugler
  // ellers kommer skyggerne ovenpå kuglerne

  // tegn målskivens skygge
  fill(0, 100, 0);
  ellipse(targetX, JORD_Y, 40, 5);

  // tegn kuglernes skygger
  for (int i = 0; i < ANTAL; i++) {
    tegnSkygge(i);
  }

  // tegn målskiven
  fill(255, 0, 0);
  ellipse(targetX, targetY, 40, 40);

  fill(255, 255, 255);  
  ellipse(targetX, targetY, 30, 30);
  
  fill(255, 0, 0);
  ellipse(targetX, targetY, 10, 10);  
  
  // tegn kuglerne
  for (int i = 0; i < ANTAL; i++) {
    tegnKugle(i);
  }
  
  // tegn kanonen
  fill(100, 100, 100);
  translate(10, JORD_Y - 30);
  rotate(cannonA);  
  // prøv at indsætte et billede i stedet for
  rect(-20, -12, 80, 24);  
}

void opdaterKugle(int k) {
  // tyngdekraft
  dy[k] += tyngdeAcc;
  
  // vindmodstand
  dx[k] *= 0.995;
  dy[k] *= 0.995;

  // flyt kanonkuglen  
  kugleX[k] += dx[k];
  kugleY[k] += dy[k];
  
  // skift retning når bolden rammer venstre eller højre kant
  if (kugleX[k] > width || kugleX[k] < 0) {
    dx[k] = -dx[k];
    kugleX[k] = constrain(kugleX[k], 0, width);
  }
  
  // skift retning når bolden rammer bunden
  if (kugleY[k] > JORD_Y - 10) {
    dy[k] = -dy[k];
  
    // sørg for at kuglen aldrig går under jorden  
    if (kugleY[k] > JORD_Y - 10) {
      kugleY[k] = JORD_Y - 10;
    }  
    
    // stjæl noget af kuglens energi
    dx[k] *= 0.5;
    dy[k] *= 0.5;
  }
   
  // flyt målet til et nyt tilfældigt sted, hvis bolden rammer målet 
  if (dist(kugleX[k], kugleY[k], targetX, targetY) < 30) {
    targetX = 100 + random(400);
    targetY = 100 + random(200);
  }     
}

void tegnSkygge(int k) {
  // tegn kanonkugles skygge
  fill(0, 100, 0);
  ellipse(kugleX[k], JORD_Y, 20, 5);
}

void tegnKugle(int k) {   
  // tegn kanonkugle
  fill(0);
  ellipse(kugleX[k], kugleY[k], 20, 20);      
}

void keyPressed() {
  if (key == 'q') noLoop();
  if (key == 'w') loop();
  
  if (keyCode == LEFT) {
    // drej kanon mod uret
    cannonA -= 0.05;    
    if (cannonA < -PI / 2.0) {
      cannonA = -PI / 2.0;
    }
  } else if (keyCode == RIGHT) {
    // drej kanon med uret
    cannonA += 0.05;
    if (cannonA > 0) cannonA = 0;
  } else if (key == ' ') {
    // kanonkuglens start position
    kugleX[skydermed] = 10 + 10 * cos(cannonA);
    kugleY[skydermed] = JORD_Y - 30 + 10 * sin(cannonA);
    
    // kanonkuglens start hastighed
    dx[skydermed] = 12 * cos(cannonA);
    dy[skydermed] = 12 * sin(cannonA);
    
    skydermed = (skydermed + 1) % ANTAL;
  }  
}

