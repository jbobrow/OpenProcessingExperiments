
// This thing is my test to learn how to do selecting and commanding lets say one unit in somekind of RTS or whatever.
// I did the usual point click selecting and select by draging,

PFont f;
int nu;
Game sel;

boolean click1, click1_, click2, drag;
boolean once = true;
float selRectX, selRectY;
float selRectSizeX, selRectSizeY;
int playerTeam = 0;

void setup()
{
  size(800,600);
  frameRate(60);
  f = createFont("Arial",16,true);
  nu = 4; // number of units
  sel = new Game();
}

void draw()
{
  background(30,100,30);
  GUI();
  sel.run();
  info();
  if (drag) { // draw the selecting rectangle
        noFill();
        stroke(0,0,255);
        rect(selRectX,selRectY,selRectSizeX-selRectX,selRectSizeY-selRectY);
   }
   
   click2 = false; // disable all clicks
   click1 = false;
   click1_ = false;
}
// this is mess :D
 void mousePressed() 
  {
    if (mouseButton == LEFT && once) {
      selRectX = mouseX; // save first point of the selecting rectangle
      selRectY = mouseY;
      once = false; // do this only once
    }
     if (mouseButton == LEFT) {
       click1_ = true; // this is for deselecting when we select with the draging
     }
  }
  void mouseDragged()
  { 
    if (mouseButton == LEFT) {
      selRectSizeX = mouseX; // update second point of selecting rectangle
      selRectSizeY = mouseY;
      drag = true; // until mouse button is released
    }
  }
  void mouseReleased()
  {
    if (mouseButton == RIGHT) click2 = true; // move command
    if (mouseButton == LEFT) { 
      click1 = true; // selectr by clicking 
      once = true; // re-enable the rectangle draging
    }
    drag = false; // here we disable the rectangle to be shown
    selRectX = selRectY = selRectSizeX = selRectSizeY = 0; // set all values to 0
  }

class Game
{
  ArrayList units;
  ArrayList shots;
  ArrayList buildings;
  int BPcount;
  int UID = 0;
      Game()
      {
       units = new ArrayList();
       shots = new ArrayList();
       buildings = new ArrayList();
       
       addBuilding(new PVector(150,height/3), 1, 0, color(0,255,0), color(170), 0);
       addBuilding(new PVector(width - 150,height/3), 1, 1, color(255,0,0), color(170), 180);
       //println(units.size());
      }
      
   void run()
   {
       for (int k = 0; k < units.size();k++) {
         Unit u = (Unit) units.get(k);
         u.run(units,buildings);
         
         if (u.alive == false) units.remove(u);
       }
       
       for(int i=0; i<shots.size();i++) {
          Shot s = (Shot) shots.get(i);
          
          s.run(units, buildings);
          
          if (s.exist == false) shots.remove(s);
       }
       
       for (int i = 0; i < buildings.size();i++) {
         Building b = (Building) buildings.get(i);
         
         b.run();
         
         if (b.hp <= 0) buildings.remove(b);
         
         if (b.spawn) {
           UID ++;
           addUnits(new PVector(b.pos.x+b.sizeX+20,b.pos.y+b.sizeY/2), b.teamCol, b.col, UID, b.team, new PVector(b.target.x, b.target.y), b.unit_type_prod);
           b.spawn = false;
         }
       }
   }
   void addUnits(PVector pos, color teamCol, color col, int UID, int team, PVector tar, int type)
   {
     units.add(new Unit(pos, teamCol, col, UID, team, tar, type));
   }
   
   void addBuilding(PVector pos,int type, int team, color teamCol,color col, float rot)
   {
     buildings.add(new Building(pos, type, team, teamCol, col, rot)); 
   }
}


class Building // -------------------------------------------
{
  PVector pos;
  PVector target;
  
  float sizeX, sizeY;
  float u0_r_shad, u1_r_shad, u2_r_shad;
  float rot;
  float health, bar; 
 
  int hp, maxHP;
  int unit_type_prod;
  int type;
  int team;
  int BPcount0, BPcount1, BPcount2, buildTime;
  int batch0, batch1, batch2;
  
