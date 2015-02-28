
/* -----------------------------------------------------------------------
  vluf x twitter :: vluf meshup with twitter. 2012/06/16/

  original sourcecode by Alexey Kolikov, http://www.openprocessing.org/sketch/7840/  
  modified by icq4ever@gmail.com
  Creative Commons License 3.0  BY-NC / GNU-GPL v2 http://www.gnu.org/licenses/gpl-2.0.html
  FileName : BubbleLetter.pde
----------------------------------------------------------------------- */

import twitter4j.*;

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


  // 파티클 사이즈에 프로필 이미지를 불러와 넣어준다.
  void drawLetter() {
    for (int i=0; i<points.length; i++) {
      targetParticles[i] = letterSystem.makeParticle(1.0, points[i].x, points[i].y, 0);
      targetParticles[i].makeFixed();

      if (i>freeParticlesTaken-1) {
        if ((int)random(2)>0)
          startParticles[i] = letterSystem.makeParticle(1.0, map((int)random(2), 0, 1, -width/2-ELLIPSE_RAD, width/2+ELLIPSE_RAD), random(-height/2, height/2), 0, 
          profileImage.get(i%profileImage.size()));
        else
          startParticles[i] = letterSystem.makeParticle(1.0, random(-width/2, width/2), map((int)random(2), 0, 1, -height/2-ELLIPSE_RAD, height/2+ELLIPSE_RAD), 0, 
          profileImage.get(i%profileImage.size()));
      }

      letterSystem.makeSpring(startParticles[i], targetParticles[i], random(LOW_SPRING, HIGH_SPRING), random(1), 0);
    }
  }

  ColorParticle[] findExcessParticles() {
    if (oldBLetter!=null) {
      if (points.length<oldBLetter.points.length) {
        ColorParticle[] freeParticles = new ColorParticle[oldBLetter.points.length-points.length];      
        for (int i=0; i<oldBLetter.points.length-points.length; i++)
          freeParticles[i] = oldBLetter.startParticles[i+points.length];
        return freeParticles;
      }
    }
    return null;
  }

  // 여분 파티클이 있는지 체크
  boolean takeFreeParticles(ArrayList freeParticles) {
    if (oldBLetter!=null) {
      if (points.length>oldBLetter.points.length) {
        for (int i=0; i<points.length-oldBLetter.points.length; i++) {
          try {
            ColorParticle freeParticle = (ColorParticle) freeParticles.get(0);
            freeParticles.remove(0);
            startParticles[oldBLetter.points.length+i] = letterSystem.makeParticle(1.0, freeParticle.position().x(), freeParticle.position().y(), 0, profileImage.get(i%profileImage.size()));
          } 
          catch (IndexOutOfBoundsException e) {
            return false; //gimme more particles!
          } 
          freeParticlesTaken++;
        }
        return true; //enough
      }
    } 
    else {
      for (int i=0; i<points.length; i++) {
        try {
          ColorParticle freeParticle = (ColorParticle) freeParticles.get(0);
          freeParticles.remove(0);
          startParticles[i] = letterSystem.makeParticle(1.0, freeParticle.position().x(), freeParticle.position().y(), 0, profileImage.get(i%profileImage.size()));
        } 
        catch (IndexOutOfBoundsException e) {
          return false; //gimme more particles!
        } 
        freeParticlesTaken++;
      }
      return true; //enough
    }
    return true;
  }

  // 이전 도형에서 현재의 도형으로 전환하는 애니메이션 구현부분
  void morph() {
    while (oldBLetter.letterSystem.numberOfSprings ()>0)
      oldBLetter.letterSystem.removeSpring(0);

    for (int i=0; i<min(points.length, oldBLetter.points.length); i++) {
      targetParticles[i] = letterSystem.makeParticle(1.0, points[i].x, points[i].y, 0);
      targetParticles[i].makeFixed();
      startParticles[i]= letterSystem.makeParticle(1.0, oldBLetter.startParticles[i].position().x(), 
      oldBLetter.startParticles[i].position().y(), 0, profileImage.get(i%profileImage.size()));
      letterSystem.makeSpring(startParticles[i], targetParticles[i], random(LOW_SPRING, HIGH_SPRING), random(1), 0);
    }
    if (points.length>=oldBLetter.points.length) {
      for (int i=oldBLetter.points.length; i<points.length; i++) {
        targetParticles[i] = letterSystem.makeParticle(1.0, points[i].x, points[i].y, 0);
        targetParticles[i].makeFixed();

        if (i>oldBLetter.points.length+freeParticlesTaken-1) {
          startParticles[i] = letterSystem.makeParticle(1.0, random(-width/2, width/2), map((int)random(2), 0, 1, -height/2-ELLIPSE_RAD, height/2+ELLIPSE_RAD), 0, 
          profileImage.get(i%profileImage.size()));
        }
        letterSystem.makeSpring(startParticles[i], targetParticles[i], random(LOW_SPRING, HIGH_SPRING), random(1), 0);
      }
    }
  }

  void update() { 
    letterSystem.tick();
  }

  void display() {
    for (int i=0; i<startParticles.length; i++)
      startParticles[i].display();
  }
}


