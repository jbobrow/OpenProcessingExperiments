
/*      Pierre MARZIN 07/2014
 *  An 'artificial simple evolution model' working example:
 *          http://www.openprocessing.org/sketch/154444
 *  It's a 'template' you could use if you want to generate your own artificial population
 *  statements surrounded by '**' like in **creatures properties** have to be replaced to match your own design.
 *  I left parts commented to show I implemented some functions in my version. They must be replaced by your own code.
 *  Hope this helps newcomers! Please let me know if you create anything using this template...
 */
int nbeinit;//nbe of creatures
ArrayList <Creature>population;//population of creatures
PGraphics panel;
String endtext;
int endtime;
boolean finished=false;
int nbefemales=0;//nbe of female creatures
int nbemales=0;//nbe of male creatures
/************************************************************************************************************************
                  What you need to set as sketch starts or reset if you call setup()
************************************************************************************************************************/
void setup() {
  size(800, 800);
  panel=createGraphics(width/2, height/3);//panel is used to post explanations when the population is not viable anymore
  colorMode(HSB, 360, 255, 255);
  background(0);
  nbeinit=15+int(random(50));//nbe of creatures is initialized
  nbemales=0;//nbe of male creatures is reset
  nbefemales=0;//nbe of female creatures is reset
  population=new ArrayList<Creature>();//population is initialized
  for (int i=0; i<nbeinit; i++) {//population is filled with new random creatures
    population.add(new Creature(**creatures properties**);
  }
}
/************************************************************************************************************************
                            What you need to do at each frame
************************************************************************************************************************/
void draw() {
  background(255, 0, 255);//background erased
  fill(0);
  image(grad, 0, 0);//background image is displayed
  for (int i = population.size ()-1; i >= 0; i--) {//at each frame, each creature's 'run' function is called
    population.get(i).run();
  }
  String tm=nbemales+" male";//nbe of males and females is displayed
  if (nbemales>1)tm+="s";
  String tf=nbefemales+" female";
  if (nbefemales>1)tf+="s";
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
/************************************************************************************************************************
                            At every frame, population is evaluated 
************************************************************************************************************************/
boolean testEnd() {//test if population is condamned and return the result (change the conditions to suit your design)
//  if (population.size()>150) {
//    endtext="The area is overcroweded!\n\nPopulation will be recreated...";//endtext and endtime are global
//    endtime=millis();   
//    return true;
//  } else if (nbefemales==0) {
//    endtext="No female left: not very convenient!\n\nPopulation will be recreated...";    
//    endtime=millis();   
//    return true;
//  } else if (nbemales==0) {
//    endtext="No male left: not very convenient!\n\nPopulation will be recreated...";
//    endtime=millis();   
//    return true;
//  }
//  return false;
}

/************************************************************************************************************************
                            Our Creature class! You could have several different creatures as well...
************************************************************************************************************************/

class Creature {
  PVector loc;//situation
  int index;//index in the collection (population) 
  boolean ismale=boolean(int(random(2)));//sex will be used to match partners
  //next are custom creatures properties
//  float wingsize;
//  float bellysize;
//  float legsize;
//  float speed;
//  float weight;//weight will be crucial!)
//  Creature bride;//in case of mating, here is the bride!
//  int startcopulationtime;//selfexplanatory
//  int copulationduration=3000;
//  boolean ismoving=true;//creature is free to move or mating?
//  int age=0;
//  int longevity=500+int(random(5000));//creatures are not born equal
//  int sexualmaturity=0;// you'll have to wait a bit, son!
//  float colwings=color(100*int(ismale)+random(50), 255, 255, 10);//creature parts colors
//  float colbelly=color(random(360), 255, 255);
//  float collegs=color(random(360), 255, 180);
/************************************************************************************************************************
                            Constructor uses properties you have to set at creation time
************************************************************************************************************************/
  Creature(**creatures properties**) {//constructor uses properties you have to set at creation time
    this.**property**=**property**; //you have to pass each property passed to the constructor to the new instance
//    this.bellysize=bellysize;
//    this.legsize=legsize;
//    this.index=index;
//    this.loc=loc;
    weight=2*legsize+int(ismale)*legsize+bellysize-2*wingsize;//weight depends on the parts sizes and quantity
    speed=random(-2, 2);
    if (ismale)nbemales++;//nbe of males/females is incremented
    else nbefemales++;
  }
/************************************************************************************************************************
     main function 'run() organizes the calls to each creature's functions according to their state and behavior
************************************************************************************************************************/
  void run() {
    age++;//age is incremented
//    if (age>longevity) {//if creature gets too old
//      wingsize+=(2*int(ismale)-1)*.002;//wing size will be modified
//      weight=2*legsize+int(ismale)*legsize+bellysize-2*wingsize;//so weight has to be updated
//    }
//    sexualmaturity=min(301, sexualmaturity+1);//sexualmaturity is incremented and topped
//    if (ismoving) {//creature is free
//      move();//displacement
//      checkHealth();
//      if (sexualmaturity>300) findPartner();//is a partner close enough?
//    } else if (bride!=null)procreate();//partner has already been found
    display();//in any case, display the creature's graphics
  }
/************************************************************************************************************************
                  here we move the creature around (not mandatory!)
************************************************************************************************************************/  
  void move() { 
    loc.x=(loc.x+speed)%width;//cycling around the scene
    if (loc.x<0)loc.x=width;
    loc.y=loc.y+(weight/20);
  }
/************************************************************************************************************************
                 here you check if a creature will survive
************************************************************************************************************************/
  void checkHealth(){//test your survival criterias
//    if (loc.y<0 || loc.y>height) {//if vertical boundaries are reached creature dies!
//      if (ismale)nbemales--;
//      else nbefemales--;
//      population.remove(this);//one less
//    }
  }
/************************************************************************************************************************
 is a partner at reach? we cycle through the whole population to find a suitable partner (here, it's a collision test)
************************************************************************************************************************/
  void findPartner() {
    int pop=population.size()-1;
    for (int i=pop; i>=0; i--) {
//      if (i!=index && population.get(i).sexualmaturity>300) {   //check for every distinct capable creatures        
//        float distance=dist(loc.x, loc.y, population.get(i).loc.x, population.get(i).loc.y);
//        if (distance<(bellysize+population.get(i).bellysize) && population.get(i).ismoving && population.get(i).ismale!=ismale) {//partner has to be the right gender and not already busy
//          bride=population.get(i);
//          ismoving=false;//creatures are stopped, they're busy
//          bride.ismoving=false;            
//          loc.x=bride.loc.x;//they are positionned in a traditionnal way^^
//          loc.y=bride.loc.y-(2*int(ismale)-1)*(bellysize+5);
//          startcopulationtime=millis();//starting time is stored
//        }
//      }
    }
  }
/************************************************************************************************************************
 our creature has found a mate: they'll have a descendance. here you animate the event and create the new born creature(s)
 They will inheritate from both parents, according to their genome (here, a simpleaverage with a bit of random is used)
************************************************************************************************************************/
  void procreate() {
//    noStroke();
//    fill(0, 255, 255, 50);//'aura of love' is displayed
//    ellipse(loc.x, loc.y-bellysize/2, 5*bellysize, 5*bellysize);
//    stroke(0);
//    if (millis()-startcopulationtime>copulationduration) {//when it's done, a new creature is raised or 2(sometimes) or 3(rarely)...
      Creature child=new Creature(**inherited properties**);
      population.add(child);
//      if (random(1)>.8) {
//        child=new Creature(new PVector(loc.x, loc.y), (wingsize+bride.wingsize)/2+random(-2, 2), 
//        (bellysize+bride.bellysize)/2+random(-2, 2), (legsize+bride.legsize)/2+random(-2, 2), population.size());
//        population.add(child);
//      }
//    if (random(1)>.95) {
//        child=new Creature(new PVector(loc.x, loc.y), (wingsize+bride.wingsize)/2+random(-2, 2), 
//        (bellysize+bride.bellysize)/2+random(-2, 2), (legsize+bride.legsize)/2+random(-2, 2), population.size());
//        population.add(child);
//      }
//      ismoving=true;// and the partners are freed
//      bride.ismoving=true;
//      sexualmaturity=100;//they have to take a rest! If not they would procreate with their newborn...
//      bride.sexualmaturity=100;
//      startcopulationtime=0;
//      bride=null;//partners are not anymore
//    }
  }
/************************************************************************************************************************
 Here we display creature's graphics... In my implementation, some parts depends on age or sexual maturity
 , some are animated. In more complex designs, you could use different classes for different components of your creature
 , so the main code stays clear (parts classes deal with parts display/animation details)
************************************************************************************************************************/
  void display() {// creature's graphics
//    colwings=color(colwings, 10+240*sexualmaturity/300);//wings transparency will reflect sexual maturity
//    fill(colwings);
//    if (ismale)ellipse(loc.x, loc.y+bellysize*.5+legsize/3, legsize/3, sexualmaturity*legsize/150);//males have a third leg, fully grown when they are ready
//    fill(collegs);
//    ellipse(loc.x-bellysize/3, loc.y+bellysize*.5+legsize/3, legsize/3, 2*legsize);   
//    ellipse(loc.x+bellysize/3, loc.y+bellysize*.5+legsize/3, legsize/3, 2*legsize);
//    fill(colbelly);
//    ellipse(loc.x, loc.y, bellysize, bellysize);    
//    fill(colwings);
//    if (!ismale)ellipse(loc.x, loc.y, sexualmaturity*bellysize/600, sexualmaturity*bellysize/600);//females have a 'decoration', fully grown when they are ready
//    pushMatrix();
//    translate(loc.x-bellysize/4, loc.y-bellysize*.4);
//    rotate(-1.2+1.2*sin(2*frameCount/wingsize));//wings flap
//    ellipse(0, -wingsize*.8, wingsize, 2*wingsize);    
//    popMatrix();
//    pushMatrix();
//    translate(loc.x+bellysize/4, loc.y-bellysize*.4);
//    rotate(1.2-1.2*sin(2*frameCount/wingsize));//wings flap
//    ellipse(0, -wingsize*.8, wingsize, 2*wingsize);
//    popMatrix();
  }
}

