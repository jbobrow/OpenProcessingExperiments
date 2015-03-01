
/*
this skecth is based on Craig Reynold's Boids program, one of the examples on processing.org.
I have some ideas how to use this for somekind of game or simulation. 
*/
Flock flock;
float maxSSp, maxSRot, maxSHp, maxSdmg, maxSsize;
float maxWSp, maxWRot, maxWHp, maxWdmg, maxWsize;
float maxASp, maxARot, maxAHp, maxAdmg, maxAsize;
float mapX,mapY;
float CamPosX,CamPosY,CamPosZ;
float CamAngle, mX, mY, mW;
boolean follow = false;
boolean info = true;
boolean fear = false;
boolean smellpath = false;
boolean spawnSheep = false;
boolean spawnWolf = false;
boolean spawnDeer = false;
PFont f;

int gh, gm;
int h,m,s,ms,gms;
float sun;

int SheepID, WolfID, DeerID;
int Type;

int timeAngle = 0;
 
void setup()
{
 size(800,600, P3D);
 frameRate(60);
 
 gh = 8;
 timeAngle = gh * 15;
 
 flock = new Flock();
  
 maxSSp = 1.0f;
 maxSRot = 0.05f;
 maxSHp = 100.0f;
 maxSsize = 10.0f;
 maxSdmg = 5.0f;
  
 maxWSp = 1.5f;
 maxWRot = 0.06f;
 maxWHp = 200.0f;
 maxWsize = 10.0f;
 maxWdmg = 100.0f;
 
 maxASp = 1.0f;
 maxARot = 0.05f;
 maxAHp = 150.0f;
 maxAsize = 15.0f;
 maxAdmg = 50.0f;
 
 WolfID = 0;
 SheepID = 0;
 DeerID = 0;
 
 mapX = 4000;
 mapY = 4000;
 randomSeed(123456);
 
 CamPosX = 0;
 CamPosY = 0;
 CamPosZ = 500;
 CamAngle = -100;
 
 f = createFont("Arial",16,true);
  
// adds first sheeps
 for (int i = 0; i < 5; i++){
   for (int j = 0; j < 5; j++) {
     SheepID += 1;
     Type = 1;
  flock.addSheep(new Animal(new PVector(random(-mapX/2,mapX/2),random(-mapY/2, mapY/2)),maxSSp,maxSRot,maxSHp,maxSdmg, maxSsize, false, SheepID, Type));
   }
 }
 // adds first wolves
 for (int i = 0; i < 5; i++){
   for (int j = 0; j < 1; j++) {
     WolfID += 1;
     Type = 2;
      flock.addWolf(new Animal(new PVector(random(-mapX/2,mapX/2),random(-mapY/2, mapY/2)),maxWSp,maxWRot,maxWHp, maxWdmg, maxWsize, false, WolfID, Type));
   }
 }
// add grass
for (int i = 0; i < 25; i++){
   flock.addTussock(new Tussock(new PVector(random(-mapX/2,mapX/2),random(-mapY/2, mapY/2)),random(60,120)));
 }
 // add stones
for (int i = 0; i < 25; i++){
   flock.addStone(new Stone(new PVector(random(-mapX/2,mapX/2),random(-mapY/2, mapY/2)),random(10,30)));
 }
 
 smooth();
}
 
void draw()
{ 
  background(0);
  time();
  light();
  flock.run();
  
  
 // if(frameCount % 2 == 0) {
    if (info) {
    pushMatrix();
    camera();
    translate(150,130,200);
    fill(255);
    noStroke();
    text(frameRate, 20,20);
    text("Sheep: " + flock.sheeps.size(), 20,30);
    text("Wolves: " + flock.wolfs.size(), 20,40);
    text("CamX: " + CamPosX, 20, 50);
    text("CamY: " + CamPosY, 20, 60);
    //text("CamZ: " + CamPosZ, 20, 70);
    text("gametime: " + gh + ":" + gm, 20, 80);
    //text("realtime: " + h + ":" + m + ":" + s, 20, 90);
    //text("sun: " + sun, 20,100);
    //text("ta: " + timeAngle,20,110);
    popMatrix();
    }
 // }

  
  pushMatrix();
  noStroke();
  fill(20,100,10);
  translate(0,0,-1.5);
  rect(-mapX/2,-mapY/2,mapX,mapY);
  popMatrix();
  
  if (CamPosX >= -mapX/2) {
    if (mouseX <= 50) {
      CamPosX -= 10;
    } 
  }
  if (CamPosX <= mapX/2) {
    if (mouseX >= width - 50) {
      CamPosX += 10;
    } 
  }
   if (CamPosY >= -mapY/2) {
    if (mouseY <= 50) {
      CamPosY -= 10;
    } 
  }
  if (CamPosY <= mapY/2) {
    if (mouseY >= height - 50) {
      CamPosY += 10;
    } 
  }
  
  CamPosZ += mW * 20;
  CamAngle += mW * 3;
  
  if (CamPosZ >= 500) {
    CamPosZ = 500;
  }
  if (CamPosZ <= 100) {
    CamPosZ = 100;
  }
  
  if (CamAngle <= -100) CamAngle = -100;
  if (CamAngle >= -50) CamAngle = -50;
  
  mX = mouseX - width/2;
  mY = mouseY - height/2;
  
  camera(CamPosX,CamPosY,CamPosZ,
        CamPosX,CamPosY + CamAngle, 0,
        0, 1, 0);
        
  mW = 0;
}
 
