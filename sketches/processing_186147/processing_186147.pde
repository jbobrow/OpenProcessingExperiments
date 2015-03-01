
Sperm s1;
Sperm s2;
Sperm s3;
Sperm s4;
Egg egg;
boolean fertilize;
ArrayList<Particle> particles;
float numParticles;

int currX;
int currY;
int question = 1;
int circle = 0;
boolean check;


void setup() {
  size(600, 600);
  egg = new Egg();
  s1 = new Sperm(19, egg);
  s2 = new Sperm(23, egg);
  s3 = new Sperm(15, egg);
  s4 = new Sperm(34, egg);
  egg = new Egg(s1, s2, s3, s4);

  particles = new ArrayList<Particle>();
  numParticles = 10;
  for (int i = 0; i < numParticles; i++)
  {
    particles.add(new Particle(egg.centerX, egg.centerY));
  }
  textSize(10);
}

boolean isFertilized()
{
  ArrayList<Sperm> sperms = new ArrayList<Sperm>();
  sperms.add(s1);
  sperms.add(s2);
  sperms.add(s3);
  sperms.add(s4);

  for (int i = 0; i < sperms.size (); i++)
  {
    float spermX=sperms.get(i).base.center.particleX;
    float spermY=sperms.get(i).base.center.particleY;
    if (spermX > egg.centerX - 25 && spermX < egg.centerX + 25 && spermY > egg.centerY - 25 && spermY < egg.centerY + 25)
    {
      fertilize = true;
      return true;
    }
  }
  fertilize = false;
  return false;
}
void encircleUpdate(float alphaJump)
{
  egg.centerX = egg.centerX + alphaJump;
  egg.centerY = egg.centerY + alphaJump;
}

void draw() {
  background (0);

  if (!isFertilized() )
  {
    currX = mouseX;
    currY = mouseY;
    s1.update();
    s2.update();
    s3.update();
    s4.update();
    s1.render();
    s2.render();
    s3.render();
    s4.render();
    egg.update();
    egg.render();
  } else {
    egg.centerX = currX;
    egg.centerY = currY;

    egg.render();
    textSize(8);
    text( "P R E S S   L E F T   O R   R I G H T   T O   T R A V E R S E   T H E   Q U E S T I O N S", width/2 - 180, height - 30 );

  }
  askQuestions();
  for ( int i = 0; i < answers.length; i++ ) {
    if ( answers[i] == null ) {
      answers[i] = " ";
    } else {
      text( answers[i], 350, 340 + 20*i );
    }
  } 
  if ( check == true ) {
    background(0);
    ellipse( egg.centerX, egg.centerY, circle, circle );
    circle = grow( circle, 10000, 2 );
    frameRate(2400);
    fill(0);
    textAlign( CENTER, CENTER );
    text( "Y    O    U    R         C    H    I    L    D", width/2, height/2 );
  }
}

int grow( int s, int period, int delay ) {
  int time = millis() % period;
  if ( time < delay ) {
    s = 0;
  } else {
    s+= 1;
  }
  return s;
}

void keyPressed() {
  if ( key == CODED ) {
    if ( keyCode == SHIFT ) {
      egg.centerX = mouseX;
      egg.centerY = mouseY;
    } else if ( keyCode == RIGHT && question != 10) {
      question++;
    } else if ( keyCode == LEFT && question != 1 ) {
      question--;
    }
  }
}

class Blob
{
  ArrayList<Particle> particleList;
  ArrayList<Spring> springList;
  int nPoints;
  float radius;
  Particle center;
  Particle point1;
  Particle p;
  boolean attraction;

