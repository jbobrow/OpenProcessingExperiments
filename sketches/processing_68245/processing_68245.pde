
class Asteroid {
  private float posX;
  private float posY;
  private float theSize;
  private float xSpeed;
  private color c;
  private float rotation;
  private float currentRotation;

  Asteroid() {
    posX = random(500+75, 500+1700+(25*wave));
    posY = random(height);
    theSize = random(10, 23);
    xSpeed = -1*(35+3*wave)/theSize;
    c = color (225, 100, 35);
    rotation = random(-.06, .06);
    currentRotation = rotation;
  }

  Asteroid(float rotation) {
    posX = width/2;
    posY = height/2;
    theSize = 100;
    xSpeed = 0;
    c = color (225, 100, 35);
    this.rotation =.005;
    currentRotation = rotation;
  }

  void movement() {
    if (posY+theSize>0 && posY-theSize<height) {
      if (posX+theSize>0)
        posX+= xSpeed;
      else
        alakazam();
    }
  }

  void display() {
    if (posX+theSize>0 && posX < width+theSize) {
      fill(c, 50);
      stroke(c);
      strokeWeight(1);
      pushMatrix();
      translate(posX, posY);
      rotate(currentRotation);
      drawAsteroid();
      popMatrix();
      currentRotation+=rotation;
    }
  }

  void inside() {
    if (posX+theSize>main.x()-5 && posX-theSize<main.x()+5) {
      if (posY+theSize>main.y()-17 && posY-theSize<main.y()+17) {
        main.subtractLife();
        Explosions temp = new Explosions(posX, posY, 
        c, main.getColor(), -1);
        boom = (Explosions[])append(boom, temp);

        Explosions temp2 = new Explosions(main.x()-5, main.y(), 
        main.getColor(), c, 0);
        boom = (Explosions[])append(boom, temp2);
        alakazam();
      }
    }
    else {
      if (posX+theSize>main.x()+5 && posX-theSize<main.x()+12) {
        if (posY+theSize>main.y()-5 && posY-theSize<main.y()+5) {
          main.subtractLife();
          Explosions temp = new Explosions(posX, posY, 
          c, main.getColor(), -1);
          boom = (Explosions[])append(boom, temp);

          Explosions temp2 = new Explosions(main.x()-5, main.y(), 
          main.getColor(), c, 0);
          boom = (Explosions[])append(boom, temp2);
          alakazam();
        }
      }
    }
  }


  private void alakazam() {
    posX = -1000;
    posY = -1000;
    asteroidCount++;
  }


  void inside(Bullet shot) {
    if (shot.x()+2>posX-theSize && shot.x()-5<posX+theSize) {
      if (shot.y()+2>posY-theSize && shot.y()-2<posY+theSize) {
        shot.noMansLand(true, false);
        posX+=10;
        Explosions temp = new Explosions(posX, posY, shot.getColor(), c, 1);
        boom = (Explosions[])append(boom, temp);

        theSize-=2.5;
        if (theSize<5) {
          Explosions temp2 = new Explosions(posX, posY, shot.getColor(), c, -1);
          boom = (Explosions[])append(boom, temp2);
          alakazam();
          if (main.lives()>0)
            score+=1;
          asteroidsTakenOut++;
        }
      }
    }
  }

  private void drawAsteroid() {
    beginShape();
    //1(++)
    vertex(theSize, 0);
    vertex((.8)*theSize, (.7)*theSize);
    vertex((.5)*theSize, theSize);
    //2(-+)
    vertex(0, theSize);
    vertex((-.5)*theSize, (.75)*theSize);
    vertex((-1)*theSize, (.5)*theSize);
    //3(--)
    vertex((-1)*theSize, 0);
    vertex((-.83)*theSize, (-.25)*theSize);
    vertex((-1)*theSize, (-.5)*theSize);
    vertex((-1)*theSize, (-.5)*theSize);
    vertex((-1)*theSize/2, (-.7)*theSize);
    //4(+-)
    vertex(0, (-1)*theSize);
    vertex((.5)*theSize, (-1)*theSize);
    vertex((.75)*theSize, (-.75)*theSize);
    vertex(theSize, 0);

    endShape();
  }
}


