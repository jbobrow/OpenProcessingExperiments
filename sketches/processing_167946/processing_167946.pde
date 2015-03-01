
// Author : Kyle Koopman
// 2014 June
//
// Based on the boilerplate code provided in the Nature of Code book by Dan Shiffman
// FLOG animation tweaked from Nancy Chen on OpenProcessing
// http://www.openprocessing.org/sketch/16410
//
// **NOTE
// There is a known bug in the perlin noise() function in processing JS
// http://processing-js.lighthouseapp.com/projects/41284/tickets/1736-noise-is-not-as-random-as-it-should-be.html
// which causes the values to be too localized around the origin.  This leads to overpopulation in
// this particular case as the beings don't make sweeping enough movements to interact with the
// environment
//  PLEASE DOWNLOAD THE SKETCH TO SEE IT IN ITS TRUE NATURE, with true perlin noise movement. 

/* @pjs preload="backdrop4.jpg"; */

World world;
String dnatext;

PImage b;
float eatRate;
// Settings to switch
boolean showPopulation = false;
boolean simpleGraphics = false;

void setup() {
  size(900, 800);
  world=new World(5);
  frameRate(25);
  b = loadImage("backdrop4.jpg");
  dnatext="";
  fill(0);
}

void draw() {
  if(simpleGraphics==false){
    background(b);
  } else {
    background(155);
  }
  
  world.run();
  world.reproduce();

  fill(0);
  text("Fish: " +world.getFish()+ " -   Press 'f' to generate Fish", 30, height-130);
  text("Worms: " +world.getWorms()+ " -   Press 'w' to generate Worm", 30, height-100);
  text("Cells: " +world.getCells()+ " -   Press 'c' to generate 5 Cells", 30, height-70);
  text("Viruses: " +world.getVirus()+ " -   Press 'v' to generate Virus", 30, height-40);
  text("Press 'x' to kill all beings    -  Press 's' to view SimpleMode", 30, height-16);

}

void keyPressed() {
  if (key=='k') // Kill one Agent
    world.kill();
  
  if (key=='x') // Kill all agents
    world.killAll();
    
  
  if(key=='f'){ 
    world.birthFish();
  }
  if(key=='w'){ 
   world.birthWorm();
  }
  if(key=='c'){ 
    world.birthCell();
  }
  if(key=='v'){ 
    world.birthVirus();
  }

  if(key=='s'){ // Toggle Simple graphics, or fancy 'drawn' graphics
    if(simpleGraphics==false){
      simpleGraphics=true;
    } else {
      simpleGraphics=false;
    }
  }
    
 
}


 

 

 



class Agent{
  PVector loc;
  PVector vel;
  DNA dna;
  
  //Genetic features
  String gender;
  float health, r, maxacc, maxSize, bodySize;
  float mutationRate, growthRate, birthRate, asexualRate;
  
  //Color features
  color c;
  int col1,col2,col3;
  
  // Enviroment reactions
  float scareDistance;
  float flockSize, flockTrigger;
  int stage;
  
  //Random noise variables
  float xoff, yoff; //noise start
  float xn,yn; //noise increment
  
  //Body variables
  PVector [] points;
  int bodyTemplate;
  
  String theType;
  
 Agent(DNA dna_, PVector l, int type){
    dna=dna_;

    loc=l.get();
    vel=new PVector(0 ,0);
    if(type==1){
     theType = "CLONE"; 
    } else {
     theType = "CHILD"; 
    }
    stage=0;
    
    birthRate = map(dna.genes[0],0,1,0.3,0.05);

    //Map noise to genes
    xoff=random(map(dna.genes[0],0,1,10,500)-random(40,200),map(dna.genes[0],0,1,10,500)+random(40,200));
    yoff=random(map(dna.genes[0],0,1,500,1500)-random(40,200),map(dna.genes[0],0,1,500,1500)+random(40,200));
    
    //Assign sex
    if (dna.genes[1]<0.5) gender="F";
    else if (dna.genes[1]>=0.5) gender="M";
 }
 
 void update() {

   //Position update
    vel.x = map(noise(xoff), 0, 1, -maxacc, maxacc);
    vel.y = map(noise(yoff), 0, 1, -maxacc, maxacc);
    xoff+=xn;
    yoff+=yn;
    loc.add(vel);

    this.health=this.health--;
 
    if(this.bodySize<this.maxSize){
      this.bodySize+=this.growthRate/2;
      this.stage++;
    }

  }
  
    void display() {
    pushMatrix();
     if(simpleGraphics==false){
      drawBody();
    } else {
      simpleShape();
    }
    popMatrix();

  }
  
  void drawBody(){
    
  }

  void simpleShape(){
    stroke(0);
    strokeWeight(1);
    rect(loc.x,loc.y,r,r);
  }
  
  boolean dead() {
    if (health<=0)
      return true;
    else return false;
  }
  
  void eat(Food f) {
    ArrayList<PVector> food=f.getFood();
    for (int i=food.size()-1; i>=0; i--) {
      PVector foodLocation=food.get(i);
      float d=PVector.dist(loc, foodLocation);
      if (d<r ) {
        health+=5;
        if(bodySize<maxSize){
          bodySize+=growthRate*2;
          stage++;
        }
        food.remove(i);
      }
    }
  }
  
  boolean intersect(Agent other) {
    float d=PVector.dist(loc, other.loc);
    if (d>0 && d<r+other.r){
      flockingBehaviour(other);
      return true;
    } else {
      return false;
    }
  }
  
  void flockingBehaviour(Agent other){
    // Yet to be implemented
    // TODO
  }
  