  Blob(int np, float r, boolean a)
  {
    particleList = new ArrayList<Particle>();
    springList = new ArrayList<Spring>();
    nPoints = np;
    radius = r;


    for (int i = 0; i < nPoints; i++) {
      float t = (float)i/nPoints * TWO_PI;
      float rx = width/2 + radius * cos(t);
      float ry = width/2 + radius * sin(t);
      particleList.add( new Particle(rx, ry));
    }

    springList = new ArrayList<Spring>();
    for (int i = 0; i < (nPoints/2); i++) {
      Particle p = particleList.get(i);
      Particle q = particleList.get(( i + 1 )%nPoints);
      Spring s0 = new Spring (p, q);
      springList.add (s0);
    }

    int connections[] = { 2, 3, 5, 7, 11 };
    for (int j = 1; j < connections.length; j++) {
      for (int i = 0; i < nPoints; i++) {
        Particle p = particleList.get(i);
        Particle q = particleList.get(( i + connections[j] ) % nPoints);
        Spring s0 = new Spring (p, q);
        springList.add(s0);
      }
    }

    p = new Particle(0, 0);
    p = particleList.get(0);
    float particleX = p.particleX;
    float particleY = p.particleY;
    center = new Particle( particleX - radius, particleY - radius );
  }

  void update(float mr)
  {
    float gravityForceX = 0;
    float gravityForceY = -0.1;
    float repulsion = mr;

    for (int i = 0; i < particleList.size(); i++) {
      particleList.get(i).boundary = false;
      particleList.get(i).update();
    }

    for (int i = 0; i < particleList.size(); i++) {
      float dx = particleList.get(i).particleX - mouseX;
      float dy = particleList.get(i).particleY - mouseY;
      float dh = sqrt(dx*dx + dy*dy);

      float componentInX = dx/dh;
      float componentInY = dy/dh;
      float proportionToDistanceSquared = 1.0/(dh);

      float repulsionForcex = repulsion * componentInX * proportionToDistanceSquared;
      float repulsionForcey = repulsion * componentInY * proportionToDistanceSquared;
      particleList.get(i).addForce(-repulsionForcex, -repulsionForcey);
    }

    for (int i = 0; i < springList.size (); i++) {
      springList.get(i).update();
    }

    center = new Particle(particleList.get(0).particleX - radius, particleList.get(0).particleY);
  }

  void render()
  {
    noStroke();
    fill(255, 100);

    float controlStartX = particleList.get(0).particleX;
    float controlStartY = particleList.get(0).particleY;
    float controlEndX = particleList.get(nPoints-1).particleX;
    float controlEndY = particleList.get(nPoints-1).particleY;
    beginShape();
    curveVertex(controlStartX, controlStartY);
    for (int i = 0; i < nPoints; i++) {
      float x = particleList.get(i).particleX;
      float y = particleList.get(i).particleY;
      curveVertex(x, y);
    }
    curveVertex(controlEndX, controlEndY);
    endShape();
  }

  Particle getFurthest(Egg e)
  {
    float dist = 0.0;
    float maxDist = 0.0;
    Particle far = new Particle(0.0, 0.0);
    for (int i = 0; i < particleList.size (); i++) {
      dist = sqrt(abs(particleList.get(i).particleX - e.centerX) + abs(particleList.get(i).particleY - e.centerY));
      if (dist >= maxDist) {
        maxDist = dist;
        far = particleList.get(i);
      }
    }
    return far;
  }
}

class Egg
{
  float centerX;
  float centerY;
  boolean fertilize;
  Sperm sperm1;
  Sperm sperm2;
  Sperm sperm3;
  Sperm sperm4;

  Egg()
  {
    centerX = mouseX;
    centerY = mouseY;
    fertilize = false;
    sperm1 = new Sperm(.6, this);
    sperm2 = new Sperm(.8, this);
    sperm3 = new Sperm(.9, this);
    sperm4 = new Sperm(.2, this);
  }

  Egg(Sperm a, Sperm b, Sperm c, Sperm d)
  {
    centerX = mouseX;
    centerY = mouseY;
    fertilize = false;
    sperm1 = a;
    sperm2 = b;
    sperm3 = c;
    sperm4 = d;
  }


