
import processing.opengl.*;

/**
 * Processing Workshop 3
 *
 * Open Space Aarhus 
 * http://gfx.osaa.dk
 *
 * Kanonen er nu blevet til en fontæne
 * som kan drejes med piletasterne til
 * højre og venstre
 */

// antal kanonkugler
int ANTAL = 500;

// jordhøjde
int JORD_Y = 350;

// kanonkuglens position
float[] kugleX = new float[ANTAL];
float[] kugleY = new float[ANTAL];

// kanonkuglens hastighed
float[] dx = new float[ANTAL];
float[] dy = new float[ANTAL];

// kanonkuglens alder
int[] alder = new int[ANTAL];

// tyngdeacceleration
float tyngdeAcc = 0.1;

// kanonens vinkel (45 grader)
float cannonA = -PI / 4.0;

// hvilken kugle skyder vi med næste gang
int skydermed = 0;

void setup() {
  size(600, 400);
  smooth();
  
  ellipseMode(CENTER);
  noStroke();
}

void draw() {
  for (int i = 0; i < 5; i++) {
    skyd();
  }
  
  for (int i = 0; i < ANTAL; i++) {
    opdaterKugle(i);
  }

  // slet skærmen
  background(0, 0, 0);

  // tegn kuglerne
  for (int i = 0; i < ANTAL; i++) {
    tegnKugle(i);
  }
  
  // tegn kanonen
  fill(100, 100, 100);
  translate(10, JORD_Y - 30);
  rotate(cannonA);  
  rect(-20, -12, 80, 24);  
}

void opdaterKugle(int k) {
  alder[k] += 1;
  
  // tyngdekraft
  dy[k] += tyngdeAcc;
  
  // læg hastighed til position  
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
   
}

void tegnKugle(int k) {   
  fill(255 - alder[k] / 3, 255 - alder[k] * 2, 200 - alder[k] * 4);  
  ellipse(kugleX[k], kugleY[k], 5, 5);      
}

void keyPressed() {
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
  }
}

void skyd() {
    // kanonkuglens start position
    kugleX[skydermed] = 10 + 30 * cos(cannonA);
    kugleY[skydermed] = JORD_Y - 30 + 30 * sin(cannonA);

    float afvigelse = random(-0.15, 0.15);
    float power = random(5, 10);
    // kanonkuglens start hastighed
    dx[skydermed] = power * cos(cannonA + afvigelse);
    dy[skydermed] = power * sin(cannonA + afvigelse);
    
    // nulstil alder
    alder[skydermed] = 0;    
    skydermed = (skydermed + 1) % ANTAL;
}

