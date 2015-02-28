

class Alien {
  float shipAngle;
  float shipDist = 350;
  float moveDur = 0;
  float movePause = 0;
  float moveSpeed = 2;
  float moveDirection = 0;
  float randVal = 0;
  int xLoc;
  int yLoc;
  boolean alienAlive;
  boolean explode;
  int explodeDur = 60;
  int explodeCount;
  ArrayList missiles = new ArrayList();
  //AlienBlast[] alienBlast = new AlienBlast[0];

  float xCorrect;
  float yCorrect;


  Alien() {
    explode = false;
    explodeCount = 0;

    alienAlive = true;
  }

  void moveAlien() {

    if (explode == false) {
      if (moveDur > 0) {
        if (moveDirection > 4) {
          if (shipAngle + moveSpeed > 360) {
            shipAngle -= 360;
          }
          shipAngle += moveSpeed;
        }
        else {
          if (shipAngle - moveSpeed < 0) {
            shipAngle += 360;
          }
          shipAngle -= moveSpeed;
        }
        moveDur--;
      }
      else if (movePause > 0) {
        movePause--;
      }
      else {

        moveDur = random(30, 100);
        moveDirection = random(0, 9);
        movePause = random(30);
      }
    }
  }

  void display() {


    xCorrect = 350 * cos(radians(shipAngle - 90));
    yCorrect = 350 * sin(radians(shipAngle - 90));

    if (explode == false) {
      
      noStroke();
      
      pushMatrix();
      translate(xCorrect + width / 2, yCorrect + height / 2);

      rotate(radians(shipAngle + 180));

      fill(255, 0, 0);
      beginShape();
      vertex(0, -25);
      vertex(5, -20);
      vertex(5, -10);
      vertex(20, 5);
      vertex(5, 20);
      vertex(5, 25);
      vertex(-5, 25);
      vertex(-5, 20);
      vertex(-20, 5);
      vertex(-5, -10);
      vertex(-5, -20);
      vertex(0, -25);
      endShape();  

      fill(153, 153, 153);
      beginShape();
      vertex(13, -15);
      vertex(23, -5);
      vertex(23, 15);
      vertex(13, 25);
      vertex(13, -15);
      endShape();  

      beginShape();
      vertex(-13, -15);
      vertex(-23, -5);
      vertex(-23, 15);
      vertex(-13, 25);
      vertex(-13, -15);
      endShape();  

      fill(0, 113, 188);
      triangle(0, -22.5, 3.75, -18.75, -3.57, -18.75);

      popMatrix();

      // rect((xCorrect - 25 + width / 2), (yCorrect - 25) + height / 2, 50, 50);
    }
    else {

      if (explodeCount < explodeDur) {
        pushMatrix();
        translate(xCorrect + width / 2, yCorrect + height / 2);

        rotate(radians(shipAngle - 90));

        stroke(255, 190, 18);
        strokeWeight(4);

        line(-25, -25, 25, 25);
        line(-25, 25, 25, -25);
        line(-25, 0, 25, 0);
        line(0, -25, 0, 25);

        popMatrix();

        explodeCount++;
      }
      else {
        
        aliens.remove(0);
        gameStart = false;
      }
    }

    for (int i = 0; i <= missiles.size() - 1; i++) {
      Missile m = (Missile) missiles.get(i);
      m.blastMove(i);
      m.display();
      //alienBlast[i].blastMove();
      //alienBlast[i].display();
    }
  }

  float location() {
    return shipAngle;
  }

  void explode() {
    
    aliens.remove(0);
    explode = true;

    gameScore += 1000;
    
    for(int i = 0; i < gunBlast.size(); i++) {
     //Blast g = (Blast) gunBlast.get(i);
    gunBlast.remove(i);
          gameStart = false;
    }
    
  }


  void randomShoot() {
    float randTemp = random(49);
    //println(randTemp);
    if (randTemp <= 1) {

      Missile newMissile = new Missile(shipAngle);
      missiles.add(newMissile);
      //alienBlast = (AlienBlast[]) append(alienBlast, newBlast);
    }
  }
}


