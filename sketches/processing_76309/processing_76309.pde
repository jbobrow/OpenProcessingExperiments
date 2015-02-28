
Spring springA, springB, springC, springD, springE, springF, springG, springH;
PImage hand1;
PImage hand2, hand3, hand4;

void setup() {
  size(600, 700);

  hand1 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/hand1.png");
  hand2 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/hand2.png");
  hand3 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/hand3.png");
  hand4 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/hand4.png");

  springA = new Spring(200, 100, 40, 0.98, 8.0, 0.1);
  springB = new Spring(75, 150, 40, 0.98, 8.0, 0.1);
  springC = new Spring(75, 450, 40, 0.98, 8.0, 0.1);
  springD = new Spring(200, 500, 40, 0.98, 8.0, 0.1);
  springE = new Spring(400, 100, 40, 0.98, 8.0, 0.1);
  springF = new Spring(525, 150, 40, 0.98, 8.0, 0.1);
  springG = new Spring(525, 450, 40, 0.98, 8.0, 0.1);
  springH = new Spring(400, 500, 40, 0.98, 8.0, 0.1);
}

void draw() {
  fill(255, 255, 255, 50);
  rect(0, 0, width, height);
  fill(0);
  ellipse(width/2, height/2, 100, 100);

  strokeWeight(0);
  smooth();

  float noiseA = noise(millis()/1000.0);
  float noiseB = noise((millis()+12345)/1357.9);
  float noiseC = noise((millis()+23456)/1111.1);
  float noiseD = noise((millis()+34567)/1763.6);
  float noiseE = noise((millis()+45678)/1323.2);
  float noiseF = noise((millis()+56789)/1255.3);
  float noiseG = noise((millis()+67890)/1636.8);
  float noiseH = noise((millis()+78901)/1732.5);

  springA.update();
  springA.display(2);
  springB.update();
  springB.display(2);
  springC.update();
  springC.display(4);
  springD.update();
  springD.display(4);
  springE.update();
  springE.display(1);
  springF.update();
  springF.display(1);
  springG.update();
  springG.display(3);
  springH.update();
  springH.display(3);

  if ((springA.overEvent() == true) && (dist(springA.xpos, springA.ypos, springA.rest_posx, springA.rest_posy) < 200)) {
    springA.pressed();
  }
  else springA.released();

  if ((springB.overEvent() == true) && (dist(springB.xpos, springB.ypos, springB.rest_posx, springB.rest_posy) < 200)) {
    springB.pressed();
  }
  else springB.released();

  if ((springC.overEvent() == true) && (dist(springC.xpos, springC.ypos, springC.rest_posx, springC.rest_posy) < 200)) {
    springC.pressed();
  }
  else springC.released();

  if ((springD.overEvent() == true) && (dist(springD.xpos, springD.ypos, springD.rest_posx, springD.rest_posy) < 200)) {
    springD.pressed();
  }
  else springD.released();

  if ((springE.overEvent() == true) && (dist(springE.xpos, springE.ypos, springE.rest_posx, springE.rest_posy) < 200)) {
    springE.pressed();
  }
  else springE.released();

  if ((springF.overEvent() == true) && (dist(springF.xpos, springF.ypos, springF.rest_posx, springF.rest_posy) < 200)) {
    springF.pressed();
  }
  else springF.released();

  if ((springG.overEvent() == true) && (dist(springG.xpos, springG.ypos, springG.rest_posx, springG.rest_posy) < 200)) {
    springG.pressed();
  }
  else springG.released();

  if ((springH.overEvent() == true) && (dist(springH.xpos, springH.ypos, springH.rest_posx, springH.rest_posy) < 200)) {
    springH.pressed();
  }
  else springH.released();

  strokeCap(SQUARE);
  strokeWeight(10);

  makeDemLegs(0, 115, noiseA, 4);
  makeDemLegs(0, -115, noiseH, 1);
  makeDemLegs(90, 90, noiseB, 3);
  makeDemLegs(-90, 90, noiseC, 4);
  makeDemLegs(115, 0, noiseD, 1);
  makeDemLegs(-115, 0, noiseE, 2);
  makeDemLegs(-90, -90, noiseG, 2);
  makeDemLegs(90, -90, noiseF, 1);

  float naX = map(noiseA, 0, 1, 175, 200);
  float naY = map(noiseB, 0, 1, 175, 200);
  line(width/2, height/2, naX, naY);
  line(naX, naY, springA.tempxpos, springA.tempypos);

  float nbX = map(noiseB, 0, 1, 150, 200);
  float nbY = map(noiseC, 0, 1, 200, 250);
  line(width/2, height/2, nbX, nbY);
  line(nbX, nbY, springB.tempxpos, springB.tempypos);

  float ncX = map(noiseC, 0, 1, 150, 200);
  float ncY = map(noiseD, 0, 1, 250, 300);
  line(width/2, height/2, ncX, ncY);
  line(ncX, ncY, springC.tempxpos, springC.tempypos);

  float ndX = map(noiseD, 0, 1, 175, 200);
  float ndY = map(noiseE, 0, 1, 325, 350);
  line(width/2, height/2, ndX, ndY);
  line(ndX, ndY, springD.tempxpos, springD.tempypos);

  float neX = map(noiseE, 0, 1, 400, 425);
  float neY = map(noiseF, 0, 1, 175, 200);
  line(width/2, height/2, neX, neY);
  line(neX, neY, springE.tempxpos, springE.tempypos);

  float nfX = map(noiseF, 0, 1, 400, 450);
  float nfY = map(noiseG, 0, 1, 200, 250);
  line(width/2, height/2, nfX, nfY);
  line(nfX, nfY, springF.tempxpos, springF.tempypos);

  float ngX = map(noiseG, 0, 1, 400, 450);
  float ngY = map(noiseH, 0, 1, 250, 300);
  line(width/2, height/2, ngX, ngY);
  line(ngX, ngY, springG.tempxpos, springG.tempypos);

  float nhX = map(noiseH, 0, 1, 400, 425);
  float nhY = map(noiseA, 0, 1, 325, 350);
  line(width/2, height/2, nhX, nhY);
  line(nhX, nhY, springH.tempxpos, springH.tempypos);
}