void mousePressed()
{
  if (spawnSheep) {
    SheepID += 1;
    Type = 1;
    flock.addSheep(new Animal(new PVector(mX + CamPosX, mY + CamPosY + CamAngle),maxWSp,maxWRot,maxWHp,maxWdmg,maxWsize, false, SheepID, Type));
  }
  if (spawnWolf) {
    WolfID += 1;
    Type = 2;
    flock.addWolf(new Animal(new PVector(mX + CamPosX, mY + CamPosY + CamAngle),maxWSp,maxWRot,maxWHp,maxWdmg,maxWsize, false, WolfID, Type));
  }
  if (spawnDeer) {
    DeerID += 1;
    Type = 3;
    flock.addDeer(new Animal(new PVector(mX + CamPosX, mY + CamPosY + CamAngle),maxASp,maxARot,maxAHp,maxAdmg,maxAsize, false, DeerID, Type));
  }
}

void mouseWheel(MouseEvent event) 
{
  mW = event.getCount();
  //println(mW);
}

void keyPressed()
{
 if (key == 'i') info = !info;
 
 if (key == 'o') smellpath = !smellpath;
  
 if (key == 'f') {
   follow = !follow;
   fear = false;
 }
  
 if (key == 'h') {
   fear = !fear;
   follow = false;
 }
  
  if (key == 's') {
   spawnSheep = !spawnSheep;
   spawnWolf = false;
   spawnDeer = false;
 }
  
 if (key == 'w') {
   spawnWolf = !spawnWolf;
   spawnSheep = false;
   spawnDeer = false;
 } 
 if (key == 'a') {
   spawnDeer = !spawnDeer;
   spawnSheep = false;
   spawnWolf = false;
 } 
}
  
  
// flock class -----------------
class Flock {
  
   ArrayList sheeps;
   ArrayList wolfs;
   ArrayList tussocks;
   ArrayList stones;
   ArrayList smell;
   ArrayList smell2;
   ArrayList deers;
   ArrayList enemy;
   
   PVector mouse;
   
   Flock() {
     sheeps = new ArrayList();
     tussocks = new ArrayList();
     wolfs = new ArrayList();
     stones = new ArrayList();
     smell = new ArrayList();
     smell2 = new ArrayList();
     deers = new ArrayList();
     enemy = new ArrayList();
   }
   
   void run() {
 
      for (int i = 0; i < sheeps.size(); i++)
      {
         Animal s = (Animal) sheeps.get(i);

         s.run(sheeps, tussocks, wolfs, smell);
         if (s.dead) {
            if (random(1000) > 995) removeSheep(s); 
         }
         if (s.reproduce) {
           SheepID += 1;
           Type = 1;
           addSheep(new Animal(new PVector(s.pos.x,s.pos.y),maxSSp,maxSRot,maxSHp, maxSdmg, maxSsize, true, SheepID, Type));
           s.reproduce = false;
         }
      }
      
      for (int j= 0; j < tussocks.size(); j++)
         {
            Tussock t = (Tussock) tussocks.get(j);
            t.run();
      }
       
      for (int k= 0; k < wolfs.size(); k++)
         {
            Animal w = (Animal) wolfs.get(k);
            w.run(wolfs,sheeps,enemy,smell2);
             
            if (w.dead) removeWolf(w);
            
            if (w.reproduce) {
              WolfID += 1;
              Type = 2;
             addWolf(new Animal(new PVector(w.pos.x,w.pos.y),maxWSp,maxWRot,maxWHp,maxWdmg, maxWsize,true, WolfID, Type));
             w.reproduce = false;
           }
      }
      
      for (int l= 0; l < stones.size(); l++)
         {
            Stone s = (Stone) stones.get(l);
            s.run();
      }
      
      for (int i = 0; i < deers.size(); i++)
      {
         Animal a = (Animal) deers.get(i);

         a.run(deers, tussocks, wolfs, smell2);
         if (a.dead) {
            if (random(1000) > 995) removeDeer(a); 
         }
         if (a.reproduce) {
           DeerID += 1;
           int type = 3;
           float dmg = 10.0f;
           float size = 10.0f;
           addDeer(new Animal(new PVector(a.pos.x,a.pos.y),maxSSp,maxSRot,maxSHp,dmg,size, true, DeerID, type));
           a.reproduce = false;
         }
      }
      
   }//run---
   
