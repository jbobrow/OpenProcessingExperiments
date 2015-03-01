
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 ***************************************************************************
 ***************************************************************************** 
 I tried my best to comment this sketch so it can be used by beginning OOP programmers
 I'm far from being a specialist! Please, tell me if I'm wrong or using any bad pratice.
 
 I first 'translated' the original sketch to be use a class of Wanderers (which are the example tops)
 Doing so gives a more structured program, which is far easier to play with later on.
 I tried to separate the different phases: initializations, instanciations, sketch and objects function,
 I hope it could help some... Have fun.
 */

// collection of the different wanderers (tops)
ArrayList <Wanderer>wanderers;
// how many of them
int num;
PGraphics pg, pq;
///////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  size(600, 600);
  frameRate(200);
  pg=createGraphics(width, height);
  pg.beginDraw();
  pg.background(255, 0);
  pg.endDraw();
  pq=createGraphics(width, height);
  pq.beginDraw();
  pq.background(255, 0);
  pq.endDraw();
  //initializatin of the list
  wanderers=new ArrayList<Wanderer>();
  //I'd like vibrant colors, so HSB is easier than RGB
  colorMode(HSB);
  //number of wanderers
  num=25;
  //creation of the wanderers, they're added to the list
  // each of them is an instance of the Wanderer class (see later)
  //this Object oriented approach avoids to create lots of arrays for our tops properties
  //each object (top) is dealing with it's own properties
  for (int i=0; i<num; i++) {
    //each wanderer is created by calling the constructor of object Wanderer: new Wanderer(...) 
    //at this point, I only fix the index of it, the other properties will be calculated inside the object
    //
    wanderers.add(new Wanderer(i));
  }

  background(0);
}

///////////////////////////////////////////////////////////////////////////////////////////
void draw() {
  //all we have to do for each frame is call some of the wanderers's functions
  for (int i=0; i<num; i++) {   
    //test when we have to reinitiate the objects
    wanderers.get(i).test();
    // each object displays itself
    wanderers.get(i).display();
  }

  if(frameCount%10==0){
    background(#001144);
    image(pq, 0, 0);
    image(pg, 0, 0);
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//here is our object definition, all the objects in this class will have the same properties (not the same values!)
//and the same inner functions
class Wanderer {

  //static means that these values are related to the class, not to instances (objects of this class
  static float primAmplitude; //amplitude of the radius oscillation
  static float secAmplitude; //amplitude of the tip's oscillation
  static float maxDiameter; //max diameter of the ellipses
  static float minDiameter; //min diameter of the ellipses
  static float max = 1; //max speed
  static float min = -1; //min speed
  static int ageMax; //max age of the wanderer
  float startHue, endHue, hueOffset;//startHue, endHue and hue Offset are used to generate col
  PVector position;      // current drawing position
  PVector origin;  //position at creation time
  PVector speed;   // change in position at each frame
  PVector hand;    // hand position
  PVector lineTip; //tip position
  float rad, radius; //rad is more or less the angle of the tip's oscillation, radius is the angle of the hand's oscillation
  float col;        // col is the main color 
  int age; //current and max age of the wanderer
  int index; //index of the wanderer inthe wanderers'list
  int sens; //direction of the radius oscillation

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //this is a constructor of this class, it's called by the word 'new' when you do 'Wanderer wanderer=new Wanderer(i);'
  Wanderer(int index) {
    //here I place the wanderers on a circle
    //I calculate the position here, so I can get the position at creation time
    int nbeCellPerWidth=int(sqrt(num));
    float cellSize=(width)/nbeCellPerWidth;
    position=new PVector(50+cellSize/4+int(index/nbeCellPerWidth)*cellSize+random(-cellSize/4, cellSize/4), 
    50+int(index%nbeCellPerWidth)*cellSize+random(-cellSize/4, cellSize/4));
    //the origin is the copy of the position at creation time. This way, origin wont be affeced by position changes
    origin=position.get();
    //initiate speed variable
    speed=new PVector();
    this.index=index; //index is given at creation time this.index is the index of the oject, index is the variable given to the constructor
    //static variables are initiated
    ageMax=30+int(random(50)); 
    primAmplitude=60+random(20);
    secAmplitude=40;
    maxDiameter=30;
    minDiameter=.5;
    startHue=random(255);
    endHue=startHue+50;
    hueOffset=183+random(40);
    //here I call an initiate function, to calculate the values of object's variables
    //it will be called again if I need to reinitiate the object
    initiate();
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //at each frame we test if the object has to be reinitiated (could be if it gets out of the window)
  boolean test() {
    boolean out=false;
    //When the wanderer is old enough, it's re initiated
    if (age>ageMax) {
      initiate();
      out=true;
    }
    return out; //result of the test is returned by the function, then we could use 'boolean testResult=test();'
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //initiation of the object's variables
  void initiate() {
    position=origin.get();
    //vectors'coordinates can be accessed this way...
    speed.x=random(-1, 1);
    speed.y=random(-1, 1);    
    col=color((random(startHue, endHue)+hueOffset)%255, 255, random(128, 255));
    //age is reset 
    age=1;
    //random oscillation direction
    sens=random(1)>.5? -1:1;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //the object calculates its properties new values, then displays this frame's graphics
  //it's mainly there that you can twist things^^
  void display() {
    //object is aging
    age++;
    //rad is a function of the age
    rad=sens*radians(age);
    //radius is an oscillation of rad
    radius=sens*primAmplitude* sin(rad);
    // calculate new position
    position.add(speed);
    //lineTip position oscillates around the main position, with rad angle(twisted)
    // here you can modify the formulas to get different results
    lineTip=PVector.add(position, new PVector(secAmplitude * sin(1.5*rad), secAmplitude * cos(rad)));
    //dst is a mapping of the distance from the origin
    float dst=map(dist(lineTip.x, lineTip.y, origin.x, origin.y), 0, .3*width, 3, .1);
    //hand oscillates around lineTip, dst is used decrease the oscillation speed when we go away from the origin
    hand=PVector.add(lineTip, new PVector(radius * sin(rad*dst), radius * cos(rad*.6)));  //dst and .6 factors were experienced by trial and error
    
    //alp is a mapping of the age, I'll use it both for transparency and for the ellipse diameter
    float alp=map(age, 0, ageMax, maxDiameter, minDiameter);
    //float alp=map(dst,0,sqrt(width/2),255,50);  Trial formula
    //float alp=30*(2+sin(hand.x/30)-sin(hand.y/30));//map(hand.x%100+hand.y%100,0,100,255,0); //another trial
    //lines hue will evolve with the age of the wanderer
    int col1=color((age+50)%255, saturation(col), brightness(col)*.7);
    pq.beginDraw();
    pq.strokeWeight(.1); //I need thin lines
    pq.stroke(255, alp);
    pq.fill(col1, alp/8);   
    //line is drawn finally! 
    pq.ellipse(hand.x, hand.y, (hand.x-lineTip.x)/2, abs(hand.y-lineTip.y)/2);
    pq.endDraw();
    //drawing attributes for the ellipse
    pg.beginDraw();
    pg.fill(255, alp/10);
    pg.stroke(col, alp); 
    pg.strokeWeight(1);
    //ellipse is drawn!
    pg.ellipse(lineTip.x, lineTip.y, alp*sin(age/20), alp*sin(age/20));
    pg.endDraw();
  }
}




