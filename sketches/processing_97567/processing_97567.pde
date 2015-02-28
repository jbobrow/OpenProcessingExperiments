
/* DEEP SPACE SEED
 * Written by James Lockrey
 * Date Created: 04/17/2013
 * Date Last Modified: 04/17/2013
 * Version: 0.1
 * 
 * REFERENCES
 *
 * TODO
 * - Delete droplets if they are out of screen bounds
 * - Allow advanced stages of the seed to perform different functions
 *   - Grow and spawn allies to help you collect water
 *   - Grow other seeds to water
 * - Allow close droplets to combine into larger ones (increasing r and using it to draw)
 * - Use a water value int for these larger droplets
 * - Add movement trails to player
 * - Add enemies that suck the water from seeds
 */

PFont font;

Droplets drop;
ArrayList<Droplet> droplets;
Player player;
Seed seed;
boolean up, down, left, right;
boolean showControls = false;

Roots[] roots;

void setup(){
  //For web compatability, no wider than 960
  size(960,540);
  smooth();
  colorMode(HSB,360,100,100,100);
  imageMode(CENTER);
  font = createFont("Calibri", 16, true);
  //Initialization
  drop = new Droplets();
  player = new Player(new PVector(width/2,height/2));
  seed = new Seed(new PVector(width/2,height/2));
  InitRoots();
}

void InitRoots(){
  roots = new Roots[0];
  for(int t = 0; t < 50; t++) {
    roots = (Roots[]) append(roots, new Roots(width/2,height/2, 15, random(100), 1));
  }
}

void draw(){
  fill(0,0,0,95);
  rect(0,0,width,height);
  drop.Run();
  seed.Update();
  player.Update();
  CreateDroplet();
  if(showControls)
    StatsBox();
}

//10% chance to create a new droplet anywhere on the screen
void CreateDroplet(){
  if(random(1) < 0.1){
    drop.AddDroplet(new Droplet(new PVector(random(width),random(height)), new PVector(random(-1,1),random(-1,1)),3,droplets));
  }
}

//Displays variables to track on screen
//TODO: construct the method so that you can add variables to track with a call
void StatsBox(){
  fill(0,0,0,60);
  rect(20,height-220,300,200);
  fill(0,0,100,100);
  text("player pos: " + (int)player.loc.x + ", " + (int)player.loc.y, 30, height-210);
  text("seed stage: " + seed.stage,30,height-190);
  text("player vel: " + (Math.round(player.vel.x * 100)/100)+ ", " + (Math.round(player.vel.y*100)/100), 30, height-170);
  text("player water: " + player.water,30,height-150);
  text("plant water: " + seed.watered,30,height-130);
  text("water droplets: " +droplets.size(),30,height-110);
  text("seed radius: " + seed.r,30,height-90);
  text("player energy: " + (int)player.energy,30, height-70);
  text("FPS: " + frameRate, 30, height-50);
}

void keyPressed(){
  //Player movement keys
  switch(key){
    case 'w': up = true; break;
    case 'a': left = true; break;
    case 's': down = true; break;
    case 'd': right = true; break;
  }
  //Player pulse ability
  if(key == ' '){
    player.pulse = true;
    player.energy -= 5;
  }
  //Show/Hide the Stats Box
  if(key == 'c'){
    showControls = !showControls;
  }
}

void keyReleased(){
  switch(key){
    case 'w': up = false; break;
    case 'a': left = false; break;
    case 's': down = false; break;
    case 'd': right = false; break;
  }
}

//Helper method to print the text of a boolean to the Stats Box
String boolToString(boolean b) {
  if(b) { 
    return "true";
  } else {
    return "false";
  }
}
class Droplet {
  PVector loc = new PVector();
  PVector vel = new PVector();
  PVector acc = new PVector();
  PVector dir = new PVector();
  int size;
  float dirmag; //Magnitude of direction of velocity
  float maxSpeed = 6.0; //Max movement speed
  float r = 5; //Unit radius
  boolean follow = false;
  ArrayList<Droplet> others; //List of other droplets to track collisions with
  int wValue = 1; //Water Value to add to player pool
  