  boolean select, selectedC, mouseOverMenu;
  boolean showUnit_0, showUnit_1, showUnit_2;
  boolean unit0_enabled, unit1_enabled, unit2_enabled;
  boolean mouseHover_unit_0, mouseHover_unit_1, mouseHover_unit_2;
  boolean produce, update, command, spawn, produce_unit_0, produce_unit_1, produce_unit_2;
  boolean alive;
  color col, teamCol;
  
    Building(PVector p_,int type_, int team_, color teamCol_,color col_, float rot_)
   {
     pos = new PVector(p_.x,p_.y);
     target = new PVector();
     
     type = type_;
     team = team_;
     col = col_;
     teamCol = teamCol_;
     produce = false;
     command = true;
     mouseOverMenu = false;
     BPcount0 = BPcount1 = BPcount0 = 0;
     batch0 = batch1 = batch2 = 0;
     hp = maxHP = 500;
     spawn = false;
     alive = true;
     rot = rot_;
     buildTime = 200;
     
     type(); 
   } 
 
  void run()
  {
    mouseFunctions();
    production();
    health();
    show();
  }
  
  void type()
  { 
    if (type == 1) {
      unit0_enabled = true;
      unit1_enabled = true;
      unit2_enabled = true;
      sizeX = 50;
      sizeY = 100;
      hp = 500;
      target.x = pos.x + (sizeX + 40) * cos(radians(rot));
      target.y = pos.y + sizeY / 2;
    }
  }
  
  void productionOLD()
  {
    if (selectedC && unit0_enabled) showUnit_0 = true;
    else showUnit_0 = false;
    if (selectedC && unit1_enabled) showUnit_1 = true;
    else showUnit_1 = false;
    if (selectedC && unit2_enabled) showUnit_2 = true;
    else showUnit_2 = false;
    
     if ((produce_unit_0) && (selectedC) && (command)) {
       produce = true;
       command = false;
       unit_type_prod = 0;
       buildTime = 300;
     }
     
     if ((produce_unit_1) && (selectedC) && (command)) {
       produce = true;
       command = false;
       unit_type_prod = 1;
       buildTime = 200;
     }
     
     if ((produce_unit_2) && (selectedC) && (command)) {
       produce = true;
       command = false;
       unit_type_prod = 2;
       buildTime = 250;
     }
     
     if (produce) {
       if (produce_unit_0) {
         u0_r_shad = map(BPcount0,0,buildTime,0,70);
         BPcount0 ++;
       }
       
       if (produce_unit_1) {
         u1_r_shad = map(BPcount1,0,buildTime,0,70);
         BPcount1 ++;
       }
       
       if (produce_unit_2) {
         u2_r_shad = map(BPcount2,0,buildTime,0,70);
         BPcount2 ++;
       }
     }
     
     if (BPcount0 >= buildTime) {
       spawn = true;
       batch0 -= 1;
       if (batch0 <= 0) batch0 = 0;
       BPcount0 = 0;
       if (batch0 > 0) produce = true;
       else {
         produce = false;
         produce_unit_0 = false;
         produce_unit_1 = false;
         produce_unit_2 = false;
       }
     }
     
     if (BPcount0 >= buildTime) {
       if (batch0 > 0) {
         batch0 -= 1;
         if (batch0 <= 0) {
           batch0 = 0;
           produce_unit_0 = false;
         }
       }
     }
  }
 
  
  void production()
  {
    if (selectedC && unit0_enabled) showUnit_0 = true;
    else showUnit_0 = false;
    if (selectedC && unit1_enabled) showUnit_1 = true;
    else showUnit_1 = false;
    if (selectedC && unit2_enabled) showUnit_2 = true;
    else showUnit_2 = false;
    
       if (produce_unit_0) {
         BPcount0 ++;
         u0_r_shad = map(BPcount0,0,buildTime,0,70);
       }
       if (produce_unit_1) {
         u1_r_shad = map(BPcount1,0,buildTime,0,70);
         BPcount1 ++;
       }
       if (produce_unit_2) {
         u2_r_shad = map(BPcount2,0,buildTime,0,70);
         BPcount2 ++;
       }
     
     if (batch0 > 0) {
       produce_unit_0 = true;
       unit_type_prod = 0;
       buildTime = 300;
       
       if (BPcount0 >= buildTime) {
         batch0 -= 1;
         spawn = true;
         BPcount0 = 0;
       }
     } else batch0 = 0;
    
  }
    
  
  void mouseFunctions()
  {
   // select by clicking
    if(mouseCheckRect(pos.x,pos.y,sizeX,sizeY)) {
            select = true;
    } else select = false;
    
    if (select && click1) {
      selectedC = true;
    }
   // check if mouse is over the menu
   if (mouseCheckRect(50, height-100, width-100, 100)) {
        mouseOverMenu = true;
   } else mouseOverMenu = false; 
    
    if (click1 && select == false && mouseOverMenu == false) {
      selectedC = false;
    }
    
    // check if mouse clicked on uint_0
    if (mouseOverMenu && selectedC) {
      if (mouseCheckRect(65,height - 85,70,70)) {
           mouseHover_unit_0 = true;
           if (click1) { command = true; batch0 += 1; }
           if (click2) { 
             batch0 -= 1; 
             if(batch0 <= 0) { 
               batch0 = 0; 
               produce_unit_0 = false;
               command = false;
               }
           }
      } else mouseHover_unit_0 = false;
    }
    
    // check if mouse clicked on uint_1
    if (mouseOverMenu && selectedC) {
      if (mouseCheckRect(140,height - 85,70,70)) {
           mouseHover_unit_1 = true;
           if (click1) { command = true; batch1 += 1; }
           if (click2) { 
             batch1 -= 1; 
             if(batch1 <= 0) { 
               batch1 = 0; 
               produce_unit_1 = false;
               command = false;
               }
           }
      } else mouseHover_unit_1 = false;
    }
    
    // check if mouse clicked on uint_2
    if (mouseOverMenu && selectedC) {
      if (mouseCheckRect(215,height - 85,70,70)) {
           mouseHover_unit_2 = true;
           if (click1) { command = true; batch2 += 1; }
           if (click2) { 
             batch2 -= 1; 
             if(batch2 <= 0) { 
               batch2 = 0; 
               produce_unit_2 = false;
               command = false;
               }
           }
      } else mouseHover_unit_2 = false;
    }
    
    
    
    // set relay point 
    if (click2 && mouseOverMenu == false) update = true;
    if ((update) && (selectedC)) {
      target.x = mouseX; // save position where unit needs to be 
      target.y = mouseY;
    }
    update = false; // we want to do this only once
  }
  