void makeDemLegs(float dX, float dY, float noisy, int hand) {
  float noiseAngle = map(noisy, 0, 1, -30, 30);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(noiseAngle));
  line(0, 0, dX, dY);
  translate(dX, dY);
  rotate(radians(noiseAngle*3));
  line(0, 0, dX, dY);
  if (hand == 1) image(hand1, dX, dY);
  if (hand == 2) image(hand2, dX, dY);
  if (hand == 3) image(hand3, dX, dY);
  if (hand == 4) image(hand4, dX, dY);
  popMatrix();
}


//////////////////////////////////////////////////////////////////////////////////////
//modified version of springs example

class Spring { 
  // Screen values 
  float xpos, ypos;
  float tempxpos, tempypos; 
  int size = 20; 
  boolean over = false; 
  boolean move = false; 

  // Spring simulation constants 
  float mass;       // Mass 
  float k = 0.2;    // Spring constant 
  float damp;       // Damping 
  float rest_posx;  // Rest position X 
  float rest_posy;  // Rest position Y 

  float velx = 0.0;   // X Velocity 
  float vely = 0.0;   // Y Velocity 
  float accel = 0;    // Acceleration 
  float force = 0;    // Force 

  // Constructor
  Spring(float x, float y, int s, float d, float m, float k_in) { 
    xpos = tempxpos = x; 
    ypos = tempypos = y;
    rest_posx = x;
    rest_posy = y;
    size = s;
    damp = d; 
    mass = m; 
    k = k_in;
  } 

  void update() { 
    if (move) { 
      if (mouseY > height/2) {
        rest_posy = mouseY-50; 
        rest_posx = mouseX;
      }
      else {
        rest_posy = mouseY+50; 
        rest_posx = mouseX;
      }
    } 

    force = -k * (tempypos - rest_posy);  // f=-ky 
    accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
    vely = damp * (vely + accel);         // Set the velocity 
    tempypos = tempypos + vely;           // Updated position 

    force = -k * (tempxpos - rest_posx);  // f=-ky 
    accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
    velx = damp * (velx + accel);         // Set the velocity 
    tempxpos = tempxpos + velx;           // Updated position 


    if (overEvent() || move) { 
      over = true;
    } 
    else { 
      over = false;
    }
  } 

  // Test to see if mouse is over this spring
  boolean overEvent() {
    float disX = tempxpos - mouseX;
    float disY = tempypos - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < size/2 ) {
      return true;
    } 
    else {
      return false;
    }
  }

  void display(int hand) { 
    imageMode(CENTER);
    if (hand == 1) image(hand1, tempxpos, tempypos);
    if (hand == 2) image(hand2, tempxpos, tempypos);
    if (hand == 3) image(hand3, tempxpos, tempypos);
    if (hand == 4) image(hand4, tempxpos, tempypos);
  } 

  void pressed() { 
    if (over) { 
      move = true;
    } 
    else { 
      move = false;
    }
  } 

  void released() { 
    move = false; 
    rest_posx = xpos;
    rest_posy = ypos;
  }
}