  public Droplet(PVector l, PVector v, int _size, ArrayList<Droplet> _others){
    loc.add(l);
    vel.add(v);
    others = _others;
  }
  
  public void Update(ArrayList<Droplet> d){
    if(loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height){
      //Add object deletion code here
    }
    //If droplet is following the player, its target becomes center of player
    if(follow){
      dir = PVector.sub(player.loc, loc);
      dirmag = dir.mag();
      dir.normalize();
      dir.mult(0.3);
    } else {
      //Move in random pattern around local position
      dir = new PVector(random(-1,1),random(-1,1));
      dir.normalize();
      dir.mult(0.1);
    }
    acc = dir;
    //Movement including angular momentum, decays slowly over time
    vel.add(acc);
    vel.limit(maxSpeed);
    loc.add(vel);
    vel.mult(0.994);
    
    //Calculations come before drawing
    Render();
  }
  
  //Droplet draw method 
  public void Render(){
    fill(198,89,87,70);
    stroke(198,89,87,100);
    strokeWeight(2);
    //Trail line from the direction the droplet was travelling from
    line(loc.x,loc.y,loc.x-(vel.x*3)*r/5,loc.y-(vel.y*3)*r/5);
    noStroke();
    ellipse(loc.x, loc.y,r*wValue,r*wValue);
  }
}
//Droplets manager class, handles running and collisions
class Droplets {  
  
  Droplets() {
    droplets = new ArrayList<Droplet>();
  }
  
  void Run() {
    for(int i = 0; i < droplets.size(); i++){
      //Foreach droplet, update, and check if its colliding with others
      //If collision, remove the smaller one and add its water value to the larger
      Droplet d = droplets.get(i);
      d.Update(droplets);
      for(int j = 0; j < droplets.size(); j++){
        Droplet other = droplets.get(j);
        if(i != j && d.wValue < 3){
          if(PVector.dist(d.loc,other.loc) < d.r && !d.follow){
            d.wValue += other.wValue;
            droplets.remove(other);
          }
        }
      }
    }
  }
  
  void AddDroplet(Droplet d) {
    droplets.add(d);
  }
}
class Player {
  PVector loc = new PVector();
  PVector acc = new PVector(0,0);
  PVector vel = new PVector(0,0);
  PVector temp = new PVector();
  float r; //Player radius
  float maxSpeed = 6;
  int water = 0; //The water value of droplets following the player
  float energy = 100.0; //Diminishing player energy
  float energyLimit = 100; //Increasing energy cap
  float pulseRad = r; //Radius of pulse move
  boolean pulse = false;
  
  Player(PVector l){
    //Initialise player at center of screen
    loc.x = l.x;
    loc.y = l.y;
    
    r = 20.0;
  }
  
  public void Update(){
    //Movement code, add vectors to acceleration while key is down
    if(up) acc.add(new PVector(0,-2));
    if(down) acc.add(new PVector(0,2));
    if(left) acc.add(new PVector(-2,0));
    if(right) acc.add(new PVector(2,0));
    vel.add(acc);
    vel.limit(maxSpeed*(energy/energyLimit));
    loc.add(vel);
    if(vel.mag() < 0.1){
      vel.mult(0);
    } else {
      vel.mult(0.97);
    }
    acc.mult(0);
    
    //Energy substraction
    energy -= vel.mag()/100;
    
    //Pulsing
    if(pulse) Pulse();
    
    //Seed stage increases
    energyLimit = 100 + seed.stage*20;
    
    //Water Collection
    for(Droplet d : droplets){
      if(pulse){
        if(PVector.dist(loc,d.loc) < pulseRad && !d.follow){
          d.follow = true;
          water++;
        }
      }
      if(PVector.dist(loc,d.loc) < r && !d.follow){
        d.follow = true;
        water++;
      }
    }
    
    Borders();
    Render();
  }
  
  //Player draw method
  public void Render(){
    noStroke();
    //Opacity determined by remaining energy
    fill(125,40,100,(energy/energyLimit)*100);
    ellipse(loc.x,loc.y,r,r);
  }
  
