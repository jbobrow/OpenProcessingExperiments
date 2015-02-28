
class BubbleLetter {
  RPoint[] points;
  ColorParticleSystem letterSystem;
  ColorParticle[] startParticles;
  Particle[] targetParticles;
  BubbleLetter oldBLetter;
  int freeParticlesTaken=0; 
  
  BubbleLetter(RShape _letter) {
    points = _letter.getPoints();
    targetParticles = new Particle[points.length];
    startParticles = new ColorParticle[points.length];
    oldBLetter=null;
    letterSystem = new ColorParticleSystem(GRAVITY, DRAG);       
  }
  BubbleLetter(RShape _letter, BubbleLetter _oldBLetter) {
    points = _letter.getPoints();
    targetParticles = new Particle[points.length];
    startParticles = new ColorParticle[points.length];
    oldBLetter=_oldBLetter;
    letterSystem = new ColorParticleSystem(GRAVITY, DRAG);       
  }  

  void drawLetter() {
    //letterSystem = new ParticleSystem(GRAVITY, DRAG);
    
    for (int i=0; i<points.length; i++) {
      targetParticles[i] = letterSystem.makeParticle(1.0, points[i].x, points[i].y,0);
      targetParticles[i].makeFixed();

      if (i>freeParticlesTaken-1) {
        if ((int)random(2)>0)
          startParticles[i] = letterSystem.makeParticle(1.0, map((int)random(2), 0, 1, -width/2-ELLIPSE_RAD, width/2+ELLIPSE_RAD), random(-height/2, height/2),0,
          ELLIPSE_COL[(int)random(ELLIPSE_COL.length)]);
        else
          startParticles[i] = letterSystem.makeParticle(1.0, random(-width/2, width/2), map((int)random(2), 0, 1, -height/2-ELLIPSE_RAD, height/2+ELLIPSE_RAD),0,
          ELLIPSE_COL[(int)random(ELLIPSE_COL.length)]);
      }

      letterSystem.makeSpring(startParticles[i], targetParticles[i], random(LOW_SPRING, HIGH_SPRING), random(1), 0);
    }
  }
  
  ColorParticle[] findExcessParticles() {
    if (oldBLetter!=null) {
      if(points.length<oldBLetter.points.length) {
        ColorParticle[] freeParticles = new ColorParticle[oldBLetter.points.length-points.length];      
        for (int i=0; i<oldBLetter.points.length-points.length; i++)
          freeParticles[i] = oldBLetter.startParticles[i+points.length];
        return freeParticles;
      }
    }
    return null;
  }
 
  boolean takeFreeParticles(ArrayList freeParticles) {
    //Particle[] freeParticles = (Particle[]) _freeParticles.toArray();
    if (oldBLetter!=null) {
      if(points.length>oldBLetter.points.length) {
        for (int i=0; i<points.length-oldBLetter.points.length; i++) {
          try {
            ColorParticle freeParticle = (ColorParticle) freeParticles.get(0);
            freeParticles.remove(0);
            startParticles[oldBLetter.points.length+i] = letterSystem.makeParticle(1.0, freeParticle.position().x(),
              freeParticle.position().y(),0, freeParticle.getOriginalColor());
            if (freeParticle.isShining())
              startParticles[oldBLetter.points.length+i].makeShine(map(random(1), 0, 1, ELLIPSE_RAD*1.5, ELLIPSE_RAD*2.5));   
          } catch (IndexOutOfBoundsException e) {
            return false; //gimme more particles!
          } 
          freeParticlesTaken++;
        }
        return true; //enough      
      }
    } else {
      for (int i=0; i<points.length; i++) {
        try {
          ColorParticle freeParticle = (ColorParticle) freeParticles.get(0);
          freeParticles.remove(0);
          startParticles[i] = letterSystem.makeParticle(1.0, freeParticle.position().x(),
            freeParticle.position().y(),0, freeParticle.getOriginalColor());
          if (freeParticle.isShining())
              startParticles[i].makeShine(map(random(1), 0, 1, ELLIPSE_RAD*1.5, ELLIPSE_RAD*2.5));    
        } catch (IndexOutOfBoundsException e) {
          return false; //gimme more particles!
        } 
        freeParticlesTaken++;
      }
      return true; //enough      
    }
    return true;
  }
  
  // morph current letter from previous letter
  void morph() {
    while(oldBLetter.letterSystem.numberOfSprings()>0)
      oldBLetter.letterSystem.removeSpring(0);
      
    for (int i=0; i<min(points.length, oldBLetter.points.length); i++) {
      targetParticles[i] = letterSystem.makeParticle(1.0, points[i].x, points[i].y,0);
      targetParticles[i].makeFixed();
      startParticles[i]= letterSystem.makeParticle(1.0, oldBLetter.startParticles[i].position().x(), 
        oldBLetter.startParticles[i].position().y(),0,oldBLetter.startParticles[i].getOriginalColor());
      if (oldBLetter.startParticles[i].isShining())
        startParticles[i].makeShine(map(random(1), 0, 1, ELLIPSE_RAD*1.5, ELLIPSE_RAD*2.5));   
      letterSystem.makeSpring(startParticles[i], targetParticles[i], random(LOW_SPRING, HIGH_SPRING), random(1), 0);
    }
    if(points.length>=oldBLetter.points.length) {
        for (int i=oldBLetter.points.length; i<points.length; i++) {
          targetParticles[i] = letterSystem.makeParticle(1.0, points[i].x, points[i].y,0);
          targetParticles[i].makeFixed();
 
          if (i>oldBLetter.points.length+freeParticlesTaken-1) {
            startParticles[i] = letterSystem.makeParticle(1.0, random(-width/2, width/2), map((int)random(2), 0, 1, -height/2-ELLIPSE_RAD, height/2+ELLIPSE_RAD),0, 
            ELLIPSE_COL[(int)random(ELLIPSE_COL.length)]);
          }
          letterSystem.makeSpring(startParticles[i], targetParticles[i], random(LOW_SPRING, HIGH_SPRING), random(1), 0);
        }
    }   
  }
  
  void update() {   
    letterSystem.tick();
  }
  
  void display() {
    for (int i=0; i<3; i++)
      startParticles[(int)random(startParticles.length)].makeShine(map(random(1), 0, 1, ELLIPSE_RAD*1.5, ELLIPSE_RAD*2.5));
      
    for (int i=0; i<startParticles.length; i++)
      startParticles[i].display();  
  }
}



