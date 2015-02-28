

// Add automatic zoom-factor - based on bounding rect.

// anchor center point... and base zoomFac on (abs(minX)+abs(maxX))/2
// work on collecting genre info for colorizing.

import processing.xml.*;

String graphFile = "beatles10000.xml";
float zoomFac = 4;
float drawRadFactor = .5; // was.5
float phi = (sqrt(5)+1)/2 - 1; // golden ratio
float gAngle = phi*2*PI;           // golden angle

boolean isStretching = false, drawBlobs = true;

// Spring Demo
class Particle
{
  float  x,y,vx,vy,radius;
  float fx,fy,wt;
  float  r,g,b;
  int    nbrChildren = 0;
  boolean fixed = false;
  int    depth = 0;
  String  name = "";
  int    genre = 0;

  Particle(float x, float y, float r, float g, float b, float radius)
  {
    vx = 0;
    vy = 0;
    fx = fy = wt = 0;
    this.r = (float) r;
    this.g = (float) g;
    this.b = (float) b;
    this.x = x;
    this.y = y;
    
    this.nbrChildren = 0;
    this.fixed = false;
    this.radius = radius;
  }

  boolean isWithin(float px, float py)
  {
    px -= width/2;
    px /= zoomFac;
    py -= height/2;
    py /= zoomFac;
    float dx = px-x;
    float dy = py-y;
    return sqrt(dx*dx+dy*dy) <= radius;
  }

  float px()
  {
    return width/2 + (float) (x*zoomFac);
  }

  float py()
  {
    return height/2 + (float) (y*zoomFac);
  }
  float pr()
  {
    return radius*drawRadFactor*zoomFac;
  }
}

class Spring
{
  float restLen;
  Particle dot1;
  Particle dot2;
  Spring(Particle dot1, Particle dot2, float restLen)
  {
    this.dot1 = dot1;    
    this.dot2 = dot2;
    this.restLen = restLen;
  }
  float getLength()
  {
    float dx = dot1.x - dot2.x;
    float dy = dot1.y - dot2.y;
    return sqrt(dx*dx+dy*dy);
  }
}


XMLElement xml;
Particle[] particles;
Spring[] springs;
float rad, rad2;
int nbrNodes;
int nbrAdded = 0;
int lastDepth = 0;

void addNext()
{
  if (nbrAdded >= nbrNodes)
    return;
 int i = nbrAdded;
    XMLElement kid = xml.getChild(i);
    int id = kid.getIntAttribute("id");
    int depth = kid.getIntAttribute("depth");
    int genre = kid.getIntAttribute("genre");
    String nam = kid.getStringAttribute("name");
    int parentID = 0;
    Particle parent = null;
    float x = 0;
    float y = 0;
    if (depth > 0) {
      parentID = kid.getIntAttribute("parent");
      for (int j = 0; j < i; ++j) {
        if (xml.getChild(j).getIntAttribute("id") == parentID)
        {
          parent = particles[j];
          float a = random((float)(PI*2));
          x = parent.x + sin(a)*rad*2;
          y = parent.y + cos(a)*rad*2;
          parent.nbrChildren++;
          break;
        }
      }
    }
    particles[i] = new Particle(x,y,random(1),random(1),.5+random(.5), rad);
    particles[i].depth = depth;
    particles[i].name = nam;
    particles[i].genre = genre;
    lastDepth = depth;
    if (depth == 0) {
      // particles[i].fixed = true;
      particles[i].r = 1;
      particles[i].g = particles[i].b = 0;
    }
    if (parent != null)
      springs[i-1] = new Spring(particles[i], parent, rad*2);
  ++nbrAdded;
}


float gravK=0, stiffK=.0125, frictionK=.1, dampK=1-frictionK;

float  damping = 0.9;
float  kSpeed = 0.5;
float  minDistFactor = 2;