  void collision(Agent other){
    // Yet to be implemented
    // TODO 
  }

  void borders() {
    if (loc.x<-r) loc.x=width+r;
    if (loc.x>width+r) loc.x=-r;
    if (loc.y<-r) loc.y=height+r;
    if (loc.y>height+r) loc.y=-r;
  }

  void run() {
    update();
    display();
    borders();
  }

}
class Cell extends Agent {

  Cell(DNA dna_, PVector l, int type) {
    super(dna_,l,type);

    //Assign health based on genes
    health=map(dna.genes[0],0,1,200,400);
    
    //Map genes to colors
    col1 = round(map(dna.genes[1],0,1,0,245));
    col2 = round(map(dna.genes[1],0,1,0,245));
    col3 = round(map(dna.genes[1],0,1,245,0));
    
    //Assign body variables from genes
    bodyTemplate = round(map(dna.genes[0],0,1,1,6));
    r=map(dna.genes[0], 0, 1, 30, 69);

    //Speed
    maxacc=map(dna.genes[0], 0, 1, 1, 6);
    xn=map(dna.genes[0],0,1,0.002,0.01);
    yn=map(dna.genes[0],0,1,0.002,0.01);
    //Size & Growth
    bodySize = map(dna.genes[0],0,1,0.0004,0.009);
    maxSize = map(dna.genes[0],0,1,0.009,0.02);
    growthRate = map(dna.genes[0],0,1,0.00004,0.0006);
    mutationRate = map(dna.genes[1],0,1,0.05,0.01);
   
    //Enviroment reactions
    scareDistance = map(dna.genes[0],0,1,180,600);

    //Color template based on bodyTypes
    if(bodyTemplate<=2){
       c=color(col1, col3, 0);
     } else if(bodyTemplate>=3 && bodyTemplate<5) {
       c=color(0, 0, col1);
     } else {
       c=color(col3, col1, 255);
     }
  }

  void drawBody(){
    pushMatrix();
    translate(loc.x, loc.y);
    scale(bodySize);
    float angle = degrees(asin(vel.x/sqrt(pow(vel.x,2)+pow(vel.y,2))));
    if(vel.y > 0)
      angle = 180-angle;
     rotate(radians(angle));
    fill(c, map(health,0,300,10,60));
    pushMatrix();
    stroke(0);
    fill(c,map(bodySize,0,0.4,10,50));
    ellipse(0, 30, random(250,280),random(250,290));
    ellipse(0, 30, random(100,160),random(100,160));
    popMatrix(); 
    popMatrix();
    
  }

  Cell mate(Cell partner, float p, int type) {
    if(type==1){
      // Asexual reproduction / clone
      if (random(1)<=p) {
        DNA childgenes=dna.crossover(partner.dna);
        childgenes.mutate(mutationRate);
        childgenes.setSex();
        return new Cell(childgenes, loc, type);
      }
    } else {

    if (gender!=partner.gender && bodyTemplate==partner.bodyTemplate ) {
      if (random(1)<=p) {
         DNA childgenes=dna.crossover(partner.dna);
        childgenes.mutate(mutationRate);
        childgenes.setSex();
        return new Cell(childgenes, loc, type);

      } else if(random(1)>p){
        health+=2;
        partner.health+=2;
        return null;
      }
    } else {
      return null;
    }
  } return null;
  }

  void flockingBehaviour(Agent other){
   
   loc.sub(vel);
         if(bodyTemplate==other.bodyTemplate){
     
        if(bodyTemplate==1){
          if(random(1)<0.1){
            loc.add(other.vel);
            other.loc.add(vel);
          }
          
         other.loc.sub(vel);
         loc.sub(other.vel);
         vel.x = map(noise(xoff), 0, 1, -maxacc, maxacc);
          vel.y = map(noise(yoff), 0, 1, -maxacc, maxacc);
          xoff+=random(0.001,0.01);
          yoff+=random(0.001,0.01);
          loc.add(vel);
          other.loc.add(vel);
          
        } 
        
        if(bodyTemplate>=2 && bodyTemplate<=3){
          
          loc.sub(other.vel);
          other.loc.sub(vel);
          vel.x = map(noise(xoff), 0, 1, -maxacc, maxacc);
          vel.y = map(noise(yoff), 0, 1, -maxacc, maxacc);
          xoff+=random(0.001,0.01);
          yoff+=random(0.001,0.01);
          other.loc.add(vel);
          loc.add(vel);
        
        } else if(bodyTemplate>3 && bodyTemplate<=5) {
          loc.sub(other.vel);
          other.loc.add(vel);
          vel.x = map(noise(xoff), 0, 1, -maxacc, maxacc);
          vel.y = map(noise(yoff), 0, 1, -maxacc, maxacc);
          xoff+=random(0.005,0.021);
          yoff+=random(0.005,0.021);
          other.loc.add(vel);
          loc.add(other.vel);
           
        } else {
          vel.x = map(noise(xoff), 0, 1, -maxacc, maxacc);
          vel.y = map(noise(yoff), 0, 1, -maxacc, maxacc);
          xoff+=random(0.005,0.021);
          yoff+=random(0.005,0.021);
          other.loc.add(vel);
          loc.sub(other.vel);
        }
         
       other.loc.sub(vel);
   
      }  
  }
 
}
class DNA{
  float[] genes;
  String originalText;
  String type;
  
  
  DNA(String text, float seed){
    genes=new float[3];
    type="N/A";

    originalText = text;
    for(int i=0; i<genes.length; i++){
      if((seed>0)&&(seed<1)){
        if(i==1){
          genes[i]=random(1);
        } else {
          genes[i]=seed;
        }
        
      } else {
      genes[i]=random(1);}
    }

  }
  
