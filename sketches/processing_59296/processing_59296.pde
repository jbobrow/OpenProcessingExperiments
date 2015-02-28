
/* Basket class is for collecting cranes. If it collects one crane, score will add 10.
 Also, it can reset the game. So when the game restart, score is 0, and every objects are at their original positions. */

class Basket extends MovingObject {
  PImage basket; // declare a PImage, will be used in the object's draw method 
  int score; // score of cranes the player have collected, will be updated as collecting more cranes.
  PVector finalPos; // PVector for the x and y coordinates of Basket object's final position, will be used in the giveGift method

  Basket() { // constructor (initialize values of Basket object's variables)
    super();
    basket = loadImage("basket.png");
    score = 0;
    finalPos = new PVector (350, 310);
    w = 70;
    h = 87;
  }

  // draw the basket
  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    noTint();
    image(basket, -w/2, -h/2, w, h);
    popMatrix();
  }

  // to match the position with UserCrane object so that Basket and UserCrane will move together
  void matchPosition() {
    pos.x = userCrane.pos.x;
    pos.y = userCrane.pos.y + userCrane.lineLength + h/2;
    vel.x = userCrane.vel.x;
    vel.y = userCrane.vel.y;
    pos.add(vel);
  }

  boolean offscreenDetection(MovingObject other) { // boolean method with MovingObject as parameter, to detect if the object is offscreen or not
    if (other.pos.x == -100 && other.pos.y == -100) {
      return true;
    }
    else {
      return false;
    }
  }

  // to get score when Basket hits Cranes and update the score
  void getScore() {
    for (int i = 0; i < numCrane01; i++) {
      Crane01 crane01 = crane01List.get(i);
      if (offscreenDetection(crane01)) { // crane01 offscreen detection
        score += 2; // update score
      }
    }
    for (int i = 0; i < numCrane02; i++) {
      Crane02 crane02 = crane02List.get(i);
      if (offscreenDetection(crane02)) { // crane02 offscreen detection
        score += 2; // update score
      }
    }
    for (int i = 0; i < numCrane03; i++) {
      Crane03 crane03 = crane03List.get(i);
      if (offscreenDetection(crane03)) { // crane03 offscreen detection
        score += 2; // update score
      }
    }
    for (int i = 0; i < numCrane04; i++) {
      Crane04 crane04 = crane04List.get(i);
      if (offscreenDetection(crane04)) { // crane04 offscreen detection
        score += 2; // update score
      }
    }
    for (int i = 0; i < numCrane05; i++) {
      Crane05 crane05 = crane05List.get(i);
      if (offscreenDetection(crane05)) { // crane05 offscreen detection
        score += 2; // update score
      }
    }
    for (int i = 0; i < numCrane06; i++) {
      Crane06 crane06 = crane06List.get(i);
      if (offscreenDetection(crane06)) { // crane06 offscreen detection
        score += 2; // update score
      }
    }
    for (int i = 0; i < numColorCrane1; i++) {
      ColorCrane1 colorCrane1 = colorCrane1List.get(i);
      if (offscreenDetection(colorCrane1)) { // crane06 offscreen detection
        score += 10; // update score
      }
    }
    textFont (titleFont);
    fill(32, 55, 68);
    textSize(28);
    text("Score: " + score, 8, 26); // display updated score

    if (score >= 1000) {
      gameState = 2;
    }
  }

  // to place the basket on its final position on endScreen
  void giveGift() {
    vel.x += (finalPos.x - pos.x)/width;
    vel.y += (finalPos.y - pos.y)/height;
    vel.x *= 0.98; //damping factor
    vel.y *= 0.98; //damping factor
    pos.add(vel);
  }
}