   void addTussock(Tussock t)
   {
     tussocks.add(t);
   }
   
   void addStone(Stone s)
   {
     stones.add(s);
   }
    
    void addWolf(Animal w)
   {
     wolfs.add(w);
   }
   
    void addSheep(Animal s) {
    sheeps.add(s);
   }
    
    void addDeer(Animal a) {
     deers.add(a);
   }
   
   void removeSheep(Animal s) {
     sheeps.remove(s);
   }
    
   void removeWolf(Animal w) {
     wolfs.remove(w);
   }
   
   void removeDeer(Animal a) {
     deers.remove(a);
   }
    
}// flock end----
 
 
// appearence

void appearance(int type, float size, float health, color col)
{
  if (type == 1) { // sheeps
    pushMatrix();
    translate(0,0,0);
    ellipse(0,0,size*health,2*size); // body 
    popMatrix();
    
    pushMatrix();
    fill(220);
    translate(0,0,0.1);
    ellipse(0,-size/1.5,size/1.2,size); // head
    popMatrix();
    
    pushMatrix();
    translate(0,0,0.2);
    ellipse(size/3,-size/1.7,size/2,size/3); // ears
    ellipse(-size/3,-size/1.7,size/1.8,size/3);
    popMatrix();
    
    pushMatrix();
    translate(0,0,0.5);
    fill(50,250);
    noStroke();
    ellipse(0,-size,size/2,size/1.6); // Face
    popMatrix();
  }
  
  if (type == 2) { // wolves
   pushMatrix();
    translate(0,0,0);
    ellipse(0,0,size,3*size); // body
    popMatrix();
    
    pushMatrix();
    fill(125);
    translate(0,0,0.2);
    ellipse(0,-size/1.8,size,size*1.2); // head

    translate(0,0,0.2);
    fill(110);                          // ears
    triangle(-size/2.5,-size/2,   // v1
             -size/2.3,-size/1.3, // v2
             -size/4,-size/1.4);  // v3
    triangle(size/2.5,-size/2,    // v1
              size/2.3,-size/1.3, // v2
              size/4,-size/1.4);  // v3
              
    ellipse(0,2*size,size/3,size*1.5); // tale
    popMatrix();
  }
  
  if (type == 3) { // animal (something)
    
    pushMatrix();
    translate(0,0,0);
    ellipse(0,0,size/2,2*size); // body
    popMatrix();
    
    pushMatrix();
    translate(0,0,0.2);
    ellipse(0,size,size/3,size/3); // tale

    fill(60);
    ellipse(0,-size/1.1,size/3,size/1.5); // head
    popMatrix();
  }
}

// ------------- realtime / gametime ---------------
void time()
{
  // realtime
  s = second();
  m = minute();
  h = hour();
  ms = millis();
  
  gm = s;
  //gm += 1;
  
 if (gm == 60) gm = 0;
  
  if (frameCount % 60 == 0) {
      if (gm > 58) gh += 1;
  }
  
  if (gh == 24) gh = 0;
}

// -----------Lights functions ------------
void light()
{
 
 if (frameCount % 60 == 0) {
   if (gm >= 59) timeAngle += 15;
 }
 if (timeAngle == 360) timeAngle = 0; // lightning is simulated by rotating circle, I can use this later to simulate movement of sun or something.
 
 int x = timeAngle;
 sun = -(200 * cos(radians(x)));
 lights();
 ambientLight(sun,sun,sun,0,0,1000); 
}


 /// ----------------Animal class--------------------------------------------------