  DNA(float[] newgenes){
    genes = newgenes;
  }
  
  
  void setSex(){
   genes[1] = random(1); 
  }
  
  String getSex(){
   if(genes[1]<0.5){
    return "F";
   } else {
    return "M";
   } 
    
  }
  void mutate(float m){
    for(int i=0; i<genes.length; i++){
      if(random(1)<m)
      genes[i]=genes[i]+map(genes[0],0,1,0.001,0.01);
    }
  }
  DNA crossover(DNA partner){
  
    float[] child=new float[genes.length];
    String theText="";
    for(int i=0; i<genes.length; i++){
      int n=floor(random(2));

      if(n==0){
        child[i]=genes[i];

      } else {
        child[i] = partner.genes[i];

      }
     
    }
    return new DNA(child);
  }
   
}
class Fish extends Agent{
  
  float[] x = new float[15];
  float[] y = new float[15];
  float segLength ;
  float opacity;
  color eyeColor;
 
 Fish(DNA dna_, PVector l, int type){
  super(dna_,l,type);
  //Assign health based on genes
    health=map(dna.genes[0],0,1,0,100);
    
    //Map genes to colors
    col1 = round(map(dna.genes[1],0,1,155,245));
    col2 = round(map(dna.genes[1],0,1,80,245));
    col3 = round(map(dna.genes[1],0,1,245,155));
    
    //Assign body variables from genes
    bodyTemplate = round(map(dna.genes[0],0,1,1,6));
    segLength = round(map(dna.genes[1],0,1,3,5));
    r=map(dna.genes[0], 0, 1,30, 60);

    //Speed
    maxacc=map(dna.genes[0],0,1,36,22);
    xn=map(dna.genes[0],0,1,0.035,0.05);
    yn=map(dna.genes[0],0,1,0.035,0.05);

    //opacity
    opacity=map(health,0,300,20,55);
    
    //Size & Growth
    bodySize = map(dna.genes[0],0,1,2,1.7);
    maxSize = map(dna.genes[0],0,1,1.7,3.5);
    growthRate = map(dna.genes[0],0,1,0.0009,0.0003);
    mutationRate = map(dna.genes[1],0,1,0.15,0.08);
    asexualRate = map(dna.genes[0],0,1,0.02,0.01);
    birthRate = map(dna.genes[0],0,1,0.15,0.05);
    
    //Enviroment reactions
    scareDistance = map(dna.genes[0],0,1,180,600);


    
    if(bodyTemplate<=2){
       c=color(col1, col3, 0);
       eyeColor = color(0,col2,0);
     } else if(bodyTemplate>=3 && bodyTemplate<5) {
       c=color(0, 0, col1);
       eyeColor = color(col1,0,0);
     } else {
       c=color(col3, col1, 255);
       eyeColor = color(0,col2,col1);
     }

 }


  void drawBody(){
   dragSegment(0,loc.x, loc.y);
    for(int i=0; i < x.length-1; i++) {
      dragSegment(i+1, x[i], y[i]);
    }
  }

 void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
 
  pushMatrix();
  translate(x[i], y[i]);
  rotate(angle);
  scale(bodySize);
  stroke(0, opacity);
  line(0, 0, segLength, 0);
  fill(col1,opacity*2);
  strokeWeight(1);
  ellipse(0,0,(x.length-i)/1.5,(x.length-i)/1.5);
  if ( i == x.length - 1 )
  {
    fill( col1  );
    noStroke();
    beginShape(TRIANGLES);
    vertex(0, 2);
    vertex(-2 * segLength, 0);
    vertex(0, -2);
    endShape();
  }
  
  if ( i == 0 )
  {

   fill(eyeColor, 70);
   pushMatrix();
   stroke(col1,opacity*3);
   scale(random(0.30,bodySize/5));
   strokeWeight(4);
   ellipse(segLength, -3, r/2, r/2);
   ellipse(segLength, 3, r/2, r/2);
   ellipse(segLength, 5, r/2, r/2);
   ellipse(segLength, -5, r/2, r/2);
   ellipse(segLength-4, -8, r/2, r/2);
   ellipse(segLength-4, 8, r/2, r/2);
   ellipse(segLength+4, 12, r/2, r/2);
   ellipse(segLength+4, -12, r/2, r/2);
   strokeWeight(1);
   stroke(0,80);
   ellipse(segLength+4, -12, 3, 3);
   ellipse(segLength+4, 12, 3, 3);
    popMatrix();
  }
  
  popMatrix();

} 

  Fish mate(Fish partner, float p) {

      if (random(1)<=p) {
      DNA childgenes=dna.crossover(partner.dna);
        childgenes.mutate(mutationRate);
        childgenes.setSex();
        return new Fish(childgenes, loc, 1);
      } else {
       return null; 
      }
    
  }

 
  
}
class Food{
  ArrayList<PVector> food;

  Food(int num){
    food=new ArrayList<PVector>();

    for(int i=0; i<num; i++){
      food.add(new PVector(random(width), random(height)));
    }
  }
  void addFood(PVector l){
    food.add(l.get());

  }
  void run(){
    for(PVector f: food){
      rectMode(CENTER);
      stroke(155);
      fill(115,115,115);
      ellipse(f.x, f.y, random(1,2),random(1,2));
      
    }
    if(random(1)<0.10){
      for(int f=0;f<2;f++){
        food.add(new PVector(random(width), random(height)));
      }
    }
  }
  ArrayList getFood(){
    return food;
  }
}
class Predator{
  PVector loc, vel,maxspeed;
 