  void show()
  { 
    pushMatrix();
    translate(pos.x,pos.y);
    stroke(0);
    fill(0,255,0);
    rect(0,sizeY + 10,bar,3);
    noStroke();
    fill(col);
    rect(0,0,sizeX,sizeY);
    fill(teamCol);
    rectMode(CENTER);
    rect(sizeX/2,sizeY/2,sizeX/2,sizeY/2);
    rectMode(CORNER);
    popMatrix();
    
    // show the border when selected
    if (selectedC) {
    noFill();
    stroke(20,230,20);
    rect(pos.x-3,pos.y-3,sizeX+5,sizeY+5);
    }
    // show different border when mouse hower over the unit
    if (select) {
    stroke(255,150);
    noFill();
    rect(pos.x-2,pos.y-2,sizeX+3,sizeY+3);
    }
    
    if (selectedC) {
      pushMatrix();
      noFill();
      stroke(0,255,0);
      translate(target.x,target.y);
      ellipse(0,0,5,5);
      popMatrix();
    }
    
    if (selectedC) {
      pushMatrix();
      translate(50,height-100);
      
        // show unit 0 in menu
        pushMatrix();
        noStroke();
        if (mouseHover_unit_0) stroke(0);
        translate(50,50);
        fill(200);
        ellipse(0,0,50,50);
        fill(150);
        noStroke();
        ellipse(0,0,25,25);
        fill(0);
        text("builder",-25,-25);
        if (produce) {
          rectMode(CENTER);
          fill(50,128);
          rect(0,0,u0_r_shad,70);
          rectMode(CORNER);
        }
        fill(0);
        text(batch0, 25,35);
        popMatrix();
        
        // show unit 1 in menu
        pushMatrix();
        noStroke();
        if (mouseHover_unit_1) stroke(0);
        translate(125,50);
        fill(200);
        ellipse(0,0,30,30);
        fill(150);
        noStroke();
        ellipse(0,0,15,15);
        fill(0);
        text("light unit",-25,-25);
        if (produce) {
          rectMode(CENTER);
          fill(50,128);
          rect(0,0,u1_r_shad,70);
          rectMode(CORNER);
        }
        fill(0);
        text(batch1, 25,35);
        popMatrix();
        
        // show unit 2 in menu
        pushMatrix();
        noStroke();
        if (mouseHover_unit_2) stroke(0);
        translate(200,50);
        fill(200);
        ellipse(0,0,40,40);
        fill(150);
        noStroke();
        ellipse(0,0,20,20);
        fill(0);
        text("heavy unit",-25,-25);
        if (produce) {
          rectMode(CENTER);
          fill(50,128);
          rect(0,0,u2_r_shad,70);
          rectMode(CORNER);
        }
        fill(0);
        text(batch2, 25,35);
        popMatrix();
      
      popMatrix();
    }
  }
  