class Animal
{
  PVector pos;
  PVector vel;
  PVector acc;
  PVector a;
  
  float cohe,sepa,alin;
  float size, def_size;
  float maxRotSpeed, maxSpeed, default_maxSp, dmg, default_dmg;
  float hp, default_hp, currentMaxHp;
  float red, green, blue;
  float health, seekFood, age;
  float grown, invgrown;
  float counter = 0;
  float starving, strength, FullStrength;
  float maxAge;
  
  int seekValue, eatValue, sleepValue, smellValue, breedValue; 
  int RepCount;
  int ID, type;
  
  color currentColor;
  
  boolean female = false;
  boolean dead, reproduce, hunger;
  boolean newborn = false;
  boolean alpha = false;
  boolean onTrack = false;
  
  boolean enable_group, enable_update, enable_borders, enable_grow, enable_show, enable_health;
  boolean enable_fear, enable_seekGrass, enable_eatGrass, enable_seekAnimal, enable_eatAnimal;
  boolean enable_reproduction, enable_alpha, enable_groupMaxSp, enable_smellSense, enable_stink, enable_valueComputing;

  Animal(PVector p, float ms, float mrs, float hp_, float dmg_, float size_, boolean newborn_, int ID_, int type_)
  {
    pos = p;
    acc = new PVector();
    vel = new PVector(random(-1,1),random(-1,1));
    
    if (random(100) > 60) female = true;
    else female = false;
    
    newborn = newborn_;
    if (newborn) grown = 0.4f;
    else grown = random(0.4, 1.0);
    
    FullStrength = random(10000);
    strength = FullStrength * grown;
    
    ID = ID_;
    size = size_ * grown;
    def_size = random(size_-1,size_+1);
    maxRotSpeed = mrs;
    maxSpeed = ms * grown;
    default_maxSp = random(ms-1, ms+1);
    dmg = dmg_ * grown;
    default_dmg = random(dmg_-1,dmg_+1);
    currentMaxHp = hp_ * grown;
    default_hp = hp_;
    hp = hp_;
    red = 200;
    green = 200;
    blue = 200;
    health = 1.0f;
    seekFood = 1.0f;
    age = 0;
    maxAge = random(9,11);
    RepCount = 0;
    starving = 1.0f;
    type = type_;
    

    
    hunger = false;
    reproduce = false;
    dead = false;
    
    typeSet(type);
  }
  
  void run(ArrayList same, ArrayList food,ArrayList enemy, ArrayList smell)
  {
    if (enable_group) group(same);
    if (enable_update) update();
    if (enable_borders) borders();
    if (enable_grow) grow();
    if (enable_show) show();
    if (enable_health) health();
    if (enable_fear) fear(enemy);
    if (enable_seekGrass) seekGrass(food);
    if (enable_eatGrass) eatGrass(food);
    if (enable_seekAnimal) seekAnimal(food);
    if (enable_eatAnimal) eatAnimal(food);
    if (enable_reproduction) reproduction(same);
    if (enable_alpha) Alpha(same);
    if (enable_groupMaxSp) groupMaxSp(same);
    if (enable_smellSense) smellSense(smell,food);
    if (enable_stink) stink(smell);
    if (enable_valueComputing) valueComputing();
  }
  
  void group(ArrayList same)
  {
    PVector sep = separate(same);
    PVector ali = align(same);
    PVector coh = cohesion(same);
    
    // set forces and distribute
    sep.mult(sepa);
    ali.mult(alin);
    coh.mult(cohe);
    
    acc.add(sep);
    acc.add(ali);
    acc.add(coh);
  }
  
  void update() // update pos method
  {
    vel.add(acc);
    //vel.mult(health);
    //vel.mult(seekFood);
    if (random(1000) > 998) {
    vel.add(new PVector(random(-2,2),random(-2,2)));
    }
    vel.limit(maxSpeed);
    if (dead) vel.limit(0);
    pos.add(vel);
    
    acc.set(0,0,0);
  }
    
  void seek(PVector target)
  {
    acc.add(rot(target,false));
  }
    
  void arrive(PVector target)
  {
    acc.add(rot(target,true));
  }
   
  void fear(PVector target)
  {
    acc.sub(rot(target,false));
  }
    