  int appendages;
  int bodyTemplate;
  int eyes;
  float growthRate, maxSize, bodySize,eyeAngle;
  float health,health2;
  int greenShade;
  int tongue;
  int tongueChange;
  int wing;
  int wingChange;
  float angle;
  int timer;
  DNA dna;
  float xoff, yoff;
   int col1,col2;
  float eatRate;
   
  Predator(){
    dna = new DNA("", random(1));
    loc = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    maxspeed= new PVector(map(dna.genes[0],0,1,17,25),map(dna.genes[0],0,1,17,45));
    bodyTemplate = round(map(dna.genes[0],0,1,1,6));
    eyes = round(map(dna.genes[0],0,1,5,25));
    eyeAngle = map(dna.genes[0],0,1,10,45);
    bodySize = map(dna.genes[0],0,1,0.02,0.9);
    maxSize = map(dna.genes[0],0,1,1,1.5);
   
    growthRate = map(dna.genes[0],0,1,0.0005,0.002);
    health=map(dna.genes[0],0,1,70,100);
    xoff=random(50);
    yoff=random(50, 100);
    greenShade = 50+round(map(dna.genes[0],0,1,1,100));
    tongue = round(map(dna.genes[0],0,1,5,15));
    tongueChange =round(map(dna.genes[0],0,1,3,10));
    wing = 0;
    wingChange = 5;
    angle = round(map(dna.genes[0],0,1,-45,45));
     
    timer = 0;
    
  }
  void update(){
     wing += wingChange;
    if(wing > 10 || wing < -10)
      wingChange *= -1;
    tongue += tongueChange;
    if(abs(tongue) > 15)
      tongueChange *= -1;
    float vx=map(noise(xoff), 0, 1, -maxspeed.x, maxspeed.x);
    float vy=map(noise(yoff), 0, 1, -maxspeed.y, maxspeed.y);
    xoff+=0.01;
    yoff+=0.01;
    PVector v=new PVector(vx, vy);
    vel=v.get();
    loc.add(vel);
    health--;
    if(bodySize<maxSize){
     bodySize=bodySize+growthRate; 
    }
    health2 = map(health,0,20000,15,65);
  }
  
  
  void display() {
    timer++;
    if(simpleGraphics==false){
      pushMatrix();

    angle = degrees(asin(vel.x/sqrt(pow(vel.x,2)+pow(vel.y,2))));
    if(vel.y > 0)
      angle = 180-angle;

    pushMatrix();
    translate(loc.x, loc.y);
    
    rotate(radians(angle));
    scale(bodySize);
   
    drawShadow();
    drawTongue();
    //drawTail();
    drawLeg(true);
    drawLeg(false);
    drawBody();
    drawEyes();

    popMatrix();
    popMatrix();
    } else {
      stroke(0);
      fill(0);
      rect(loc.x,loc.y,bodySize*60,bodySize*60);
    }
    
    
    
  }
   
  void drawShadow() {
    noStroke();
    for(int i=0; i<15; i++) {
      fill(0,2);
      ellipse(0, 10, 40+4*i, 50+4*i);
    }
  }
   
  void drawTongue() {
    noFill();
    stroke(204, 102, 204,50);
    strokeWeight(10);
    line(0,-45,tongue,-55);
    stroke(0);
    strokeWeight(1);
    line(5,-45,tongue,-54);
  }
   
  void drawTail() {
    triangle(-5, 50, 0, 70, 5, 50);
  }
   
  void drawLeg(boolean isLeft) {
    stroke(0, greenShade, 0);
    fill(0, greenShade, 0,health2);
    int m = (isLeft) ? -1:1;
     
    pushMatrix();
    rotate(radians(m*wing));
    beginShape();
    curveVertex(m*10, 50);
    curveVertex(m*35, 20);
    curveVertex(m*60, 15);
    curveVertex(m*20, 45);
    curveVertex(0, 0);
    endShape();
     
    beginShape();
    curveVertex(m*20, 45);
    curveVertex(m*20, 45);
    curveVertex(m*50, 70);
    curveVertex(m*10, 48);
    curveVertex(m*10, 50);
    endShape();
    popMatrix();
  }
   
  void drawBody() {
    stroke(0, greenShade, 0);
    fill(0, greenShade, 0,health2);
    ellipse(0, 0, random(80,85), random(100,110));
  }
   
  void drawEyes() {
    int eye = eyes;
    if(timer%50>0 && timer%50<10) {
      ellipse(-35, -20, eye, eye);
      ellipse(35, -20, eye, eye);
    }
    else {
      fill(255);
      ellipse(-35, -20, eye, eye);
      ellipse(35, -20, eye, eye);
      fill(0,health2);
      ellipse(-35, -23, eye/2, eye/2);
      ellipse(35, -23, eye/2, eye/2);
      fill(0, greenShade, 0, health2);
      arc(-35, -20, eye, eye, 0, PI);
      arc(35, -20, eye, eye, 0, PI);
    }
  }

  void borders(){
    if(loc.x<-200) loc.x=width+200;
    if(loc.x>width+200) loc.x=-200;
    if(loc.y>height+200) loc.y=-200;
    if(loc.y<-200) loc.y=height+200;
  }
  void run(){
    update();
    display();
    borders();
  }
  
  boolean eat(Agent b){
    float d=PVector.dist(loc, b.loc);
    if(d<b.r){
      
    
        health+=50;
        if(bodySize<maxSize){
          bodySize+=growthRate;
        }
        
        return true;
     
     
    }
    else return false;
  }
}


