void doPhysics()
{
  float maxX = 0;
  float maxY = 0;

  for (int i = 0; i < nbrAdded; ++i) 
  {
    Particle pi = particles[i];
    if (abs(pi.x) > maxX)
      maxX = abs(pi.x);
    if (abs(pi.y) > maxY)
      maxY = abs(pi.y);
      
    pi.fx = pi.fy = pi.wt = 0;
    
    pi.vx *= damping;
    pi.vy *= damping;
    if (pi.fixed)
      continue;
      
   // separation forces TOO STRONG
   
    for (int j = 0; j < nbrAdded; ++j) {
      Particle pj = particles[j];
      float  dx = pi.x - pj.x;
      float  dy = pi.y - pj.y;
      if (abs(dx) > rad2 || abs(dy) > rad2 || j == i)   // this 'optimization' actually slows things down...
        continue;

      float  distance = sqrt(dx*dx+dy*dy);
      float  diff = rad2 - distance;
      if (diff > 0) {
	float scle = diff/rad2;
	scle = scle*scle;
	pi.wt += scle*.4;
	scle = scle*kSpeed/distance;
        pi.fx += dx*scle;
        pi.fy += dy*scle;
      }
    }
    
    
    pi.wt += .06; // this extra weight seems necessary to prevent wild spring/forces triggered by sepration forces
                 // perhaps this is a scaling factor for separation -> spring?

    /* this wasn't necessary  (gravitate to center)
    float dx,dy,distance,scle,diff;
    float maxDist = pi.radius;
    // left edge  
    dx = 0 - pi.x;    dy = 0- pi.y;
    distance = sqrt(dx*dx+dy*dy);
    scle = 1/distance;
    if (distance > 0) {
	// scle = .0001;
	pi.wt += 1;
        pi.fx += dx*scle*.000005;
        pi.fy += dy*scle*.000005;
    }
    */
  }
  // spring forces...
  
  for (int i =0 ; i < springs.length; ++i)
  {
    if (springs[i] == null)
      continue;
    Spring spr = springs[i];
    float dst = spr.getLength();
    // spr.dst = dst;
    float wt = stiffK * (dst - spr.restLen);
    float spr_fx = (spr.dot2.x - spr.dot1.x)/dst;
    float spr_fy = (spr.dot2.y - spr.dot1.y)/dst;
    // if (i == 0)
    //   println(spr_fx + ", " + spr_fy + ", " + wt);
    
    // EXPERIMENAL - adjust spring restLen in direction of force, just a tiny bit (warping the spring)
    if (isStretching)
    spr.restLen += wt*.1;
    
    spr.dot1.wt += wt;
    spr.dot2.wt += wt;
    if (!spr.dot1.fixed) {
      spr.dot1.fx += spr_fx*wt;
      spr.dot1.fy += spr_fy*wt;
    }
    if (!spr.dot2.fixed) {
      spr.dot2.fx -= spr_fx*wt;
      spr.dot2.fy -= spr_fy*wt;
    }
  }
 
  for (int i = 0; i < nbrAdded; ++i) {
    Particle pi = particles[i];
    if (pi.wt > 0) {
      pi.vx += pi.fx/pi.wt;
      pi.vy += pi.fy/pi.wt;
    }
    pi.x += pi.vx;
    pi.y += pi.vy;
    // particles[i].x += .5;
  }
  float nzoomFac = min((float) zoomFac, min((float) (width*.5/(maxX*1.1)), (float) (height*.5/(maxY*1.1))));
  zoomFac += (nzoomFac - zoomFac)/5;
  
  // if (zoomFac < .25)
  //  zoomFac = .25; 
}




int frame = 0;

boolean paused = false;  // 0 = load stuff, 1 = pausing
int nextTarget = 500;
float nextUnpause, nextStretch;
int  lastFrameCount = 0;
float lastFrameTime = millis();

String label = "";

void draw()
{
  ++frame;
  if (!paused)
  {
    for (int i = 0; i < lastDepth+1 && nbrAdded < nextTarget; ++i)
        addNext();
    if (nbrAdded >= nextTarget) {
      paused = true;
      lastFrameTime = millis();
      lastFrameCount = frame;
      nextUnpause = frame+frameRate*20;
      nextStretch = frame+frameRate*10;
      nextTarget += 500;
      println("Pausing");
    }
  }
  else {
    if (!isStretching && frame >= nextStretch)
    {
      isStretching = true;
      println("Stretching");
    }
    if (frame >= nextUnpause)
    {
      paused = false;
      isStretching = false;
      lastFrameTime = millis();
      lastFrameCount = frame;
      println("Unpausing");
    }
  }
/*
    if (millis() - lastFrameTime >= 1000) 
    {
      println((frame - lastFrameCount) + " fps");
      lastFrameTime = millis();
      lastFrameCount = frame;      
    }
*/
  doPhysics();
  background(0);
 
  for (int i = 0; i < springs.length; ++i)
  {
    // draw spring...
    Spring spr = springs[i];
    if (spr == null)
      continue;
    color c1 = color((sin(spr.dot1.genre*gAngle)+1)/2,.5 + (sin(spr.dot1.depth*gAngle)+1)/4,.7);
    stroke(c1);
    line(spr.dot1.px(),spr.dot1.py(),
         spr.dot2.px(),spr.dot2.py());
  }
  noStroke();
  if (drawBlobs)
  {
  for (int i = 0; i < particles.length; ++i) 
  {
    Particle pi = particles[i];
    if (pi == null)
      continue;
    color c1 = color((sin(pi.genre*gAngle)+1)/2,.5 + (sin(pi.depth*gAngle)+1)/4,.9);
    fill(c1);
    // stroke(1,1,1);
    ellipse(pi.px(), pi.py(), pi.pr(), pi.pr());
  }
  }
  noFill();
  // stroke(.5,.5,.5);
}

void setup()
{
  size(800,600);
  frameRate(24);
  colorMode(HSB, 1);
  ellipseMode(CENTER_RADIUS);
  // noLoop();
  smooth();
  noStroke();

  xml = new XMLElement(this, graphFile);
  nbrNodes = xml.getIntAttribute("nbrnodes");
  println(nbrNodes + " nodes");
  int numSites = xml.getChildCount();
  println(numSites + " sites");
  particles = new Particle[nbrNodes];
  springs = new Spring[nbrNodes-1];
  float avgArea = (width*height / (float) nbrNodes);
  rad = sqrt(avgArea/PI)*.9;
  rad2 = rad*2;
  for (int i = 0; i < numSites; i++) 
  {

    // add spring here...
    // println(kid.getName());    
  }
}

void mousePressed()
{
  for (int i = 0; i < particles.length; ++i) 
  {
    Particle pi = particles[i];
    if (pi == null)
      continue;
   if (pi.isWithin(mouseX, mouseY))
   {
     label = pi.name;
     println("Got : " + label);
   }
  }
  // find nearest node, if we're sitting on one, show it's label...
}