    // calculate rotation vector method
  PVector rot(PVector target, boolean slow)
  {
      PVector rot;
      PVector desire = target.sub(target,pos); // vector that points to the target
      
      float d = desire.mag();
      
      if ((d > 0) && (dead == false))
      {
        desire.normalize();
        
      if ((slow) && (d < 100.0f)) desire.mult(maxSpeed * (d/100.0f));
      
      else desire.mult(maxSpeed);
      
      rot = target.sub(desire,vel);
      
      rot.limit(maxRotSpeed);
      }
      else rot = new PVector(0,0);
      
      return rot;
  }
  //----show animals-----  
  void show()
  {
    float theta = vel.heading() + HALF_PI;
    
    fill(currentColor);
    if (dead) fill(100,230);
    //stroke(red,green,blue);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    
    appearance(type, size,health,currentColor);
    
   // if (info) text(weaknesCoef ,5,0);
    popMatrix();
    
  }
  
  // loop the world
  void borders() {
    
    if (pos.x <= -mapX/2) {
      pos.x = -mapX/2;
      acc.add(rot(new PVector(pos.x + 20, pos.y),false));
    }
    if (pos.x > mapX/2) { 
      pos.x = mapX/2;
      acc.add(rot(new PVector(pos.x - 20, pos.y),false));
    }
    if (pos.y < -mapY/2) {
      pos.y = -mapY/2;
      acc.add(rot(new PVector(pos.x, pos.y + 20),false));
    }
    if (pos.y > mapY/2) {
      pos.y = mapY/2;
      acc.add(rot(new PVector(pos.x, pos.y - 20),false));
    }  
  }
  
  // separation method
  PVector separate(ArrayList same) {
    
    float desireSep = 20.0f;
    PVector sum = new PVector(0,0,0);
    int count = 0;
      for (int i = 0; i < same.size(); i++) {
          
        Animal other = (Animal) same.get(i);
        float d = pos.dist(pos, other.pos);
          
        if ((d > 0) && (d < desireSep)) {
            if (other.dead == false) {
            PVector diff = pos.sub(pos,other.pos);
              
            diff.normalize();
            diff.div(d);
            sum.add(diff);
            count++;
            }
        }
    }
    if (count > 0) {
      sum.div((float)count);
    }
    return sum;
  }
// aligment method
 
  PVector align (ArrayList same) {
    
    float neighAnimalDist = 50.0f;
    PVector sum = new PVector(0,0,0);
    int count = 0;
     
      for (int i = 0; i < same.size(); i++) {
        
        Animal other = (Animal) same.get(i);
        float d = pos.dist(pos, other.pos);
  
        if ((d > 0) && (d < neighAnimalDist)) {
            if (other.dead == false) {
              
              sum.add(other.vel);
              count++;
            }
        }
    }
    if (count > 0) {
        sum.div((float)count);
        sum.limit(maxRotSpeed);
    }
    return sum;
  }
  
// calculate cohesion method
 
  PVector cohesion(ArrayList same) {
      
    float neighDist = 100.0f;
    PVector sum = new PVector(0,0,0);
    int count = 0;
    
      for (int i = 0; i < same.size(); i++) {
        
        Animal other = (Animal) same.get(i);
        float d = pos.dist(pos,other.pos);
        
        if((d > 0) && (d < neighDist)) {
            if (other.dead == false) {
              
              sum.add(other.pos);
              count++;
            }
        }
    }
    if (count > 0) {
      sum.div((float)count);
      
      return rot(sum,false);
      
    }
    
    return sum;
  }
//----- make them seek for food if they are hungry
  void seekGrass(ArrayList food)
  {
    float seekDist = 300.0f;
    
    for (int i = 0; i < food.size(); i++) {
      
      Tussock other = (Tussock) food.get(i);
      float d = pos.dist(pos,other.pos);
      if (hp < currentMaxHp) {
        if(other.hp > 0) {
          if ((d > 0) && (d < seekDist)) {
            seek(other.pos);
          }
        }
      }
    }
  }
 // ---- once they get close enough they will eat if they are hungry
 
  void eatGrass(ArrayList food)
  {
    float eatkDist = 50.0f;
    
    for (int i = 0; i < food.size(); i++) {
      Tussock other = (Tussock) food.get(i);
       
       if (hp < currentMaxHp) {
        if(other.hp > 0) {
          float d = pos.dist(pos,other.pos);
        
          if ((d >= 0) && (d <= eatkDist)) {
            arrive(other.pos);
            
             if (random(100) > 90) {
               if (hp < currentMaxHp) {
                  other.getEaten(dmg);
                  hp += dmg;
              }
            }
          }
        }
      }
    }
  }
  