class Virus extends Agent {
  
  int bodyRotation, bodyRotationInc, appendages, eyes;

  Virus(DNA dna_, PVector l, int type) {
    super(dna_,l,type);
   
    //Assign health based on genes
    health=map(dna.genes[0],0,1,6000,4000);
    
    //Map genes to colors
    col1 = round(map(dna.genes[1],0,1,0,245));
    col2 = round(map(dna.genes[1],0,1,0,245));
    col3 = round(map(dna.genes[1],0,1,245,0));
    
    //Assign body variables from genes
    bodyTemplate = round(map(dna.genes[0],0,1,1,6));
    bodyRotationInc = round(map(dna.genes[0],0,1,22,12));
    bodyRotation = round(map(dna.genes[0],0,1,60,360));
    appendages = round(map(dna.genes[0],0,1,2,66));
    r=map(dna.genes[0], 0, 1, 30, 69);

    //Speed
    maxacc=map(dna.genes[0], 0, 1, 2, 4);
    xn=map(dna.genes[0],0,1,0.001,0.01);
    yn=map(dna.genes[0],0,1,0.001,0.01);

    //Size & Growth
    bodySize = map(dna.genes[0],0,1,0.03,0.05);
    maxSize = map(dna.genes[0],0,1,0.05,0.2);
    growthRate = map(dna.genes[0],0,1,0.0005,0.0009);
    mutationRate = map(dna.genes[1],0,1,0.15,0.10);
    birthRate = map(dna.genes[0],0,1,0.4,0.2);
    asexualRate = map(dna.genes[0],0,1,0.008,0.005);
    //Enviroment reactions
    scareDistance = map(dna.genes[0],0,1,180,600);

    
    if(bodyTemplate<=2){
       c=color(col1, col3, 0);
     } else if(bodyTemplate>=3 && bodyTemplate<5) {
       c=color(0, 0, col1);
     } else {
       c=color(col3, col1, 255);
     }

    points = constructBody();

  }
  
  

  PVector[] constructBody(){
    PVector[] points = new PVector[appendages];
    
    boolean oper = true;
    for(int px = 0; px<appendages;px++){
      float newX=0;
      float newY=0;
      
      
      if(bodyTemplate<=2){
      if(oper==true){
       oper = false; 
       newX = newX+sin(newX+eyes+(px*100))*col1; 
       newY = newY+sin(newY-(eyes*appendages)-(px*100))*col1;     
      } else {
        oper = true;
        newX = newX-sin(newX+eyes+(px*100))*col1;  
        newY = newY-sin(newY-(eyes*appendages)-(px*100))*col1;    
      }
      } else if((bodyTemplate>2)&&(bodyTemplate<=4)){ 
        if(oper==true){
       oper = false; 
       newX = newX+sin(px*col1)*100; 
       newY = newY-sin((eyes*appendages)-(px)*col1)*100;     
      } else {
        oper = true;
        newX = newX-sin(newX+eyes+(px*100))*col1;  
        newY = newY-sin(newY-(eyes*appendages)-(px*100))*col1;    
      }
      } else if((bodyTemplate>4)&&(bodyTemplate<=6)){
       
         if(oper==true){
       oper = false; 
       newX = newX+sin(bodyTemplate*maxacc-appendages*px*col1-col2)*100; 
       newY = newY-sin(bodyTemplate*maxacc+(appendages-px)*(col1-col1))*100;     
        } else {
        oper = true;
        newX = newX-sin(newX+eyes+(px*100)*col1+maxacc)*100;  
        newY = newY-sin(bodyTemplate*col1-maxacc+(appendages-px)*(col1-col1))*100;    
        }
      }else {
         if(oper==true){
       oper = false; 
       newX = newX+sin(appendages*px*col1-col2)*100; 
       newY = newY-sin(appendages-px*(col1-col1))*100;     
        } else {
        oper = true;
        newX = newX-sin(newX+eyes+(px*100))*col1;  
        newY = newY-sin(newY-(eyes*appendages)-(px*100))*col1;    
      }
      }
      
      points[px] = new PVector(newX+random(10,20),newY+random(10,20));

    }
   
    return points;

  }
  
 
  void drawBody(){

    pushMatrix();
    translate(loc.x, loc.y);
    
    scale(bodySize);
    float angle = degrees(asin(vel.x/sqrt(pow(vel.x,2)+pow(vel.y,2))));
    if(vel.y > 0)
      angle = 180-angle;
     rotate(radians(angle));
    
    fill(c,map(health,0,10000,1,23));
    pushMatrix();
    strokeWeight(0);
    stroke(0,map(bodySize,0,1,45,8));
   
    for(int rot=0;rot<bodyRotation;rot=rot+bodyRotationInc){
     beginShape(); 
     rotate(radians(rot));
      for(int a=0;a<points.length;a++){
         vertex(points[a].x,points[a].y);
      }
      endShape(CLOSE);
    }

    popMatrix();
    popMatrix();
    
  }

  
  Virus mate(Virus partner, float p) {
      if (random(1)<=p) {
      DNA childgenes=dna.crossover(partner.dna);
        childgenes.mutate(mutationRate);
        childgenes.setSex();
        return new Virus(childgenes, loc, 1);
      } else {
       return null; 
      }
  }