    void health()
  {
    if (hp <= 0) alive = false; 
    health = map(hp,0,maxHP,0,100);
    bar = map(health,0,100,0,sizeX);
  }
} // building class end ------------------------------
void info() //----------------------------------
{
  fill(255);
  text("FPS: " + frameRate,10,10);
  text(mouseX, 10,20);
  text(mouseY, 10,30);
} 

void GUI()
{
  float sizeX = width-100;
  float sizeY = 100;
  PVector pos = new PVector(50,height-100);
  
  stroke(0);
  fill(100,140,230,130);
  rect(pos.x,pos.y,sizeX,sizeY);
  for (int i=0; i < 9;i++) {
    fill(128,100);
    rect(pos.x+15+i*75,pos.y+15,70,70);
  }
  
}

boolean mouseCheckRect(float x, float y, float sx, float sy)
{
  boolean check = false;
  if (mouseX > x && mouseX < x + sx) {
   if (mouseY > y && mouseY < y + sy) {
     check = true;
   }
  } 
  return check;
}
class Unit
{
  PVector pos;
  PVector lastPos;
  PVector vel;
  PVector acc;
  PVector moveTarget;
  PVector moveVector;
  PVector nonCol;
  
  float speed,maxSpeed, minDist, slowDist, maxRotSpeed;
  float sizeX, sizeY, theta;
  float acceleration;
  float health, bar;
  float counter, count;
  float shotSpeed, rateOfFire;
  
  int hp,maxHP;
  int dmg;
  int ID;
  int team;
  int type;
  
  boolean collisionCal, colize;
  boolean alive = true; 
  boolean selectedC, selectedD, select, update;
    
  color col, teamCol;
  
