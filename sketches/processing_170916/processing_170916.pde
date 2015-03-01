
/*
    Medusa, Denis Hovart, 2011
    License CC BY 2.0
    http://creativecommons.org/licenses/by/2.0/
*/
 
Creature[] c;
 
void setup() {
  size(600, 600);
  c = new Creature[0];
  for(int a=0;a<3;a++){
  new Creature( new PVector(int(random(width)), int(random(height)) / 2), 12, 12, 10, 50, 10, 3 );
  }
}
  
void draw() {
  background(0);
  for(int a=0;a<c.length;a++){
  c[a].update();
// c[a].draw();
  }
}
 
  
// From Robert Penner's easing equations
static class Penner {
  // time, beginning position, change in position, and duration
  static float easeInOutExpo(float t, float b, float c, float d) {
    if (t==0) return b;
    if (t==d) return b+c;
    if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1)) + b;
    return c/2 * (-pow(2, -10 * --t) + 2) + b;
  }
};
  
class TentaclePart {
  PVector position;
  float width;
  float height;
  color clr;
};
  
class Tentacle {
  
  PVector position;
  float orientation;
  float angularVelocity;
  int nbParts;
  float compactness;
  ArrayList<TentaclePart> parts;
  
  Tentacle(PVector pos, int nb, float w, float h, float o, float c) {
    position = pos;
    nbParts = nb;
    float headWidth = w;
    float headHeight = h;
    compactness = c;
    orientation = o;
    angularVelocity = 0;
    parts = new ArrayList<TentaclePart>();
    float coul = 255.0/nbParts;
    for (int i = 0; i < nbParts; i++) {
      TentaclePart part = new TentaclePart();
      part.width = (nbParts-i) * headWidth / (float)nbParts;
      part.height = (nbParts-i) * headHeight / (float)nbParts;
      part.position = position.get();
      part.position.x += compactness * i * cos( orientation );
      part.position.y += compactness * i * sin( orientation );
      part.clr = color(255, 255-coul*i);
      parts.add( part );
    }
  }
  
  void update() {
    PVector pos0 = parts.get(0).position;
    PVector pos1 = parts.get(1).position;
    pos0.set(position.get());
    pos1.x = pos0.x + ( compactness * cos( orientation ) );
    pos1.y = pos0.y + ( compactness * sin( orientation ) );
    for (int i = 2; i < nbParts; i++) {
      PVector currentPos = parts.get(i).position.get();
      PVector dist = PVector.sub( currentPos, parts.get(i-2).position.get() );
      float distmag = dist.mag();
      PVector pos = parts.get(i - 1).position.get();
      PVector move = PVector.mult(dist, compactness);
      move.div(distmag);
      pos.add(move);
      parts.get(i).position.set(pos);
    }
  }
  
  void draw() {
    for (int i = nbParts - 1; i >= 0; i--) {
      TentaclePart part = parts.get(i);
      noStroke();
     fill(part.clr);
      ellipse(part.position.x, part.position.y, part.width, part.height);
    }
  }
};
  
class Creature {
  
  PVector position;
  float radX, radY;
  float orientation;
  
  color headClr;
  
  ArrayList<Tentacle> tentacles;
  int nbTentacles;
  int tentaclesLength;
  
  int moveTime;
  int moveDuration;
  PVector dest;
  PVector lastPos;
  float moveDistance;
  boolean reachedDest;
  
  Creature(PVector pos, float rx, float ry, int nb, int l, float ts, float td) {
  
    position = pos;
    radX = rx;
    radY = ry;
    orientation = 0;
  
    nbTentacles = nb;
    tentaclesLength = l;
    tentacles = new ArrayList<Tentacle>();
  
    headClr = color(random(50,200), random(50,200), random(50,200));
  
    dest = new PVector(random(-1,1), random(-1,1));
    dest.mult(moveDistance);
    lastPos = position.get();
    moveDuration = int(random(50,90));
    moveDistance = random(300,400);
    reachedDest = true;
    moveTime = 0;
  
  
    for (int i = 0; i < nbTentacles; i++) {
      float tx = position.x + (cos(i * TWO_PI / nbTentacles) * radX/2);
      float ty = position.y + (sin(i * TWO_PI / nbTentacles) * radY/2);
      float tr = atan2(ty - position.y, tx - position.x);
      Tentacle tentacle = new Tentacle(new PVector(tx, ty), tentaclesLength, ts, ts, tr, td);
      tentacles.add(tentacle);
    }
    c = (Creature[]) append(c, this);
  }
  
  void update() {
    for (int i = 0; i < nbTentacles; i++) {
      Tentacle t = tentacles.get(i);
      t.position.x = position.x + (cos((i * TWO_PI / nbTentacles) + orientation) * radX/2);
      t.position.y = position.y + (sin((i * TWO_PI / nbTentacles) + orientation) * radY/2);
      t.orientation = atan2((t.position.y - position.y), (t.position.x - position.x));
      t.update();
    }
  
    if(reachedDest) {
      lastPos = position.get();
      dest = new PVector(random(-1,1), random(-1,1));
      dest.normalize();
      dest.mult(moveDistance);
  
      PVector nextPos = PVector.add(position, dest);
      if(nextPos.x > width)
        dest.x = -abs(dest.x);
      else if(nextPos.x < 0)
        dest.x = abs(dest.x);
      if(nextPos.y  > height)
        dest.y = -abs(dest.y);
      else if(nextPos.y < 0)
        dest.y = abs(dest.y);
      reachedDest = false;
      moveTime = 0;
    }
    else {
      position.x = Penner.easeInOutExpo(moveTime, lastPos.x, dest.x, moveDuration);
      position.y = Penner.easeInOutExpo(moveTime, lastPos.y, dest.y, moveDuration);
      moveTime++;
      if(moveTime >= moveDuration)
        reachedDest = true;
    }
    orientation += random(-3, 3) * radians(.1);
   
    fill(200/*headClr*/);
    for(int i = 0; i < nbTentacles; i++)
      tentacles.get(i).draw();
  
  }
};