  void update()
  {
    centerX = mouseX;
    centerY = mouseY;
  }


  void render()
  {
    float alpha = sin(millis()/250.0);
    alpha = map(alpha, -1, 1, 0, 200);
    float alphaJump = map(alpha, 50, 200, 0, 10);

    if (!isFertilized())
    {
      fill(255, alpha);
      noStroke();
      ellipse(centerX, centerY, 50, 50);
      ellipse(centerX, centerY, 47, 47);
      ellipse(centerX, centerY, 45, 45);
      ellipse(centerX, centerY, 43, 43);
      ellipse(centerX, centerY, 40, 40);
      ellipse(centerX, centerY, 37, 37);
      ellipse(centerX, centerY, 35, 35);
    } else {
      alpha = map(alpha, 0, 200, 50, 255);
      fill(255, alpha);
      float alphaBeat = sin(millis()/70.0);
      noStroke();
      ellipse(centerX, centerY, 50+alphaJump, 50+alphaJump);
      ellipse(centerX, centerY, 20+alphaBeat, 20+alphaBeat);
    }
  }
}

class Particle {
  float particleX;
  float particleY;
  float velocityX;
  float velocityY;
  float damping;
  float mass;
  boolean velocityLimit = true;
  boolean boundary = false;

  Particle (float x, float y) {
    particleX = x;
    particleY = y;
    velocityX = velocityY = 0;
    damping = 0.93;
    mass = 1.0;
  }

  void addForce (float fx, float fy) {
    float ax = fx / mass;
    float ay = fy / mass;
    velocityX += ax;
    velocityY += ay;
  }

  void update() {
    velocityX *= damping;
    velocityY *= damping;
    limitVelocities();
    handleBoundaries();
    particleX += velocityX;
    particleY += velocityY;
  }


  void limitVelocities() {
    if (velocityLimit) {
      float speed = sqrt(velocityX*velocityX + velocityY*velocityY);
      float maxSpeed = 6.0;
      if (speed > maxSpeed) {
        velocityX *= maxSpeed/speed;
        velocityY *= maxSpeed/speed;
      }
    }
  }

  void handleBoundaries() {
    if (boundary) {
      if (particleX > width ) 
        particleX -= width;
      if (particleX < 0     ) 
        particleX += width;
      if (particleY > height) 
        particleY -= height;
      if (particleY < 0     ) 
        particleY += height;
    } else {
      if (particleX+velocityX > width ) {
        velocityX = -velocityX;
        particleX = min(particleX, width);
      }
      if (particleX+velocityX < 0) {
        velocityX = -velocityX;
        particleX = max(particleX, 0);
      }
      if (particleY+velocityY > height) {
        velocityY = -velocityY;
        particleY = min(particleY, height);
      }
      if (particleY + velocityY < 0) {
        velocityY = -velocityY;
        particleY = max(particleY, 0);
      }
    }
  }

  void render() {
    ellipse(particleX, particleY, 7, 7);
  }
}

class Sperm
{
  Blob base;
  Blob northPole;
  Tail tail;
  float repulsion;
  Egg target;
  Particle tparticle;

  Sperm(float rep, Egg e)
  {
    target = e;
    repulsion = rep;
    base = new Blob(25, 10, true);
    tail = new Tail(base.point1, base, target, repulsion);
    tparticle = new Particle(0, 0);
  }

  void update()
  {
    float distanceToEgg = sqrt(abs((mouseX - base.center.particleX)) + abs((mouseY - base.center.particleY)));
    base.update(this.repulsion);
    Particle p1 = base.particleList.get(8);
    Particle p2 = base.particleList.get(20);
    Particle p3 = base.particleList.get(3);
    tail.update(tparticle, distanceToEgg, target);
    tparticle = base.getFurthest(target);
  }

  void render()
  {
    base.render();
    tail.render(target);
  }
}

class Spring {
  Particle p;
  Particle q;
  float rest;
  float retraction;
  