    Unit(PVector p_, color teamCol_,color col_, int i_, int t_, PVector tar_,int type_)
    {
       pos = new PVector(p_.x,p_.y);
       vel = new PVector();
       acc = new PVector();
       moveTarget = new PVector(tar_.x,tar_.y);
       moveVector = new PVector(tar_.x - p_.x, tar_.y - p_.y);
       lastPos = new PVector(p_.x,p_.y);
       nonCol = new PVector();
       
       ID = i_;
       team = t_;
       type = type_;
       col = col_;
       teamCol = teamCol_;
       minDist = 3;
       speed = 0;
       slowDist = sizeX *2;
       
       // default type parameters
       sizeX = 20;
       sizeY = 20;
       hp = maxHP = 20;
       maxSpeed = 3;
       dmg = 5;
       maxRotSpeed = 0.5;
       shotSpeed = 6.0f;
       rateOfFire = 120.0f;
       
       colize = false;
       counter = count = 0;
       
       // type definition
       type();
    }
  // Run function - this puts everything together in this class
  void run(ArrayList units, ArrayList buildings)
  {
    selectCheck();
    mouseCheck();
    speedCalc();
    update();
    //beforeCollision(units);
    collisions(units);
    if (type > 0) shoot(units,buildings);
    health();
    show();
  }
  // update speed and all the vectors
  void update()
  {
    //PVector rotation = rot(moveTarget, false);
    acc.add(rot(moveTarget, false));
    //acc.add(posun);
    vel.add(acc);
    //vel.set(moveVector);
    vel.mult(speed);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.set(0,0,0);
  }
  // define how unit looks
  void show()
  {
    theta = vel.heading();// + HALF_PI;
    
    pushMatrix();
    translate(pos.x,pos.y);
    fill(0,255,0);
    stroke(0);
    //text(hp,0,-sizeY);
    rect(-sizeX/2,sizeY,bar,3);
    rotate(theta);
    noStroke();
    fill(col);
    ellipse(0,0,sizeX,sizeX);
    fill(teamCol);
    ellipse(0,0,sizeX/2,sizeY/2);
    fill(0,0,255,128);
    ellipse(sizeX,0,10,10);
    noFill();
    popMatrix();
    
    pushMatrix();
    translate(pos.x,pos.y);
    stroke(0);
    line(0,0,vel.x,vel.y);
    popMatrix();
    
    // show the border when selected
    if (selectedC || selectedD) {
    stroke(20,230,20);
    rectMode(CENTER);
    rect(pos.x,pos.y,sizeX+4,sizeY+4);
    rectMode(CORNER);
    }
    // show different border when mouse hower over the unit
    if (select) {
    stroke(255,150);
    rectMode(CENTER);
    rect(pos.x,pos.y,sizeX+2,sizeY+2);
    rectMode(CORNER);
    }
   // stroke(0);
   // line(pos.x,pos.y,pos.x+vel.x*10,pos.y+vel.y*10); // enable this line to visualize the move vector
  }
  // set move vectors only when the mouse is pressed
  void mouseCheck()
  {
    if (click2) update = true;
    if ((update) && (selectedC || selectedD) && (drag == false)) {
      lastPos.set(pos); // save position where unit were
      moveTarget.x = mouseX; // save position where unit needs to be 
      moveTarget.y = mouseY;
      moveVector.x = mouseX - pos.x; // and point vector toward the mouse
      moveVector.y = mouseY - pos.y; 
      moveVector.normalize();
    }
    update = false; // we want to do this only once
  }
  // set the speed if there is any distance between unit and target
  void speedCalc()
  {
    float dist = pos.dist(pos,moveTarget);
    float lastDist = lastPos.dist(lastPos,moveTarget);
    if (dist > lastDist/2) speed += 0.1; // unit accelerate slowly
    if (dist < lastDist/3) speed -= 0.15; // unit quickly decelerate near the end
    if (dist < minDist) speed = 0;
    if (speed <= 0) {speed = 0; moveVector.mult(0);}
  }
  // define when select or not
  void selectCheck()
  {
   // select by clicking     
    if(mouseX < pos.x + sizeX/2 && mouseX > pos.x - sizeX/2) {
       if (mouseY < pos.y + sizeY/2 && mouseY > pos.y - sizeX/2) { 
            select = true;
       } else select = false;
    } else select = false;
    
    if (select && click1) {
      selectedC = true;
    }
    if (click1 && select == false) {
      selectedC = false;
    }
    
     // select by dragging
    if(drag) {
      if(selRectX < pos.x + sizeX/2 && selRectSizeX > pos.x || selRectX > pos.x - sizeX/2 && selRectSizeX < pos.x) {
          if (selRectY < pos.y + sizeY/2 && selRectSizeY > pos.y || selRectY > pos.y - sizeY/2 && selRectSizeY < pos.y) {
            select = true;
          } else { select = false; selectedD = false; }
      } else  { select = false; selectedD = false;  }
      
      if (select) selectedD = true;
    } // drag end
    
    if (click1_ && select == false) {
      selectedD = false;
    }
  } // selectCheck end
  