  boolean intersect(Virus other) {
    float d=PVector.dist(loc, other.loc);
  
    if (d>0 && d<r+other.r){
       loc.sub(vel);
         if(bodyTemplate==other.bodyTemplate){
     
        if(bodyTemplate==1){
          if(random(1)<0.1){
            loc.add(other.vel);
            other.loc.add(vel);
          }
          
         other.loc.sub(vel);
         loc.sub(other.vel);
         vel.x = map(noise(xoff), 0, 1, -maxacc, maxacc);
          vel.y = map(noise(yoff), 0, 1, -maxacc, maxacc);
          xoff+=random(0.001,0.01);
          yoff+=random(0.001,0.01);
          loc.add(vel);
          other.loc.add(vel);
          
        } 
        
        if(bodyTemplate>=2 && bodyTemplate<=3){
          
          loc.sub(other.vel);
          other.loc.sub(vel);
          vel.x = map(noise(xoff), 0, 1, -maxacc, maxacc);
          vel.y = map(noise(yoff), 0, 1, -maxacc, maxacc);
          xoff+=random(0.001,0.01);
          yoff+=random(0.001,0.01);
          other.loc.add(vel);
          loc.add(vel);
        
        } else if(bodyTemplate>3 && bodyTemplate<=5) {
          loc.sub(other.vel);
          other.loc.add(vel);
          loc.add(vel);
          vel.x = map(noise(xoff), 0, 1, -maxacc, maxacc);
          vel.y = map(noise(yoff), 0, 1, -maxacc, maxacc);
          xoff+=random(0.005,0.021);
          yoff+=random(0.005,0.021);
          other.loc.add(vel);
          loc.add(other.vel);
           
        } else {
          vel.x = map(noise(xoff), 0, 1, -maxacc, maxacc);
          vel.y = map(noise(yoff), 0, 1, -maxacc, maxacc);
          xoff+=random(0.005,0.021);
          yoff+=random(0.005,0.021);
          other.loc.add(vel);
          loc.sub(other.vel);
        }
         
       other.loc.sub(vel);
      
       
    
      } 
      
    return true;
     
      
    } else {
      
      return false;
    }
      
    
  }
  
  
  
}
class World {
  ArrayList<Cell> males;
  ArrayList<Cell> females;
  ArrayList<Virus> viruses;
  ArrayList<Fish> fishes;
  ArrayList<Worm> worms;
  int[] bodyCount;
  Predator[] predator;
  Food food;

  float p;

  World(int num) {
    bodyCount = new int[6];
    food=new Food(num*2);
    males=new ArrayList<Cell>();
    females=new ArrayList<Cell>();
    viruses=new ArrayList<Virus>();
    fishes=new ArrayList<Fish>();
    worms=new ArrayList<Worm>();

    for (int i=0; i<5; i++) {
      DNA d = new DNA("", random(1));
      Cell b = new Cell(d, new PVector(random(width), random(height)), 2);
      if (b.gender=="M") {
       males.add(b);
      } else {
       females.add(b);
      }
    }

    p=0.25;
    predator=new Predator[5];
    for (int i=0; i<predator.length; i++)
      predator[i]=new Predator();

    for (int i=0;i<num;i++) {
      if(i<6)
        bodyCount[i]=0;
      DNA d = new DNA("", random(1));
      Virus v=new Virus(d, new PVector(random(width), random(height)), 2);
      Fish f=new Fish(d, new PVector(random(width), random(height)), 2); 
      Worm w=new Worm(d, new PVector(random(width), random(height)), 2); 

      viruses.add(v);
      worms.add(w);
      fishes.add(f);
    }
  }    

  void run() {
    
    for (Predator pr: predator)
      pr.run();
      
   float vrate = map(viruses.size(),0,40,0.001,0.70);
   float frate = map(fishes.size(),0,40,0.06,0.99);
   float wrate = map(worms.size(),0,40,0.01,0.60);
  
    food.run();

    for (int i=viruses.size()-1;i>=0;i--) {
      
      Virus v = viruses.get(i);
      v.run();
      v.eat(food);
      if (v.dead()==true) {
        food.addFood(v.loc);
        viruses.remove(i);
      }
      for (Predator pr: predator) {
        if(random(1)<vrate){
          if (pr.eat(v)==true) {
            viruses.remove(i);
          }
        }
      }
    }

    for (int i=fishes.size()-1;i>=0;i--) {
      Fish f = fishes.get(i);
      f.run();
      f.eat(food);
      if (f.dead()==true) {
        food.addFood(f.loc);
        fishes.remove(i);
      }
      for (Predator pr: predator) {
        if(random(1)<frate){
          if (pr.eat(f)==true) {
            fishes.remove(i);
          }
        }
      }
    }

    for (int i=worms.size()-1;i>=0;i--) {
      Worm w = worms.get(i);
      w.run();
      w.eat(food);
      if (w.dead()==true) {
        food.addFood(w.loc);
        worms.remove(i);
      }
      for (Predator pr: predator) {
        if(random(1)<wrate){
          if (pr.eat(w)==true) {
            worms.remove(i);
          }
        }
      }
      
    }
    
    for (int i=females.size()-1; i>=0; i--) {
      Cell b=females.get(i);
      b.run();
      b.eat(food);
      if (b.dead()==true) {
        food.addFood(b.loc);
        females.remove(i);
      }
      for (Predator pr: predator) {
        if (pr.eat(b)==true) {
          females.remove(i);
        }
      }
    }

    for (int i=males.size()-1; i>=0; i--) {
      Cell b=males.get(i);
      b.run();
      b.eat(food);
      if (b.dead()==true) {
        food.addFood(b.loc);
        males.remove(i);
      }
      for (Predator pr: predator) {
        if (pr.eat(b)==true) {
          males.remove(i);
        }
      }
    }


  }