  Spring (Particle p1, Particle p2) {
    p = p1;
    q = p2;
  
    float dx = p.particleX - q.particleX;
    float dy = p.particleY - q.particleY;
    rest = sqrt(dx*dx + dy*dy);
    retraction = 0.1;
  }
  
  void update() {
    float dx = p.particleX - q.particleX;
    float dy = p.particleY - q.particleY;
    float dh = sqrt(dx*dx + dy*dy);
  
    if (dh > 1) {
      float distention = dh - rest;
      float restorativeForce = retraction * distention;
      float fx = (dx/dh) * restorativeForce;
      float fy = (dy/dh) * restorativeForce;
      p.addForce(-fx, -fy);
      q.addForce(fx, fy);
    }
  }
  
  void render() {
    stroke(255);
    line(p.particleX, p.particleY, q.particleX, q.particleY);
  }
}
class Tail
{
  Particle initial;
  Particle p1;
  Particle p2;
  Particle p3;
  Particle end;
  
  ArrayList<Particle> train;
  ArrayList<Spring> sprangs;
  
  float distanceX;
  float distanceY;
  
  Blob blob;
  Blob base;
  
  float repulsion;
   
  Tail(Particle o, Blob b, Egg e, float rep)
  {
    initial = new Particle(e.centerX, e.centerY);
    blob = b;
    base = new Blob(5, 4, true);
    repulsion = rep;
  }
   
  void update(Particle o, float divAmount, Egg e)
  {
    float eggX = e.centerX;
    float eggY = e.centerY;
     
    float sx = blob.center.particleX;
    float sy = blob.center.particleX;
     
    float disX = eggX - sx;
    float disY = eggY - sy;
     
    float posX = disX* -.6;
    float posY = disY* -.6;
   
    base.update(this.repulsion - 2);
  }
   
  void render(Egg egg)
  {
    noStroke();
    fill(255, 200);
    base.render();
    fill(255);    
  }
   
  void renderBreach(Egg egg)
  {
    float throb = sin(millis()/200.0);
    initial = new Particle(egg.centerX, egg.centerY - 60);
    p1 = new Particle(egg.centerX, egg.centerY - 60);
    p2 = new Particle(egg.centerX, egg.centerY - 60);
    p3 = new Particle(egg.centerX, egg.centerY - 60);
    end = new Particle(egg.centerX, egg.centerY - 60);
    fill(255, 0, 0);
    ellipse(egg.centerX, egg.centerY - 60, 4, 4);
  }
}

String[] answers = new String[11];