  //----- make them seek for food if they are hungry
  void seekAnimal(ArrayList food)
  {
    float seekDist = 400.0f; // set the spot distance (right now its too large but i add scent and 
    FloatList weaknessList;
    float weakness;
    
    for (int i = 0; i < food.size(); i++) {
      
      Animal other = (Animal) food.get(i);
      float d = pos.dist(pos,other.pos);
      weaknessList = new FloatList();
      
      for (int j = 0; j < food.size(); j++) { // I have to create the list instantly before i can compare the numbers
         Animal osh = (Animal) food.get(j); 
         weaknessList.append(osh.strength);
      }
      if (hunger){
          if (d < seekDist) {
              int num;
              weakness = weaknessList.min(); // I search the list for the minimal health, that will become the hunters new target
              
              if (other.strength == weakness) { // if my minimal health value is same as currtent tested animal value then i send hunter to its position
                seek(other.pos);
              }   
          }
      }
    }
  }
  
 void eatAnimal(ArrayList food)
  {
    float eatkDist = 5.0f;
    
    for (int i = 0; i < food.size(); i++) {
      Animal other = (Animal) food.get(i);
       
       if (hp < default_hp) {
          float d = pos.dist(pos,other.pos);
        
          if (d <= eatkDist)
            {
              arrive(other.pos);
              if (random(100) > 60) {
                other.getEaten(dmg);
             
                  hp += dmg;
                  starving = 1.0f;
              }
            }
        } 
    }
  }
  
  void fear(ArrayList enemy)
  {
    float fearDist = 150.0f;
    
    for (int i = 0; i < enemy.size(); i++) {
      
      Animal other = (Animal) enemy.get(i);
      float d = pos.dist(pos,other.pos);
       
          if ((d > 0) && (d < fearDist)) {
            fear(other.pos);
            sepa = 2.0f;
          }
     }
  }
   
  void health()
 {
    health = map(hp, 0, currentMaxHp, 0.5f, 1.0f);
    
    starving();
    dying();
    grow();
    age();
  }

  void starving()
  {
    if (starving <= 0.7) {
    hunger = true;
    }
    
    if ((starving <= 0) && (random(1000) > 998)) {
     hp -= 1;
     hunger = true;
    }
    starving -= 0.001;
    
    if (starving >= 0.9) hp += 0.001;

    
    green = map(hp,0,default_hp,0,255);
    blue = map(hp,0,default_hp,0,255);    
    
    seekFood = map(health, 0.2f, 1.0f, 2.0f, 1.0f);
    
    if (starving > 1.0) starving = 1.0;
    if (starving < 0) starving = 0;
  }
   
  void getEaten(float dmg)
  {
   hp -= dmg;
  }
  
  void dying()
  {
   if (hp <= 0) dead = true; 
  }
  
  void grow() // animals growing is based on frames now, but i will make proper time cycles
  {
    grown += 0.0001;
    if (grown > 1.0f) grown = 1.0f;
    
    // all size, damage, max speed and max HP are influenced by their age(grow) 
    size = def_size * grown;
    dmg = default_dmg * grown;
    maxSpeed = default_maxSp * grown;
    currentMaxHp = default_hp * grown;
    strength = FullStrength * grown * health + age; // this is something for wolves to orient about
  }
  
  void reproduction(ArrayList same)
  {
    float repDist = 25.0f;
    float pairDist = 100.0f;
    int pairID;
    FloatList IDlist;
    IDlist = new FloatList();
    
    for (int i = 0; i < same.size(); i++) {
      
      Animal other = (Animal) same.get(i);
      float d = pos.dist(pos,other.pos);
      
      if ((d > 0) && (d < pairDist)) {
        if ((female) && (other.female == false) || (other.female) && (female == false)) {
          if ((grown > 0.8) && (other.grown > 0.8) && (health >= 1.0) && (other.health >= 1.0)){
            if (other.alpha){
            
              IDlist.append(other.ID);
              
              if (other.ID == IDlist.get(0)) {
                cohe = 0.5f;
                alin = 1.0f;
              }
              else {
                cohe = 0.0f;
                alin = 0.0f;
              }

              if ((d > 0) && (d < repDist)) {
                
                if ((random(10000) > 9995) && (RepCount < 3)) {
                  reproduce = true;
                  RepCount += 1;
                }
                else reproduce = false;
              }
            }
          }
        }
      }
    } 
  }
  
