
//import fullscreen.*;
//FullScreen fs; 

ArrayList objs;

int screen_w = 800;
int screen_h = 600;

float ballSpawnV = 0.01; // fart i begge retninger
int ballMinR = 1;
int ballMaxR = 5;
float vMax = 0.19;

float maxBallSizeR = 26;
int maxBallGoo = (screen_w*screen_h)/128;
float totalBallGoo;
float minGoo;

float explotion_background;


void setup() 
{
  size(screen_w, screen_h, P2D);
  frameRate(50);
    
  objs = new ArrayList();
  totalBallGoo = maxBallGoo;
println(maxBallGoo);
  minGoo = PI*pow(ballMaxR, 2); 

  while (totalBallGoo > minGoo && objs.size() < 150) { // ny metode
    buildBall(0,0,random(0,TWO_PI),random(-ballSpawnV, ballSpawnV)); 
  }
}


void draw() 
{
  background(explotion_background);

  Obj o, o2;
  int obj_count = 0;
  int i,j;
  float dx,
  dy,
  sq_dist, // squared distance
  i_dist, // not ... 
  force,
  ax,
  ay;

  // gravity udregninger
  for (i = 0; i < objs.size(); i++) {
    o = (Obj) objs.get(i);

    for (j = 0; j <objs.size(); j++) {          
      if (j != i ) { 
        o2 = (Obj) objs.get(j);

        dx = o2.loc.x - o.loc.x;
        dy = o2.loc.y - o.loc.y;
        i_dist = pow(dx,2) + pow(dy,2);
        sq_dist = sqrt(i_dist);

        force = pow(o2.r,1.9) / sq_dist;                 // FORCE!!!
        ax = force * dx / i_dist;
        ay = force * dy / i_dist;          
        o.acc = new PVector(ax/100, ay/100);        
        
        if (o.acc.mag() > vMax) {
          println(o.acc.mag());
          o.acc = new PVector(vMax, vMax);   
        }
        o.updateLoc();                          
      }
      else {
        obj_count++;
      }
    } 
    o.render();    
  }

  // hit/eat tests  
  boolean hit; 
  for (i = 0; i < objs.size()-1; i++) {    
    o = (Obj) objs.get(i);
    if (o.dead == false) {

      for (j = i+1; j <objs.size(); j++) {               
        o2 = (Obj) objs.get(j);       

        if (o2.dead == false) {          
          hit = hitTest(o, o2);          
          if (hit) {

            Obj winner;
            Obj loser;
            int loser_index;

            if (o.r > o2.r) {
              winner = o;
              loser = o2;
              loser_index = j;
            }
            else {
              winner = o2;
              loser = o;
              loser_index = i; 
            }                 

            winner.eat(loser_index);    
            loser.dead = true;            
          }
        }
      }
    }
  }
  
  for (i = 0; i < objs.size(); i++) {
    o = (Obj) objs.get(i);
    if (o.exploded == true) {
      explode(o.loc.x, o.loc.y); 
    }
  }

  for (i = 0; i < objs.size(); i++) {
    o = (Obj) objs.get(i);
    if (o.dead == true) {
      objs.remove(i);  
    }
  }

  //text("object count: " + obj_count + ", obj.size(): " + objs.size(), 10, 10);
  explotion_background *= 0.7;
}

void explode(float _x, float _y) {
  //println(totalBallGoo);
  while (totalBallGoo > minGoo) {
    buildBall( _x + around(40, 10, "x"), _y + around(0, 10, "y"), random(0,TWO_PI), random(0.15,0.2) );          
  }
  explotion_background = 255;
  background(explotion_background);
}

float around(float mid_r, float margin, String axis) {
  // mid_r = offset
  float a = random(0,TWO_PI);  
  float cord = 0;
  if (axis == "x") {  
    cord = cos(a)*mid_r;
  }
  else if (axis == "y") {
    cord = sin(a)*mid_r;    
  }
  cord += random(-margin,margin);
  return cord;
}

void buildBall(float _x, float _y, float _a, float _v) { // at give den 0 i _x og _y er det samme som "jeg er ligeglad hvor den spawner"
  float margin;
  float x;
  float y;
  float v;
  float a;
  float r;
  r = random(ballMinR, ballMaxR);
  margin = r;
  x = (_x == 0) ? random(0+margin, width-margin)  : _x;
  y = (_y == 0) ? random(0+margin, height-margin) : _y;
  a = random(0, 360);   

  objs.add( new Obj(new PVector(x,y), r, _a, _v) );   
  totalBallGoo -= PI*pow(r,2);
  //println(totalBallGoo);
}

boolean hitTest(Obj o, Obj o2) {
  boolean testResult = false;  

  float dx,
  dy,
  sq_dist,
  i_dist;

  dx = o2.loc.x - o.loc.x;
  dy = o2.loc.y - o.loc.y;
  i_dist = pow(dx,2) + pow(dy,2);
  sq_dist = sqrt(i_dist);

  if (sq_dist < max(o.r, o2.r)) {
    testResult = true;  
    //println(sq_dist + " < " + max(o.r, o2.r));
  }

  return testResult;
}



class Obj {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  boolean dead = false;
  boolean exploded = false;

  // Another constructor (the one we are using here)
  Obj(PVector l, float _r, float _a, float _v) {
    float vx = cos(_a) * _v;
    float vy = sin(_a) * _v;
    acc = new PVector(0,0);
    vel = new PVector(vx,vy);
    loc = l.get();
    r = _r;
  }

  public void eat(int i) {
    Obj b = (Obj) objs.get(i);

    float currentGoo = PI*pow(r,2);
    float eatenGoo = PI*pow(b.r,2);
    float newR = sqrt(eatenGoo + currentGoo) / sqrt(PI);

    if (newR > maxBallSizeR) {
      //if (objs.indexOf(this) > -1) {
      //  objs.remove(objs.indexOf(this));
      //}
      totalBallGoo += (eatenGoo + currentGoo);    
      //explode(loc.x, loc.y);
      dead = true;
      exploded = true;
    } 
    else {      
      r = newR;
      vel.mult(0.75); // her skal laves et sammenstød i stedet
    }
  }

  // Method to update location
  void updateLoc() {
    if (loc.x > width) {
      loc.x = width-loc.x; 
    }
    else if (loc.x < 0) {
      loc.x = width;
    }

    if (loc.y > height) {
      loc.y = height-loc.y; 
    }
    else if (loc.y < 0) {
      loc.y = height;
    }

    vel.add(acc);
    loc.add(vel);
    //vel.mult(0.9999); // friction
  }

  // Method to display
  void render() {
    smooth();
    ellipseMode(RADIUS);
    noStroke();
    fill(255);
    ellipse(loc.x-1.5,loc.y-1.5,r,r);
    //displayVector(vel,loc.x,loc.y,10);
  }
}




