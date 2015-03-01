
/*      Pierre MARZIN 07/2014
 *  An 'artificial simple evolution model'
 *  To survive, a bug must stay over the floor level
 *  and under the ceiling level (sketch vertical boundaries).
 *  The vertical speed are determined from legs, wings and belly sizes!
 *  Bugs are able to give birth when they reach a certain sexualmaturity
 *  There are males and females (I know, not very innovative) with stupid sexual characters^^
 *  Their wings will get more opaque with their sexual maturity or 'disponibility'
 *  They will give birth to one or two child(s) when they collide...
 *  Then they will not be able to procreate for a while!
 *  The physical properties of the child will be a 'noisified' average of its parents
 */
int nbeinit;//nbe of bugs
ArrayList <Bug>population;//population of bugs
PImage grad;//background gradient image
PGraphics panel;
String endtext;
int endtime;
boolean finished=false;
int nbefemales=0;//nbe of female bugs
int nbemales=0;//nbe of male bugs

void setup() {
  size(800, 800);
  panel=createGraphics(width/2, height/3);
  colorMode(RGB);
  color c1 = color(255, 255, 0);//first color of the gradient background
  color c2 = color(0, 50, 255);//second color of the gradient background
  grad = generateGradient(c1, c2, width, height);//background gradient image is generated
  colorMode(HSB, 360, 255, 255);
  ellipseMode(CENTER);
  nbeinit=15+int(random(50));//nbe of bugs is initialized
  nbemales=0;//nbe of male bugs is reset
  nbefemales=0;//nbe of female bugs is reset
  population=new ArrayList<Bug>();//population is initialized
  for (int i=0; i<nbeinit; i++) {//population is filled with new random bugs
    population.add(new Bug(new PVector(random(width), random(height)), 3+random(12), 5+random(12), 1+random(4), i));
  }
}
void draw() {
  background(255, 0, 255);//background erased
  image(grad, 0, 0);//background image is displayed
  for (int i = population.size ()-1; i >= 0; i--) {//at each frame, each bug's 'run' function is called
    population.get(i).run();
  }
  String tm=nbemales+" male";//nbe of males and females is displayed
  if (nbemales>1)tm+="s";
  String tf=nbefemales+" female";
  if (nbefemales>1)tf+="s";
  fill(0);
  text(tm, 20, 20);
  text(tf, width-120, 20);
  if (!finished)finished=testEnd();//test if population is done
  if (finished) { //if population has to be recreated, explain why
    panel.beginDraw();
    panel.fill(0);
    panel.background(255, 50);
    panel.textSize(20);
    panel.text(endtext, width/20, height/8);
    panel.endDraw();
    image(panel, width/4, height/4);
    if (millis()>endtime+2000) {//after displaying explanation for 2 sec, sketch is reinitialized
      finished=false;
      setup();
    }
  }
}
boolean testEnd() {//test if population is condamned and return the result

  if (population.size()>150) {
    endtext="The area is overcroweded!\n\nPopulation will be recreated...";//endtext and endtime are global
    endtime=millis();   
    return true;
  } else if (nbefemales==0) {
    endtext="No female left: not very convenient!\n\nPopulation will be recreated...";    
    endtime=millis();   
    return true;
  } else if (nbemales==0) {
    endtext="No male left: not very convenient!\n\nPopulation will be recreated...";
    endtime=millis();   
    return true;
  }
  return false;
}

