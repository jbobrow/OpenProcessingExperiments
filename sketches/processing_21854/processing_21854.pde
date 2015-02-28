
class Branch
{
  float age;
  float maxAge = 100;
  int birth;
  PVector pos, dir;
  float opacity;
  float speed = 0.00;
  float angle;
  float d;
  float ss;
  float weight;

  Branch (PVector initPos, PVector initDir) {
    birth = frameCount;
    pos = new PVector();
    pos.x = initPos.x;
    pos.y = initPos.y;
    dir = new PVector();
    dir = initDir.get();
    dir.set(dir.x-pos.x,dir.y-pos.y,0);   
    pos.set(initDir.x,initDir.y,0); 
    dir.normalize();
    PVector up = new PVector(0,-1,0);
    PVector side = new PVector(1,0,0);
    d = dir.dot(side);
    //angle = PVector.angleBetween(dir,up);
    angle = atan2(dir.y,dir.x);
    angle += PI/2;
    ss = random(0.5,1.0);
    weight = random(1,20);
    opacity = random(1,1);
  }

  boolean isDead () {
    age = frameCount - birth;
    if (age > maxAge) return true;
    return false;
  }

  void display (PGraphics pgx) {
    PGraphics pg = (PGraphics) pgx;
    isDead();
    //opacity = 1 - age/(maxAge * .5);
//    pos.x += dir.x * speed;
//    pos.y += dir.y * speed;
    pg.stroke(255,255*opacity);

    pg.noFill();
    float cx,cy;
    cx = 0;
    cy = 0;
    float r = 10;
    float l;
    pg.pushMatrix();
    pg.translate(pos.x,pos.y);
    pg.rotate(angle);
    pg.rotate(radians(-90));
    pg.scale(ss);
    pg.strokeWeight(weight);
    pg.beginShape();        
    for (float i = 0; i < age * .1; i += .1) {     
      if (r < .5) break;      
      l = noise(ss+ i*10);
      //if (l > .5 && i > age *.05) ellipse(cx+2,cy+2,weight*2,weight*2); 
      pg.curveVertex(cx,cy);
      cx +=  (r * cos(i));
      cy +=  (r * sin(i));
      r *= .96;
    }
    pg.endShape();
    pg.scale(1,-1);
    cx = 0;
    cy = 0;
    r = 10;
    pg.beginShape();    
    for (float i = 0; i < age * .1; i += .1) {
      if (r < .5) break;
      l = noise(ss+ i*10);
      //if (l > .5 && i > age * .05) ellipse(cx+2,cy+2,weight*2,weight*2);       
      pg.curveVertex(cx,cy);
      cx +=  (r * cos(i));
      cy +=  (r * sin(i));
      r *= .96;
    }
    pg.endShape();
    pg.popMatrix();
  }
}


