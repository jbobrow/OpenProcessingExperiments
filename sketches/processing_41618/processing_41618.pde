
class Balloon
{
  float xPos;
  float yPos;
  float xIncr, yIncr, xDcr, yDcr;
  float r;
  float g;
  float b;
  float turn;
  float rotation;
  float incrementX, incrementY, incrementXX, incrementYY;
  float dr, dg, db;



  Balloon(float x, float y, float rd, float grn, float blu, float dx, float dy, float dxx, float dyy,float rot, float TURN)
  {
    xPos = x;
    yPos = y;
    r = rd;
    g = grn;
    b = blu;
    incrementX =  dx;
    incrementY = dy;
    incrementXX = dxx;
    incrementYY = dyy;
    rotation = rot;
    turn = TURN;
      strokeWeight(25);
  }

  void update()
  {  
    noStroke();
    fill(getRed(), getGreen(), getBlue());
    pushMatrix();
    translate(xPos,yPos);
    rotate(rotation);
    ellipse(0, 0,55,55);
    triangle(26,10,-26,10,0,50*turn);
    triangle(0,50*turn,-5,60*turn,5,60*turn);
    popMatrix();

    xIncr = xIncr + incrementX;
    yIncr = yIncr + incrementY;
    xDcr = xDcr + incrementXX;
    yDcr = yDcr + incrementYY;
    
    rotation +=  (noise(xIncr)-noise(yDcr))*.02;
    
    turn += (noise(xIncr)-noise(yDcr))*.04;
    
    turn = constrain(turn,0,1);

    xPos +=  (noise(xIncr)-noise(yDcr))*4;
    yPos += (noise(yIncr)-noise(yDcr))*4;

    xPos = constrain(xPos, 0, width);
    yPos = constrain(yPos, 0, height);

    dr=dr+.029;
    dg=dg+.03;
    db=db+.028;

    r= constrain(r, 0, 255);
    g=constrain(g, 0, 255);
    b=constrain(b, 0, 255);
  }

  float getRed() {
    r+=noise(dr)-noise(dg);
    return r;
  }

  float getGreen() {
    g+=noise(dg)-noise(db);
    return g;
  }

  float getBlue() {
    b+=noise(db)-noise(dr);
    return b;
  }
}