  void age() // age represented now by in-game days
  {
    if ((gh == 24) && (gm >= 59) && (frameCount % 60 == 0)) {
       age += 1;
    }
   
   if (age >= 10) dead = true; 
  }
  
    void Alpha(ArrayList same)
  {
    FloatList strengthList;
    strengthList = new FloatList();
    float other_strength;
    float packDist = 200;
    
     for (int i = 0; i < same.size(); i++) {
         Animal other = (Animal) same.get(i);
         
         if ((female) && (other.female) || (female == false) && (other.female == false)) {           
              float d = pos.dist(pos,other.pos);
              
            if ((d > 0) && (d < packDist)) {
              for (int j = 0; j < same.size(); j++) {
               strengthList.append(other.strength);
              }
              other_strength = strengthList.max();
               
              if (strength >= other_strength) {
                  alpha = true;
              }
              else alpha = false;
            }
        }
     }
  }
  
  void groupMaxSp(ArrayList same)
  {
    float groupDist = 50;
    float otherMaxSp;
    
    for (int i = 0; i < same.size(); i++) {
      Animal other = (Animal) same.get(i);
      float d = pos.dist(pos,other.pos);
      
      if ((d > 0) && (d < groupDist)) {
        otherMaxSp = other.maxSpeed;
        maxSpeed = otherMaxSp;
      }
    }
  }
  
  void smellSense(ArrayList smell, ArrayList food)
  {
     float d, ds, sd;
     float strongest;
     FloatList smellList;
     FloatList IDList;
     smellList = new FloatList();
       
     for (int i = 0; i < smell.size(); i++) {
       Smelltrack sm = (Smelltrack) smell.get(i);
       
       if (sm.ID_type == 1) {
         d = pos.dist(pos,sm.pos);
         if (d < sm.size) {
           
           for (int k = 0; k < food.size(); k++) {
             Animal sh = (Animal) food.get(k);
             sd = sm.pos.dist(sm.pos,sh.pos);
             
             if ((sh.ID == sm.ID) && (sd >= sm.size)){
               
               for (int j = 0; j < smell.size(); j++) {
                 Smelltrack s = (Smelltrack) smell.get(j);
                 ds = pos.dist(pos,s.pos);
                 if (ds < s.size) {
                    smellList.append(s.size);
                 }
               }
               strongest = smellList.max();
      
               if (strongest == sm.size){
                 
                 if (sm.size < 190) {
                 seek(sm.pos);
                 }
               }
             }
           }
         }
       }
     }
  }
  
  void stink(ArrayList smell) 
  {
    float smellsize = 200;
    float smelldecay = 0.01;
    
    if (counter == 0 || counter < 10001) counter += 1;
    else counter = 0;
    
    if ((counter < 2) ||(counter % 150 == 0)) {
       flock.smell.add(new Smelltrack(new PVector(pos.x,pos.y), smellsize, smelldecay, ID, type));
    }
    for (int i = 0; i < smell.size(); i++) {
       Smelltrack sm = (Smelltrack) smell.get(i);
       
       sm.run();
       
       if (sm.size == 0) {
         flock.smell.remove(i);
       }
    }
  }
  
    void valueComputing()
  {
    
    if ((alpha) && (starving > 0.8) && (grown > 0.8) && (health > 0.9)) breedValue += 1;
    else breedValue -= 1;
    
    if (starving < 0.7) seekValue += 1;
    else seekValue -= 1;
    
    if (smellValue >= 1000) smellValue = 1000;
    if (smellValue <= 0) smellValue = 0;
    
    if (seekValue >= 1000) seekValue = 1000;
    if (seekValue <= 0) seekValue = 0;
    
    if (breedValue >= 1000) breedValue = 1000;
    if (breedValue <= 0) breedValue = 0;
  }
  