void askQuestions() {
  if ( isFertilized() ) {
    answers[0] = "Y O U R   C H I L D :";

    // QUESTION 1
    if ( question == 1 ) {
      text( "G E N D E R" + "\n" + "W H A T   G E N D E R   I S   Y O U R   C H I L D ?", 350, 140 );
      text( "B O Y" + "\n" + "G I R L", 370, 175 );
      if ( mouseX > 369 && mouseX < 461 && mouseY > 165 && mouseY < 176 && mousePressed == true ) { 
        answers[1] = "B O Y";
      } else if ( mouseX > 369 && mouseX < 461 && mouseY > 180 && mouseY < 191 && mousePressed == true ) { 
        answers[1] = "G I R L";
      }
    }

    // QUESTION 2  
    if ( question == 2 ) {
      text( "P H Y S I C A L    A T T R I B  U T E S   # 1" + "\n" + "H O W   T A L L   W I L L   Y O U R" + "\n" + "C H I L D   B E ?", 350, 140 );
      text( "3 F T   T O   4 F T" +  "\n" + "4 F T   T O   5 F T" + "\n" + "5 F T   T O   6 F T" + "\n" + "6 F T   A N D   A B O V E", 370, 190 );
      if ( mouseX > 369 && mouseX < 500 && mouseY > 180 && mouseY < 191 && mousePressed == true ) {
        answers[2] = "3 F T   T O   4 F T";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 200 && mouseY < 211 && mousePressed == true ) {
        answers[2] = "4 F T   T O   5 F T";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 210 && mouseY < 228 && mousePressed == true ) {
        answers[2] = "5 F T   T O   6 F T";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 229 && mouseY < 241 && mousePressed == true ) {
        answers[2] = "6 F T   A N D   A B O V E";
      }
    }

    // QUESTION 3  
    if ( question == 3 ) {
      text( "I D E N T I T Y" + "\n" + "W H A T   W I L L   Y O U R   C H I L D" + "\n" + "I D E N T I F Y   A S ?", 350, 140 );
      text( "A S E X U A L" +  "\n" + "B I S E X U A L" + "\n" + "H E T E R O S E X U A L" + "\n" + "H O M O S E X U A L", 370, 190 );
      if ( mouseX > 369 && mouseX < 500 && mouseY > 180 && mouseY < 191 && mousePressed == true ) {
        answers[3] = "A S E X U A L";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 200 && mouseY < 211 && mousePressed == true ) {
        answers[3] = "B I S E X U A L";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 210 && mouseY < 228 && mousePressed == true ) {
        answers[3] = "H E T E R O S E X U A L";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 229 && mouseY < 241 && mousePressed == true ) {
        answers[3] = "H O M O S E X U A L";
      }
    }

    // QUESTION 4
    if ( question == 4 ) {
      text( "T R A I T  #1" + "\n" + "W H A T   T R A I T S   W O U L D   Y O U" + "\n" + "G I V E   Y O U R   C H I L D ?" + "\n", 350, 140 );
      text( "A T H L E T I C" + "\n" + "A R T I S T I C" + "\n" + "G E N I U S" + "\n" + "I N S A N E", 370, 190 );
      if ( mouseX > 369 && mouseX < 500 && mouseY > 180 && mouseY < 191 && mousePressed == true ) {
        answers[4] = "A T H L E T I C";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 200 && mouseY < 211 && mousePressed == true ) {
        answers[4] = "A R T I S T I C";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 210 && mouseY < 228 && mousePressed == true ) {
        answers[4] = "G E N I U S";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 229 && mouseY < 241 && mousePressed == true ) {
        answers[4] = "I N S A N E";
      }
    }

    // QUESTION 5
    if ( question == 5 ) {
      text( "T R A I T  #2" + "\n" + "W H A T   T R A I T S   W O U L D   Y O U" + "\n" + "G I V E   Y O U R   C H I L D ?" + "\n", 350, 140 );
      text( "H A N D Y" + "\n" + "P E R C E P T I V E" + "\n" + "S L O B" + "\n" + "K L E P T O M A N I A C", 370, 190 );
      if ( mouseX > 369 && mouseX < 500 && mouseY > 180 && mouseY < 191 && mousePressed == true ) {
        answers[5] = "H A N D Y";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 200 && mouseY < 211 && mousePressed == true ) {
        answers[5] = "P E R C E P T I V E";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 210 && mouseY < 228 && mousePressed == true ) {
        answers[5] = "S L O B";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 229 && mouseY < 241 && mousePressed == true ) {
        answers[5] = "K L E P T O M A N I A C";
      }
    }

    // QUESTION 6
    if ( question == 6 ) {
      text( "T R A I T  #3" + "\n" + "W H A T   T R A I T S   W O U L D   Y O U" + "\n" + "G I V E   Y O U R   C H I L D ?" + "\n", 350, 140 );
      text( "H A N D S O M E" + "\n" + "B E A U T I F U L" + "\n" + "U G L Y" + "\n" + "N O R M A L", 370, 190 );
      if ( mouseX > 369 && mouseX < 500 && mouseY > 180 && mouseY < 191 && mousePressed == true ) {
        answers[6] = "H A N D S O M E";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 200 && mouseY < 211 && mousePressed == true ) {
        answers[6] = "B E A U T I F U L";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 210 && mouseY < 228 && mousePressed == true ) {
        answers[6] = "U G L Y";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 229 && mouseY < 241 && mousePressed == true ) {
        answers[6] = "N O R M A L";
      }
    }

    // QUESTION 7
    if ( question == 7 ) {
      text( "E D U C A T I O N" + "\n" + "H O W   F A R   W I L L   Y O U R" + "\n" + "C H I L D   G O ?" + "\n", 350, 140 );
      text( "M I D D L E   S C H O O L" + "\n" + "H I G H   S CH O O L" + "\n" + "C O L L E G E" + "\n" + "N O   E D U C A T I O N", 370, 190 );
      if ( mouseX > 369 && mouseX < 500 && mouseY > 180 && mouseY < 191 && mousePressed == true ) {
        answers[7] = "M I D D L E   S C H O O L";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 200 && mouseY < 211 && mousePressed == true ) {
        answers[7] = "H I G H   S C H O O L";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 210 && mouseY < 228 && mousePressed == true ) {
        answers[7] = "C O L L E G E";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 229 && mouseY < 241 && mousePressed == true ) {
        answers[7] = "N O   E D U C A T I O N";
      }
    }

    // QUESTION 8
    if ( question == 8 ) {
      text( "H E A L T H" + "\n" + "H O W   H E A L T H Y   W I L L " + "\n" + "Y O U R   C H I L D   B E ?" + "\n", 350, 140 );
      text( "V E R Y   H E A L T H Y" + "\n" + "N O R M A L" + "\n" + "N O T   H E A L T H Y" + "\n" + "S I C K L Y", 370, 190 );
      if ( mouseX > 369 && mouseX < 500 && mouseY > 180 && mouseY < 191 && mousePressed == true ) {
        answers[8] = "V E R Y   H E A L T H Y";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 200 && mouseY < 211 && mousePressed == true ) {
        answers[8] = "N O R M A L";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 210 && mouseY < 228 && mousePressed == true ) {
        answers[8] = "N O T   H E A L T H Y";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 229 && mouseY < 241 && mousePressed == true ) {
        answers[8] = "S I C K L Y";
      }
    }

    // QUESTION 9
    if ( question == 9 ) {
      text( "C A R E E R" + "\n" + "W H A T   C A R E E R   P A T H   W O U L D" + "\n" + "Y O U R   C H I L D   T A K E ?" + "\n", 350, 140 );
      text( "E N G I N E E R I N G" + "\n" + "S C I E N C E" + "\n" + "B U S I N E S S" + "\n" + "A R T", 370, 190 );
      if ( mouseX > 369 && mouseX < 500 && mouseY > 180 && mouseY < 191 && mousePressed == true ) {
        answers[9] = "E N G I NE E R I N G";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 200 && mouseY < 211 && mousePressed == true ) {
        answers[9] = "S C I E N C E";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 210 && mouseY < 228 && mousePressed == true ) {
        answers[9] = "B U S I N E S S";
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 229 && mouseY < 241 && mousePressed == true ) {
        answers[9] = "A R T";
      }
    }

    // QUESTION 10
    if ( question == 10 ) {
      text( "Y O U R   C H I L D" + "\n" + "A R E   Y O U   S A T I F I E D   W I T H" + "\n" + "Y O U R   C H I L D ?", 350, 140 );
      text( "Y E S" + "\n" + "N O", 370, 190 );
      if ( mouseX > 369 && mouseX < 500 && mouseY > 180 && mouseY < 191 && mousePressed == true ) {
        answers[10] = "Y E S";
        check = true;
      } else if ( mouseX > 369 && mouseX < 500 && mouseY > 200 && mouseY < 211 && mousePressed == true ) {
        question = 1;
        for ( int i = 1; i < answers.length; i++ ) {
          answers[i] = " ";
        }
      }
    }
  }
}