  void getBodyCount(Agent f) {
    if (f.bodyTemplate==1) {
      bodyCount[0] = bodyCount[0]+1;
    }
    if (f.bodyTemplate==2) {
      bodyCount[1] = bodyCount[1]+1;
    }
    if (f.bodyTemplate==3) {
      bodyCount[2] = bodyCount[2]+1;
    }
    if (f.bodyTemplate==4) {
      bodyCount[3] = bodyCount[3]+1;
    }
    if (f.bodyTemplate==5) {
      bodyCount[4] = bodyCount[4]+1;
    }
    if (f.bodyTemplate==6) {
      bodyCount[5] = bodyCount[5]+1;
    }
  }


  void reproduce() {

    int ml=males.size();
    int fl=females.size();
    int v = viruses.size();
    int f = fishes.size();
    int w = worms.size();

    for (int j=fl-1; j>=0; j--) {
      Cell fe=females.get(j);
      getBodyCount(fe);
    }

    for (int j=ml-1; j>=0; j--) {
      Cell ma=males.get(j);
      getBodyCount(ma);
    }
    
    float pt = random(0.90, 0.60);
    
    //VIRUS REPRODUCTION
    //ASEXUAL REPRODUCTION
      for (int j=v-1; j>=0; j--) {
        Virus vi=viruses.get(j);
        if (random(1)<vi.asexualRate) {
        if (vi.stage>100) {
          if (vi.health>=600) {
            Virus child=vi.mate(vi, vi.birthRate);
            if (child!=null) {
                viruses.add(child);
            }
          }
        }
      }
    }
    
    for (int j=f-1; j>=0; j--) {
        Fish fi=fishes.get(j);
        if (random(1)<fi.asexualRate) {
        if (fi.stage>100) {
            Fish child=fi.mate(fi, fi.birthRate);
            if (child!=null) {
                fishes.add(child);
            }
        }
      }
    }
    
    //WORM REPRODUCTION
    //ASEXUAL REPRODUCTION
      for (int j=w-1; j>=0; j--) {
        Worm wo=worms.get(j);
        
        if (random(1)<wo.asexualRate) {
            Worm child=wo.mate(wo,wo.birthRate);
            if (child!=null) {
                worms.add(child);
            }
       }
    }

    if (random(1)<0.01) {
      //ASEXUAL REPRODUCTION
      for (int j=fl-1; j>=0; j--) {
        Cell fe=females.get(j);
        if (fe.stage>80) {
          if (fe.health>=30 && fe.health<=50) {

            Cell child=fe.mate(fe, pt, 1);
            if (child!=null) {
              if (child.gender=="M")
                males.add(child);
              else if (child.gender=="F")
                females.add(child);
            }
          }
        }
      }

      // ASEXUAL REPRODUCTION
      for (int i=ml-1; i>=0; i--) {
        Cell ma=males.get(i);
        if (ma.stage>80) {
          if (ma.health>=30 && ma.health<=50) {
            Cell child=ma.mate(ma, pt, 1);
            if (child!=null) {
              if (child.gender=="M")
                males.add(child);
              else if (child.gender=="F")
                females.add(child);
            }
          }
        }
      }
    }

    p=map(ml+fl, random(2), random(350, 400), 0.70, 0.15);
    for (int j=fl-1; j>=0; j--) {
      Cell fe=females.get(j);
      if (fe.bodyTemplate<=7) {
        if (fe.stage>80) {
          if (fe.health>=map(fe.dna.genes[0], 0, 1, 10, 26) && fe.health<=map(fe.dna.genes[0], 0, 1, 50, 66)) {
            Cell child=fe.mate(fe, p, 1);
            if (child!=null) {
              if (child.gender=="M")
                males.add(child);
              else if (child.gender=="F")
                females.add(child);
            }
          }
        }
      }
      for (int i=ml-1; i>=0; i--) {
        Cell ma=males.get(i);
        if (ma.bodyTemplate<=7) {
          if (ma.stage>80) {
            if (ma.health>=map(ma.dna.genes[0], 0, 1, 10, 25) && ma.health<=map(ma.dna.genes[0], 0, 1, 50, 66)) {
              Cell child=ma.mate(ma, p, 1);
              if (child!=null) {
                if (child.gender=="M")
                  males.add(child);
                else if (child.gender=="F")
                  females.add(child);
              }
            }
          }
        }
        if (fe.intersect(ma)) {
          Cell child=fe.mate(ma, p, 2);
          if (child!=null) {
            if (child.gender=="M")
              males.add(child);
            else if (child.gender=="F")
              females.add(child);
          }
        }
      }
    }
  }


  void birthVirus() {
    float dnaSeed=random(1);
    PVector l=new PVector(random(width),random(height));
    DNA dna=new DNA("virus-"+dnaSeed, dnaSeed);
    Virus v=new Virus(dna, l, 1);
    viruses.add(v);
  }
  void birthFish() {
    float dnaSeed=random(1);
    PVector l=new PVector(random(width),random(height));
    DNA dna=new DNA("virus-"+dnaSeed, dnaSeed);
    Fish f=new Fish(dna, l, 1);
    fishes.add(f);
  }
  void birthCell() {
    for(int i=0;i<5;i++){
      float dnaSeed=random(1);
      PVector l=new PVector(random(width),random(height));
      DNA dna=new DNA("virus-"+dnaSeed, dnaSeed);
      Cell c=new Cell(dna, l, 1);
      if(c.gender=="F"){
        females.add(c);
      } else {
       males.add(c); 
      }
    }
  }
  void birthWorm() {
    float dnaSeed=random(1);
    PVector l=new PVector(random(width),random(height));
    DNA dna=new DNA("virus-"+dnaSeed, dnaSeed);
    Worm w=new Worm(dna, l, 1);
    worms.add(w);
  }


  