  void collisions(ArrayList units)
  {
    // collisions with units
    for (int i = 0; i < units.size(); i++) {
      Unit u = (Unit) units.get(i);
      
      float dist = pos.dist(pos,u.pos);
      if ((dist > 0) && (dist > sizeX/2 + u.sizeX/2)) { nonCol.set(pos); }
      if ((dist > 0) && (dist < sizeX/2 + u.sizeX/2)) {
         
         pos.set(nonCol);
         colize = true;
         PVector diff = PVector.sub(u.pos,pos);
         diff.div(2);
         u.pos.add(diff);
         
         if (nonCol.mag() == 0) counter ++;
         if (counter >= 1000) {
           moveTarget.set(pos);
           moveVector.mult(0);
           counter = 0;
         }
      }
      else colize = false;
    }
  }
  // not used right now
  void beforeCollision(ArrayList units)
  {
     for (int i = 0; i < units.size(); i++) {
        Unit u = (Unit) units.get(i);
        
        float dist = pos.dist(pos,u.pos);
        
        if ((dist > 0) && (dist < sizeX/2 + u.sizeX/2 + sizeX/3) && (abs(vel.mag()) < 1)) {
           
           PVector diff = PVector.sub(u.pos,pos);
           //diff.div(1.4);
           PVector posun = new PVector();
           posun.set(pos); 
           posun.sub(diff);
           moveTarget.set(posun);
        }
     }   
  }
  // health management
  void health()
  {
    if (hp <= 0) alive = false; 
    health = map(hp,0,maxHP,0,100);
    bar = map(health,0,100,0,sizeX);
  }
  // shooting functions
  void shoot(ArrayList units, ArrayList buildings)
  {
    count ++;
    
     for (int i=0;i<units.size();i++) {
       Unit u = (Unit) units.get(i);
       
       float sDist = sizeX * 10;
       float d = pos.dist(pos,u.pos);
       
       if ((d > 0) && (d < sDist) && (team != u.team)) { // check distance and team
       if (count >= rateOfFire) {   // reaload time
        // println("bang");
           
           PVector tPos = new PVector(u.pos.x, u.pos.y);
           PVector tVel = new PVector(u.vel.x, u.vel.y);
           PVector target = new PVector();
           PVector shotPos = new PVector(pos.x, pos.y);
           
           float tSpeed = (d/shotSpeed); // calculate the time of shot travel
           
           // this is double calculation of enemy vector. basicly it predicts where the enemy will be, but its not absolute precision.
           tVel.mult(tSpeed);  
           target = PVector.add(tVel,tPos);
           float d2 = pos.dist(target,pos);
           tSpeed = (d2/pow(shotSpeed,2));
           tVel.mult(tSpeed);
           
           sel.shots.add(new Shot(shotPos,target,dmg, team, shotSpeed, sizeX/6)); // create shot
           count = 0;
         }
       }
     }
     // same thing with buildings..altho i dont need to predict the movement.
     for (int i=0;i<buildings.size();i++) {
       Building b = (Building) buildings.get(i);
       
       float sDist = sizeX * 10;
       float d = pos.dist(pos,b.pos);
       
       if ((d > 0) && (d < sDist) && (team != b.team)) {
          if (count >= 120) {  
            // println("bang");
                   
            PVector tPos = new PVector(b.pos.x + b.sizeX/2 , b.pos.y + b.sizeY/2);
            PVector target = new PVector();
            PVector shotPos = new PVector(pos.x, pos.y);
                   
            target = tPos;
                   
            sel.shots.add(new Shot(shotPos,target,dmg, team, shotSpeed, sizeX/6));
            count = 0;
          }
       }
     }
  }
  
  // function to calculate movement vector and rotation
  PVector rot(PVector target, boolean slow)
  {
      PVector rot;
      PVector desire = target.sub(target,pos); // vector that points to the target
      
      float d = desire.mag();
      
      if ((d > 0) && (alive))
      {
        desire.normalize();
        
      if ((slow) && (d < 100.0f)) desire.mult(speed * (d/100.0f));
      
      else desire.mult(speed);
      
      rot = target.sub(desire,vel);
      
      rot.limit(maxRotSpeed);
      }
      else rot = new PVector(0,0);
      
      return rot;
  }
  
  void type()
  {
     if (type == 0) { // builder
      dmg = 0;
      sizeX = sizeY = 35.0f;
      maxSpeed = 2;
      maxRotSpeed = 0.2;
     }
     
     if (type == 1) { // light unit
       sizeX = sizeY = 25.0f;
       hp = maxHP = 25;
     }
     
     if (type == 2) { // heavy unit
       dmg = 10;
       sizeX = sizeY = 30.0f;
       hp = maxHP = 40;
       shotSpeed = 3.0f;
       rateOfFire = 60.0f;
       maxSpeed = 2.5f;
       maxRotSpeed = 0.3f;
     }
  }
}// unit class end ---------------------