  //Manage player moving off screen
  public void Borders(){
    if (loc.x < r) loc.x = r;
    if (loc.y < r) loc.y = r;
    if (loc.x > width) loc.x = width;
    if (loc.y > height) loc.y = height;
  }
  
  //Pulse method that expands an ellipse from player's radius
  //TODO: add the pulse from the player's position at time of pulse, instead of following
  void Pulse(){
    if(pulseRad < r+100){
      noFill();
      stroke(198,87,89,100-pulseRad/100);
      strokeWeight(2);
      ellipse(loc.x,loc.y,pulseRad,pulseRad);
      pulseRad += 5;
    } else {
      pulse = false;
      pulseRad = r;
    }
  }
}
class Seed {
  int watered = 0;
  int stage = 1; //Stages of seed development
  PVector loc = new PVector();
  float r = 30; //Initial seed radius
  float pulseR = r;
  int timer = 0;
  
  Seed(PVector l){
    loc.x = l.x;
    loc.y = l.y;
  }
  
  public void Update(){
    //Radius is determined by growth stage
    r = 30 + stage*10;
    pulseR = r;
    
    //Collision method to add droplets to seed if they are within its radius
    //TODO: find out why its eating droplets beyond its radius
    for(int i = 0; i < droplets.size(); i++){
      Droplet d = (Droplet)droplets.get(i);
      if(PVector.dist(loc,d.loc) < r/2){
        Pulse(r);
        watered += d.wValue;
        droplets.remove(d);
        if(d.follow) player.water--;
      }
    }
    //Add to player energy whilst they are within the seed
    if(PVector.dist(player.loc, loc) < r){
      player.energy += 5;
      if(player.energy > player.energyLimit) player.energy = player.energyLimit;
    }
    //Incrementing the stage based on watering
    if(stage < 12){
      stage = (int)watered/10;
    } else {
      //Completion method
      for(int i = 0; i < roots.length; i++) {
        if(!roots[i].done())
          roots[i].Run();
      }
      timer++;
      if(timer/100 == 1) 
      {
        InitRoots();
        timer = 0;
      }
    }
    
    Render();
  }
  
  //Seed drawing class
  public void Render(){
    fill(125,82,100,30);
    ellipse(loc.x,loc.y,r,r);
    fill(125,68,57,100);
    ellipse(loc.x,loc.y,0.2*r,0.2*r);
  }
  
  //Pulse whenever a droplet is added to the seed
  //TODO: ensure it works as an array of pulses so that there is one per seed
  void Pulse(float radius){
    stroke(125,68,57,100);
    noFill();
    ellipse(loc.x,loc.y,r+2,r+2);
    noStroke();
  }
}

//A roots animation (doesn't work as well as intended, relies on not redrawing the background)
class Roots {
  float X; //X coord
  float Y; //Y coord
  float rot; //rotation
  float V; //Velocity
  float tm; //Time alive
  int fm;
  
  Roots(int tX, int tY, float tfm, float trot, float tV) {
    X = tX;
    Y = tY;
    rot = trot;
    tm = tfm;
    V = tV;
  }
  
  void Run() {
    stroke(125,86,50,10);
    //Randomized movement
    V += random(-0.03, 0.03);
    tm /= 1.04;
    //Stroke size determined by time alive
    strokeWeight(tm);
    rot += random(-0.2, 0.2);
    line(X, Y, X + V*sin(rot), Y + V*cos(rot));
    line(X, Y, X + V*sin(rot), Y + V*cos(rot));
    X += V*sin(rot);
    Y += V*cos(rot);
    fm++;
    if(random(400) > 398.5-(fm/20)) {
      roots = (Roots[]) append(roots, new Roots(int(X), int(Y), tm, rot + random(-0.2, 0.2), V));
    }
  }
  
  //If lifetime > 100 refreshes, remove
  boolean done() {
    if(tm < 1.01) {
      return true;
    }else{
      return false;
    }
  }
}