  void kill() {
    if (random(1)<0.5) {
      int n=int(random(males.size()));
      males.remove(n);
    }
    else {
      int n=int(random(females.size()));
      females.remove(n);
    }
  }

  void killAll() {
    males.clear();
    females.clear();
    viruses.clear();
    fishes.clear();
    worms.clear();
  }

  void getStrains(int listSize) {
    int pos=0;
    if (females.size()>1) {
      for (int i=females.size()-1; i>=0; i--) {
        Cell b = females.get(i);
        String s;
        pos++;
        if (b.bodyTemplate<=2) {
          s = "Asexual";
        } 
        else {
          s = "Sexual";
        }
        text(b.theType+ "  | " +b.bodyTemplate+" | "+(b.dna.genes[0]*500000) + " | SEX : F", 10, pos*15);
      }
      pos=0;
      for (int i=males.size()-1; i>=0; i--) {
        Cell b = males.get(i);
        String s;
        pos++;
        if (b.bodyTemplate<=2) {
          s = "Asexual";
        } 
        else {
          s = "Sexual";
        }
        text(b.theType+ "  |  " +b.bodyTemplate+" | "+(b.dna.genes[0]*500000) + " | SEX : M", width-200, pos*15);
      }
    }
  }

  int getFemales() {
    return int(females.size());
  }
  int getMales() {
    return int(males.size());
  }
   int getFish() {
    return int(fishes.size());
  }
  int getVirus() {
    return int(viruses.size());
  }
   int getCells() {
    return int(females.size()+males.size());
  }
  int getWorms() {
    return int(worms.size());
  }
}

class Worm extends Agent{
  
  float[] x = new float[15];
  float[] y = new float[15];
  float segLength ;
  float opacity;
 
 Worm(DNA dna_, PVector l, int type){
  super(dna_,l,type);
  //Assign health based on genes
    health=map(dna.genes[0],0,1,0,80);
    
    //Map genes to colors
    col1 = round(map(dna.genes[1],0,1,0,245));
    col2 = round(map(dna.genes[1],0,1,0,245));
    col3 = round(map(dna.genes[1],0,1,245,0));
    
    //Assign body variables from genes
    bodyTemplate = round(map(dna.genes[0],0,1,1,6));
    segLength = round(map(dna.genes[0],0,1,7,4));
    r=map(dna.genes[0], 0, 1, 30, 69);

    //Speed
    maxacc=map(dna.genes[0],0,1,14,25);
    xn=map(dna.genes[0],0,1,0.015,0.02);
    yn=map(dna.genes[0],0,1,0.015,0.02);
    //opacity
    opacity=map(health,0,150,89,40);
    
    //Size & Growth
    bodySize = map(dna.genes[0],0,1,0.3,0.6);
    maxSize = map(dna.genes[0],0,1,0.65,2.2);
    growthRate = map(dna.genes[0],0,1,0.0008,0.001);
    mutationRate = map(dna.genes[1],0,1,0.15,0.05);
    asexualRate = map(dna.genes[0],0,1,0.005,0.01);
    birthRate = map(dna.genes[0],0,1,0.2,0.1);
    //Enviroment reactions
    scareDistance = map(dna.genes[0],0,1,180,600);

    
    if(bodyTemplate<=2){
       c=color(col1, col3, 0);
     } else if(bodyTemplate>=3 && bodyTemplate<5) {
       c=color(0, 0, col1);
     } else {
       c=color(col3, col1, 255);
     }

 }

  void drawBody(){
    if(bodyTemplate<=2){
      fill(col1,opacity*2);
    } else if(bodyTemplate>=3 && bodyTemplate<5) {
      
    } else {
      fill(col1,opacity/2);
      strokeWeight(0);
      ellipse(loc.x,loc.y,18,13);
    }
     dragSegment(0,loc.x, loc.y);
    for(int i=0; i < x.length-1; i++) {
      dragSegment(i+1, x[i], y[i]);
    }
   
  }

 void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
 
  
  pushMatrix();
  translate(x[i], y[i]);
  rotate(angle);
  scale(bodySize);
  color c;
  
  if ( i % 3 == 1 )
    c = color(col1, col1, col1);
  else if ( i % 3 == 2 )
    c = color(col2, col1, 0);
  else
    c = color(0, 0, 0);

  stroke( c , opacity);
  strokeWeight(2);
  fill(c, opacity);
  line(0,0,segLength,0);
  if(bodyTemplate<=2){
    ellipse(0, 0, 4, 4);
  } else if(bodyTemplate>=3 && bodyTemplate<5) {
    ellipse(0,0, 4,3);
    line(segLength+2-i,14-i,segLength+2,2);
    line(segLength-i,12-i,segLength,0);
    line(-segLength+i,-12+i,segLength,0);
    line(-segLength-2-i,10-i,-segLength-2,-2);
  } else {
    strokeWeight(2);
    line(segLength+2-i,14-i,segLength+2,2);
    line(segLength-i,12-i,segLength,0);
    line(-segLength+i,-12+i,segLength,0);
    line(-segLength-2-i,10-i,-segLength-2,-2);
  }
  noStroke();
  popMatrix();
} 

  Worm mate(Worm partner, float p) {

      if (random(1)<=p) {
      DNA childgenes=dna.crossover(partner.dna);
        childgenes.mutate(mutationRate);
        childgenes.setSex();
        return new Worm(childgenes, loc, 1);
      } else {
       return null; 
      }
  }
}