class Shot // -----------------------------------------
{
  PVector pos;
  PVector vel;
  PVector kam;
  
  boolean exist;
  float dmg;
  int count, livespan;
  float maxSpeed, size;
  int team;
  
  Shot(PVector pos_, PVector kam_, float dmg_, int team_, float maxSpeed_, float size_)
  {
    pos = new PVector();
    vel = new PVector();
    kam = new PVector();

    pos = pos_;
    kam = kam_;
    dmg = dmg_;
    team = team_;
    maxSpeed = maxSpeed_;
    size = size_;
    count = 0;
    livespan = 240;
    
    exist = true;
  }
  
  void run(ArrayList units, ArrayList buildings)
  {
    update();
    livespan(units, buildings);
    show();
  }
  
  void update()
  {
    PVector target = rot(kam,false);
    vel.add(target);
    vel.mult(10);
    vel.limit(maxSpeed);
    pos.add(vel);
    //acc.set(0,0);
  }
  
  void show()
  {
    pushMatrix();
    noStroke();
    fill(255,255,0);
    translate(pos.x,pos.y);
    ellipse(0,0,size,size);
    popMatrix();
  }
  
  void livespan(ArrayList units, ArrayList buildings)
  {
    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) exist = false;
    
    count ++;
    if (count >= livespan) exist = false;
    
    for (int i=0; i< units.size();i++) {
      Unit u = (Unit) units.get(i);
      
      float d = pos.dist(u.pos,pos);
      
      if (team != u.team) {
        if ((d > 0) && (d < u.sizeX/2) && (u.alive)) {
          u.hp -= dmg;
          exist = false;
        }
      }
    }
    
    for (int i=0; i< buildings.size(); i++) {
      Building b = (Building) buildings.get(i);
      
      if (team != b.team) {
        if (pos.x > b.pos.x && pos.x < b.pos.x + b.sizeX) {
          if (pos.y > b.pos.y && pos.y < b.pos.y + b.sizeY) {
            b.hp -= dmg;
            exist = false;
          }
        }
      }
    }
  }
  
   PVector rot(PVector target, boolean slow)
  {
      PVector rot;
      PVector desire = target.sub(target,pos); // vector that points to the target
      
      float d = desire.mag();
      
      if ((d > 0) && (exist))
      {
        desire.normalize();
        
      if ((slow) && (d < 100.0f)) desire.mult(maxSpeed * (d/100.0f));
      
      else desire.mult(maxSpeed);
      
      rot = target.sub(desire,vel);
      
      rot.limit(0.001f);
      }
      else rot = new PVector(0,0);
      
      return rot;
  }
} // shot class end ------------


class Grid // ---------------------------------------
{
   float x;
   float y;
   
   IntList unitCount;
   float size;
   color col;
   
   Grid(float x_, float y_, float size_, color col_)
   {
     x = x_;
     y = y_;
     
     size = size_;
     unitCount = new IntList();
     col = col_;
   }
   
   void run(ArrayList units)
   {
     show();
     unitCounter(units); 
   }
   
   void show()
   {
     stroke(255);
     line(x,y,size,y);
     line(x,y,x,size);
     
     if (unitCount.size() > 0) {
       stroke(col);
       line(x+1,y+1,x+size-1,y+1);
       line(x+1,y+1,x+1,y+size-1);
       line(x+1,y+size-1,x+size-1,y+size-1);
       line(x+size-1,y+size-1,x+size-1,y-1);
     }
   }
   
   void unitCounter(ArrayList units)
   {
     unitCount.clear();
     for (int i = 0; i< units.size();i++) {
       Unit u = (Unit) units.get(i);
       if (u.pos.x - u.sizeX/2 < x+size && u.pos.x + u.sizeX/2> x) {
         if (u.pos.y - u.sizeX/2 < y+size && u.pos.y + u.sizeX/2 > y) {
           unitCount.append(u.ID);
         }
       }
     }
   }
} // grid class end -------------



