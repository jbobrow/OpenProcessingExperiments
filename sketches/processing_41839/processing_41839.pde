
class Particle {
  float xPart =0;
  float yPart =0;
  float partSpacing=10;
  float partSize=0;
  color col=0;
  float storeX=0;
  float storeY=0;
  float speedX=0;
  float speedY=0;
  float speedChange=20;
  int damageSpread=5;
  int count=(int)speedChange+100;
  int directionX=0;
  int directionY=0;
  boolean hit =false;
  float frame = 0;
  int afterDamage = 10;
  float r=20;
  float g=75;
  float b=95;
  int shimmer = 2;

  Particle(float xParti, float yParti, float partSizei) {

    partSize = partSizei;

    xPart = xParti;
    yPart = yParti;
    storeX=xPart;
    storeY=yPart;
  }

  void draw() {

    float t =0;

    if (r>50) {
      t=(random(-shimmer, 0));
    }
    else if (r<00) {
      t=(random(0, shimmer));
    }
    else {
      t=random(-shimmer, shimmer);
    }
    r=r+t;
    g=g+t;
    b=b+t;

    fill(r, g, b,200);
    stroke(255);
    strokeWeight(1);
    myThing(xPart, yPart, partSize, partSize);
  }

  void moves(float mouseX, float mouseY, float pmouseX, float pmouseY) {
    xPart +=mouseX -pmouseX;
    yPart +=mouseY -pmouseY;
  }

  boolean spring(float i, float j, float wNumber, float hNumber ) {
    if (count<speedChange)
    {
      xPart=xPart+speedX;
      yPart=yPart+speedY; 
      count++;
      if ((xPart>=storeX - 5 && xPart<=storeX+5)||(yPart>=storeY- 5 && yPart<=storeY+5)) {
        return true;
      } 
      else {
        return false;
      }
    } 
    else if (speedChange == count) {
   
      if (speedX < 0) {
        i=wNumber-i;
      }
      else if (speedY< 0) {
           
        j=hNumber-j;
      }
      float fractX=(float)((Math.pow(i, (5)))/(Math.pow(wNumber, damageSpread)));
      float fractY=(float)((Math.pow(j, (5)))/(Math.pow(hNumber, damageSpread)));
      if (Math.random()<0.5) {
        fractX*=-1;
      }
      if (Math.random()<0.5) {
        fractY*=-1;
      }
      if (Math.abs(speedX)<10 && Math.abs(speedY)<10) {
        speedX=0;
        speedY=0;
      } 
      else {
        speedX=(speedX/afterDamage)*fractX;
        speedY=(speedY/afterDamage)*fractY;
      }  
      count++;
    }
    else if (speedChange + afterDamage > count) {

      xPart=speedX+xPart;
      yPart=speedY+yPart;
      storeX=xPart;
      storeY=yPart;
      count++;
    }

    return false;
  }

  PVector speed() {
    count=0;
    speedX=(storeX-xPart)/speedChange;
    speedY=(storeY-yPart)/speedChange;

    PVector p = new PVector(speedX, speedY);
    return p;
  }

  void direction() {
    directionX=(int)Math.signum(speedX);
    directionY=(int)Math.signum(speedY);
  }

  void shake() {
  }
}