// Generate a vertical gradient image
PImage generateGradient(color top, color bottom, int w, int h) {
  int tR = (top >> 16) & 0xFF;
  int tG = (top >> 8) & 0xFF;
  int tB = top & 0xFF;
  int bR = (bottom >> 16) & 0xFF;
  int bG = (bottom >> 8) & 0xFF;
  int bB = bottom & 0xFF;

  PImage bg = createImage(w, h, RGB);
  bg.loadPixels();
  for (int i=0; i < bg.pixels.length; i++) {
    int y = i/bg.width;
    float n = y/(float)bg.height;
    // for a horizontal gradient:
    // float n = x/(float)bg.width;
    bg.pixels[i] = color(
    lerp(tR, bR, n), 
    lerp(tG, bG, n), 
    lerp(tB, bB, n), 
    100);
  }
  bg.updatePixels();
  return bg;
}
//******************************************************************// our Bug class!
class Bug {
  PVector loc;//situation
  int index;//index in the collection (population)
  float wingsize;
  float bellysize;
  float legsize;
  float speed;
  float weight;//weight will be crucial!)
  Bug bride;//in case of mating, here is the bride!
  int startcopulationtime;//selfexplanatory
  int copulationduration=3000;
  boolean ismoving=true;//bug is free to move or mating?
  boolean ismale=boolean(int(random(2)));//sex will be used to match partners
  int age=0;
  int longevity=500+int(random(5000));//bugs are not born equal
  int sexualmaturity=0;// you'll have to wait a bit, son!
  float colwings=color(100*int(ismale)+random(50), 255, 255, 10);//bug parts colors
  float colbelly=color(random(360), 255, 255);
  float collegs=color(random(360), 255, 180);
  Bug(PVector loc, float wingsize, float bellysize, float legsize, int index) {//constructor
    this.wingsize=wingsize;
    this.bellysize=bellysize;
    this.legsize=legsize;
    this.index=index;
    this.loc=loc;
    weight=2*legsize+int(ismale)*legsize+bellysize-2*wingsize;//weight depends on the parts sizes and quantity
    speed=random(-2, 2);
    if (ismale)nbemales++;//nbe of males/females is incremented
    else nbefemales++;
  }
  void run() {//main function
    age++;//age is incremented
    if (age>longevity) {//if bug gets too old
      wingsize+=(2*int(ismale)-1)*.002;//wing size will be modified
      weight=2*legsize+int(ismale)*legsize+bellysize-2*wingsize;//so weight has to be updated
    }
    sexualmaturity=min(301, sexualmaturity+1);//sexualmaturity is incremented and topped
    if (ismoving) {//bug is free
      move();//displacement
      if (sexualmaturity>300) checkcollision();//is a partner close enough?
    } else if (bride!=null)procreate();//partner has already been found
    display();//in any case, display the bug's graphics
  }
  void move() {
    loc.x=(loc.x+speed)%width;//cycling around the scene
    if (loc.x<0)loc.x=width;
    loc.y=loc.y+(weight/20);
    if (loc.y<0 || loc.y>height) {//if vertical boundaries are reached bug dies!
      if (ismale)nbemales--;
      else nbefemales--;
      population.remove(this);//one less
    }
  }
  void checkcollision() {//is a partner at reach?
    int pop=population.size()-1;
    for (int i=pop; i>=0; i--) {
      if (i!=index && population.get(i).sexualmaturity>300) {   //check for every distinct capable bugs        
        float distance=dist(loc.x, loc.y, population.get(i).loc.x, population.get(i).loc.y);
        if (distance<(bellysize+population.get(i).bellysize) && population.get(i).ismoving && population.get(i).ismale!=ismale) {//partner has to be the right gender and not already busy
          bride=population.get(i);
          ismoving=false;//bugs are stopped, they're busy
          bride.ismoving=false;            
          loc.x=bride.loc.x;//they are positionned in a traditionnal way^^
          loc.y=bride.loc.y-(2*int(ismale)-1)*(bellysize+5);
          startcopulationtime=millis();//starting time is stored
        }
      }
    }
  }
  void procreate() {
    noStroke();
    fill(0, 255, 255, 50);//'aura of love' is displayed
    ellipse(loc.x, (loc.y+bride.loc.y)/2, 5*bellysize, 5*bellysize);
    stroke(0);
    if (millis()-startcopulationtime>copulationduration) {//when it's done, a new bug is raised
      Bug child=new Bug(new PVector(loc.x, loc.y), (wingsize+bride.wingsize)/2+random(-2, 2), 
      (bellysize+bride.bellysize)/2+random(-2, 2), (legsize+bride.legsize)/2+random(-2, 2), population.size());
      population.add(child);
      if (random(1)>.8) {
        child=new Bug(new PVector(loc.x, loc.y), (wingsize+bride.wingsize)/2+random(-2, 2), 
        (bellysize+bride.bellysize)/2+random(-2, 2), (legsize+bride.legsize)/2+random(-2, 2), population.size());
        population.add(child);
      }
      if (random(1)>.95) {
        child=new Bug(new PVector(loc.x, loc.y), (wingsize+bride.wingsize)/2+random(-2, 2), 
        (bellysize+bride.bellysize)/2+random(-2, 2), (legsize+bride.legsize)/2+random(-2, 2), population.size());
        population.add(child);
      }
      ismoving=true;// and the partners are freed
      bride.ismoving=true;
      sexualmaturity=100;//they have to take a rest! If not they would procreate with their newborn...
      bride.sexualmaturity=100;
      startcopulationtime=0;
      bride=null;//partners are not anymore
    }
  }
  void display() {// bug's graphics
    colwings=color(colwings, 10+240*sexualmaturity/300);//wings transparency will reflect sexual maturity
    fill(colwings);
    if (ismale)ellipse(loc.x, loc.y+bellysize*.5+legsize/3, legsize/3, sexualmaturity*legsize/150);//males have a third leg, fully grown when they are ready
    fill(collegs);
    ellipse(loc.x-bellysize/3, loc.y+bellysize*.5+legsize/3, legsize/3, 2*legsize);   
    ellipse(loc.x+bellysize/3, loc.y+bellysize*.5+legsize/3, legsize/3, 2*legsize);
    fill(colbelly);
    ellipse(loc.x, loc.y, bellysize, bellysize);    
    fill(colwings);
    if (!ismale)ellipse(loc.x, loc.y, sexualmaturity*bellysize/600, sexualmaturity*bellysize/600);//females have a 'decoration', fully grown when they are ready
    pushMatrix();
    translate(loc.x-bellysize/4, loc.y-bellysize*.4);
    rotate(-1.2+1.2*sin(2*frameCount/wingsize));//wings flap
    ellipse(0, -wingsize*.8, wingsize, 2*wingsize);    
    popMatrix();
    pushMatrix();
    translate(loc.x+bellysize/4, loc.y-bellysize*.4);
    rotate(1.2-1.2*sin(2*frameCount/wingsize));//wings flap
    ellipse(0, -wingsize*.8, wingsize, 2*wingsize);
    popMatrix();
  }
}
