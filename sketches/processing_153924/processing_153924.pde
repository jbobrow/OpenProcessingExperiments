
class Hana {
  float posX;
  float posY;
  float radiusCore;
  float radiusPetalsX;
  float radiusPetalsY;
  float margin;
  int nPetals;
  float pulse;
  float angle;
  int colorRCore;
  int colorGCore;
  int colorBCore;
  int coreAlpha;
  int colorRPetals;
  int colorGPetals;
  int colorBPetals;
  int petalsAlpha;
  boolean bloomed;
  int whenToBloom;
  int bloomCountDown;
  float pulseInterval;
  float pulseRadius;
  float petalGrowthPos;
  float petalGrowthLength;
  float petalGrowthPosInterval;
  float petalGrowthLengthInterval;
  int whenToFade;
  int fadeCountDown;
  boolean isFading;
  boolean faded;
  
  Hana() {
    print("[Hana.Hana()]\n");
    bloomed = false;
    posX = 0;
    posY = 0;
    nPetals = int(random(5, 25));
    pulse = random(map(nPetals, 5, 25, -5, -3), map(nPetals, 5, 25, 5, 3));
    pulseInterval = 0.5;
    angle = random(0, 360);
    radiusCore = random(10, 30);
    pulseRadius = radiusCore;
    margin = random(-5, 10);
    radiusPetalsY = random(1, 3) * random(radiusCore - 5, radiusCore + 5);
    radiusPetalsX = radiusPetalsY / random(2, 5);
    petalGrowthPos = 0;
    petalGrowthLength = 0;
    petalGrowthLengthInterval = random(0.5, 1);
    petalGrowthPosInterval = random(0.1, 0.5);
    colorRCore = int(random(50, 255));
    colorRPetals = int(random(colorRCore - 10, colorRCore + 10));
    colorGCore = int(random(75));
    colorGPetals = int(random(colorGCore - 10, colorGCore + 10));
    colorBCore = int(random(0, 225));
    colorBPetals = int(random(colorBCore - 10, colorBCore + 10));
    coreAlpha = 225;
    petalsAlpha = 0;
    whenToBloom = int(random(500, 800));
    bloomCountDown = 0;
    fadeCountDown = 0;
    whenToFade = int(random(500, 800));
    faded = false;
    isFading = false;
  }
  
  void create(float posX, float posY) {
    print("[Hana.create(): posX = ", posX, ", posY = ", posY, "\n");
    this.posX = posX;
    this.posY = posY;
  }
  
  void display(int frame) {
    if(!bloomed && bloomCountDown++ == whenToBloom) {
      bloomed = true;
      petalsAlpha = int(random(coreAlpha - 100, coreAlpha - 50));
    } else if (isFading) {
      if (fadeCountDown == whenToFade) {
        faded = true;
        if (coreAlpha > 0) {
          coreAlpha -= sqrt(pulse * pulse);
          faded = false;
        }
        if (petalsAlpha > 0) {
          petalsAlpha -= sqrt(pulse * pulse);
          faded = false;
        }
        petalGrowthPos += sqrt(pulse * pulse);
      } else {
        fadeCountDown++;
      }
    } else {
      float radiusHalo = map(bloomCountDown, 0, whenToBloom, 2 * radiusCore, radiusCore);
      if (pulseRadius >= radiusHalo) {
        pulseRadius = radiusCore;
      } 
      fill(colorRCore, colorGCore, colorBCore, coreAlpha - 185);
      ellipse(posX, posY, radiusHalo, radiusHalo);
      noFill();
      for (int i = 0; i < 5; i++) {
        stroke(colorRCore, colorGCore, colorBCore, 80 - i * 25);
        ellipse(posX, posY, pulseRadius - i, pulseRadius - i);
      }
      noStroke();
      pulseRadius += pulseInterval;
    }
    fill(colorRCore, colorGCore, colorBCore, coreAlpha);
    ellipse(posX, posY, radiusCore, radiusCore);
    fill(colorRPetals, colorGPetals, colorBPetals, map(petalGrowthLength, 0, radiusPetalsY, 0, petalsAlpha));
    ellipseMode(CENTER);
    for (int i = 0; i < nPetals; i++) {
      pushMatrix();
      translate(posX, posY);
      rotate(radians(i * (360 / float(nPetals)) + angle));
      //print(petalGrowthPos, "\n");
      ellipse(0, petalGrowthPos, map(petalGrowthLength, 0, radiusPetalsY, 0, radiusPetalsX), petalGrowthLength);
      popMatrix();
    }
    angle += pulse;
    if (!isFading && bloomed) {
      isFading = true;
      if (petalGrowthPos < margin + radiusPetalsY / 2) {
        petalGrowthPos += petalGrowthPosInterval;
        isFading  = false;
      }
      if (petalGrowthLength < radiusPetalsY) {
        petalGrowthLength += petalGrowthLengthInterval;
        isFading = false;
      }
    }
    
  }
  
}


Hana[] flowers;
int currentFlower;

void setup() {
  print("setup.\n");
  size(800, 600);
  noStroke();
  flowers = new Hana[1];
  flowers[0] = new Hana();
  currentFlower = 0;
}

void mousePressed() {
  print("currentFlower = ", currentFlower, "\n");
  print("flowers.length = ", flowers.length, "\n");
  if (flowers.length == currentFlower) {
    Hana[] newFlowers = new Hana[2 * flowers.length];
    for (int i = 0; i < flowers.length; i++) {
      newFlowers[i] = flowers[i];
    }
    for (int i = flowers.length; i < 2 * flowers.length; i++) {
      newFlowers[i] = new Hana();
    }
    flowers = newFlowers;
  }
  
  flowers[currentFlower++].create(pmouseX, pmouseY);
}
  
void draw() {

  background(0);
  for(int i = 0; i < currentFlower; i++) {
    if (!flowers[i].faded) {
      flowers[i].display(frameCount);
    }
  }
}
