
World world;
PFont f;
void setup() {
  size(1000, 600);
  world=new World(33);
  frameRate(20);
  f=createFont("Gautami-Bold-13.vlw", 13);
}
void draw() {
  background(255);
  world.run();
  world.reproduce();
  fill(250, 20, 20);
  textFont(f);
  text("Females: " +world.getFemales(), 30, height-50);
  text("Males: " +world.getMales(), 30, height-30);
}
void mousePressed() {
  world.birth(mouseX, mouseY);
}
void keyPressed() {
  if (key=='k')
    world.kill();
}

// femrat -> color(230, 20 - 80, 130);
//meshkujt -> color(60, 50 - 130, 230);
class Bloop {
  PVector loc;
  PVector vel;
  float r, maxacc;
  float xoff, yoff;
  float health;
  color c;
  char gender;
  DNA dna;
  Bloop(DNA dna_, PVector l) {
    dna=dna_;
    loc=l.get();
    vel=new PVector(0 ,0);
    r=map(dna.genes[0], 0, 1, 20, 69);
    maxacc=map(dna.genes[0], 0, 1, 15, 2);
    xoff=random(500);
    yoff=random(500, 1500);
    health=200;
    if (dna.genes[1]<0.5) gender='F';
    else if (dna.genes[1]>=0.5) gender='M';
    float g=0;
    if (gender=='F') {
      g=map(dna.genes[2], 0, 1, 20, 80);
      c=color(230, g, 130);
    }
    else if (gender=='M') {
      g=map(dna.genes[2], 0, 1, 50, 130);
      c=color(60, g, 230);
    }
  }
  void update() {
    float ax=map(noise(xoff), 0, 1, -maxacc, maxacc);
    float ay=map(noise(yoff), 0, 1, -maxacc, maxacc);
    PVector vel=new PVector(ax, ay);
    xoff+=0.01;
    yoff+=0.01;
    loc.add(vel);
    health--;
  }
  void display() {
    stroke(c, health);
    fill(c, health);
    ellipse(loc.x, loc.y, r, r);
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
      if (d<r/2 + 5) {
        health+=50;
        food.remove(i);
      }
    }
  }
  Bloop mate(Bloop partner, float p) {
    if (gender!=partner.gender && health<150 && partner.health<150) {
      if (random(1)<p) {
        DNA childgenes=dna.crossover(partner.dna);
        childgenes.mutate(0.01);
        return new Bloop(childgenes, loc);
      }
      else if(random(1)<p+0.2){
        health+=10;
        partner.health+=10;
        return null;
      }
      else return null;
    }
    else {
      return null;
    }
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
  boolean intersect(Bloop other) {
    float d=PVector.dist(loc, other.loc);
    if (d>0 && d<r+other.r)
      return true;
    else return false;
  }
  char getGender(){
    return gender;
  }
}

class DNA{
  float[] genes;
  DNA(){
    genes=new float[3];
    for(int i=0; i<genes.length; i++){
      genes[i]=random(1);
    }
  }
  DNA(float[] newgenes){
    genes=newgenes;
  }
  void mutate(float m){
    for(int i=0; i<genes.length; i++){
      if(random(1)<m)
      genes[i]=random(1);
    }
  }
  DNA crossover(DNA partner){
    float[] child=new float[genes.length];
    for(int i=0; i<genes.length; i++){
      int n=floor(random(2));
      if(n==0) child[i]=genes[i];
      else child[i]=partner.genes[i];
    }
    return new DNA(child);
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
      stroke(229, 186, 28);
      fill(229, 186, 28);
      ellipse(f.x, f.y, 8, 8);
    }
    if(random(1)<0.015){
      food.add(new PVector(random(width), random(height)));
    }
  }
  ArrayList getFood(){
    return food;
  }
}

class Predator{
  PVector loc, vel;
  float maxspeed;
  float xoff, yoff;
  Predator(){
    loc=new PVector(random(width), random(height));
    maxspeed=13;
    xoff=random(50);
    yoff=random(50, 100);
    vel=new PVector(0, 0);
  }
  void update(){
    float vx=map(noise(xoff), 0, 1, -maxspeed, maxspeed);
    float vy=map(noise(yoff), 0, 1, -maxspeed, maxspeed);
    xoff+=0.01;
    yoff+=0.01;
    PVector v=new PVector(vx, vy);
    vel=v.get();
    loc.add(vel);
  }
  void display(){
    float theta=vel.heading2D();
    stroke(0);
    fill(20, 95, 25);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    beginShape();
    vertex(0, 0);
    vertex(30, -20);
    vertex(20, -30);
    vertex(5, -35);
    vertex(-15, -30);
    vertex(-35, 0);
    vertex(-20, 20);
    vertex(0, 30);
    vertex(10, 25);
    vertex(30, 20);
    endShape(CLOSE);
    fill(200, 20, 20);
    rect(7, -17, 10, 10);
    popMatrix();
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
  boolean eat(Bloop b){
    float d=PVector.dist(loc, b.loc);
    if(d<b.r){
      if(random(1)<0.5)
      return true;
      else return false;
    }
    else return false;
  }
}

class World {
  ArrayList<Bloop> males;
  ArrayList<Bloop> females;
  Food food;
  Predator[] predator;
  float p;
  World(int num) {
    food=new Food(num);
    males=new ArrayList<Bloop>();
    females=new ArrayList<Bloop>();
    for (int i=0; i<num; i++) {
      Bloop b=new Bloop(new DNA(), new PVector(random(width), random(height)));
      if (b.getGender()=='M')
        males.add(b);
      else
        females.add(b);
    }
    p=0.15;
    predator=new Predator[5];
    for (int i=0; i<predator.length; i++)
      predator[i]=new Predator();
  }
  void run() {
    food.run();
    for (Predator pr: predator)
      pr.run();
    for (int i=males.size()-1; i>=0; i--) {
      Bloop b=males.get(i);
      b.run();
      b.eat(food);
      if (b.dead()) {
        food.addFood(b.loc);
        males.remove(i);
      }
      for (Predator pr: predator) {
        if (pr.eat(b))
          males.remove(i);
      }
    }
    for (int i=females.size()-1; i>=0; i--) {
      Bloop b=females.get(i);
      b.run();
      b.eat(food);
      if (b.dead()) {
        food.addFood(b.loc);
        females.remove(i);
      }
      for (Predator pr: predator) {
        if (pr.eat(b))
          females.remove(i);
      }
    }
  }
  void reproduce() {
    int ml=males.size();
    int fl=females.size();
    p=map(ml+fl, 0, 100, 0.1, 0.01);
    for (int j=fl-1; j>=0; j--) {
      Bloop f=females.get(j);
      for (int i=ml-1; i>=0; i--) {
        Bloop m=males.get(i);
        if (f.intersect(m)) {
          Bloop child=f.mate(m, p);
          if (child!=null) {
            if (child.getGender()=='M')
              males.add(child);
            else if (child.getGender()=='F')
              females.add(child);
          }
        }
      }
    }
  }
  void birth(float x, float y) {
    PVector l=new PVector(x, y);
    DNA dna=new DNA();
    Bloop b=new Bloop(dna, l);
    if (b.getGender()=='F')
      females.add(b);
    else males.add(b);
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
  int getFemales() {
    return int(females.size());
  }
  int getMales() {
    return int(males.size());
  }
}