  void typeSet(int type)
{
  if (type == 1) { // sheep
   currentColor = color(random(240,250),240);
    enable_group = true;
    enable_update = true;
    enable_borders = true;
    enable_grow = true;
    enable_show = true;
    enable_health = true;
    enable_fear = true;
    enable_seekGrass = true;
    enable_eatGrass = true;
    enable_seekAnimal = false;
    enable_eatAnimal = false;
    enable_reproduction = true;
    enable_alpha = true;
    enable_groupMaxSp = true;
    enable_smellSense = false;
    enable_stink = true;
    enable_valueComputing = false;
    
    alin = 1.0f;
    cohe = 1.0f;
    sepa = 4.0f; 
  }
  if (type == 2) { // wolves
  currentColor = color(random(140,160),240);
    enable_group = true;
    enable_update = true;
    enable_borders = true;
    enable_grow = true;
    enable_show = true;
    enable_health = true;
    enable_fear = false;
    enable_seekGrass = false;
    enable_eatGrass = false;
    enable_seekAnimal = true;
    enable_eatAnimal = true;
    enable_reproduction = true;
    enable_alpha = true;
    enable_groupMaxSp = true;
    enable_smellSense = true;
    enable_stink = false;
    enable_valueComputing = false;
    
    alin = 0.0f;
    cohe = 0.0f;
    sepa = 2.0f;
  }
  if (type == 3) {
    currentColor = color(110,71,20);
    enable_group = true;
    enable_update = true;
    enable_borders = true;
    enable_grow = true;
    enable_show = true;
    enable_health = true;
    enable_fear = false;
    enable_seekGrass = true;
    enable_eatGrass = true;
    enable_seekAnimal = false;
    enable_eatAnimal = false;
    enable_reproduction = true;
    enable_alpha = true;
    enable_groupMaxSp = false;
    enable_smellSense = false;
    enable_stink = false;
    enable_valueComputing = false;
    
    alin = 0.5f;
    cohe = 0.5f;
    sepa = 3.0f;
  }
}
}// animal end ---


//-------------- smelltrack class -------------------------
class Smelltrack
{
  PVector pos;
  PVector camPos;
  
  float size;
  float ini_decay, decay;
  int ID;
  int ID_type;
  
  float d;
  
  Smelltrack(PVector p, float size_, float decay_, int ID_, int ID_type_)
  {
   pos = p;
   size = size_;
   decay = decay_;
   ID = ID_;
   ID_type = ID_type_;
   
   camPos = new PVector(CamPosX, CamPosY);
  }
  
  void run()
  {
   decay();
   show();
  }
 
 void show()
  {
    d = pos.dist(pos,camPos);
    if (d < 600)
    {
      if (smellpath) {
      pushMatrix();
      noFill();
      stroke(0);
      translate(pos.x,pos.y,1);
      rect(-size/2,-size/2,size,size);
      popMatrix();
      }
    }
  }
  
  void decay()
  {
   size -= decay;
   if (size <= 0) size = 0; 
  } 
}

//--------------- stone class -------------------------------------------------
class Stone
{
  PVector pos;
  float size;
  
  color currentCol;

  float red;
  float green;
  float blue;
  float alpha;
  
  Stone(PVector p, float size_)
  {
   pos = p;
   size = size_;
   currentCol = color(random(90,150));
  }
  
  void run()
  {
   show();
  }
  
  void show()
  {
    pushMatrix();
    fill(currentCol);
    noStroke();
    translate(pos.x, pos.y, 0);
    ellipse(0, 0, size,size);
    popMatrix();
  }  
}// stone end ///


//--------------- tussock class -------------------------------------------------
class Tussock
{
  PVector pos;
  float size;
  
  color fresh = color(18,160,2,80);
  color currentCol;
   
  float red;
  float green;
  float blue;
  float alpha;
  
  float default_hp;
  float hp;
  
  Tussock(PVector p, float size_)
  {
   pos = p;
   size = size_;
   hp = default_hp = size_*size_/10;
   currentCol = fresh;
  }
  
  void run()
  {
   regenerate();
   colorize();
   show();
  }
  
  void show()
  {
    pushMatrix();
    fill(currentCol);
    noStroke();
    translate(pos.x, pos.y, -0.2);
    ellipse(0, 0, size,size);
    
   /* if (info){
      pushMatrix();
      translate(0, 0, 0.1);
      fill(255);
      text(hp,0,0);
      popMatrix();
    }
    */
    popMatrix();
  }
  
  void getEaten(float dmg)
  {
     hp -= dmg;  
  }
  
  void regenerate()
  {
     if (random(10000) > 9950)
     {
       if(hp < default_hp) hp += 10;
     }
  }
   
  void colorize()
  {
     red = map(hp,0,default_hp,100,0);
     green = map(hp,0,default_hp,40,163);
     blue = map(hp,0,default_hp,30,2);
     alpha = map(hp,0,default_hp,0,80);
      
     currentCol = color(red,green,blue,alpha);
  }
}// tussock end ///






