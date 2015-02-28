
/******************************************************************
Made by: Tom Onderwater

Welcome to Air Defense!
The point of the game is to survive for as long as possible. This will
however be really hard because airplanes are always trying to take your 
health down! You can however fight back and try to evade the enemy bullets!
There are two kinds of powerups. a red one and a green one.
The red one enables you to shoot faster and the green one makes you faster.

The use of a mouse is advised but not neccesary.

Go left:    LEFT
Go right:   RIGHT
Power up:   UP or mousescroll up
Power down: DOWN or mousescroll down
Aiming:     Mouse

Have fun!
*******************************************************************/

//all variables
float x = 900;
float power=10;
float barrelFlash=0;
float gravity=0.15;
int planeAmount = 1000;
float health=100;
float heat = 0;
int overheated=0;
int score = 0;
int healthHit = 0;
int metersMoved=0;
float achievementOp = 0;
int hidden = 0;
int game = 2;
int treeAmount;
int shield=0;
float speed=0;

boolean left, right;

//powerups
float shootBoost = 0;
float moveBoost = 0;
float sB=1;
int mB=0;

//tankcolors
int r;
int g=120;
int b;
//tankChoice
int tankChoice=0;
int timer=0;

//all classes
Barrel myBarrel;
ArrayList tanks;
ArrayList bullets;
ArrayList enemyBullets;
ArrayList planes;
ArrayList trees;
ArrayList powerups;
ArrayList bigPlanes;

//moving the tank
void keyReleased() {
  if (keyCode == LEFT) {
    left = false;
  } if (keyCode == RIGHT) {
    right = false;
  }
}

void setup() {
  size(1800, 1000);
  smooth(5);
  frameRate(40);


  myBarrel = new Barrel();
  tanks = new ArrayList();
  bullets = new ArrayList();
  planes = new ArrayList();
  enemyBullets = new ArrayList();
  trees = new ArrayList();
  powerups = new ArrayList();
  bigPlanes = new ArrayList();
  
}

void draw() {
  if (game == 1) { //if the game is running let everything display/load
  //how the level looks
  background(0, 120, 255);
  fill(0, 255, 0);
  noStroke();
  rect(0, height-300, width, 100);
  fill(120);
  noStroke();
  rect(0, height-200, width, 200);
  fill(0);
  rect(0, height-205, width, 10);
  rect(895, height-200, 10, 200);
  
  //setting the speed
    if (tankChoice ==0) {
      speed=5;
    } else if(tankChoice ==1) {
      speed=8;
    } else if(tankChoice ==2) {
      speed=3;
    }
  
  //smooth movement
 if (keyPressed) {
   if(keyCode == LEFT) {
     left = true;
   } if (keyCode == RIGHT) {
     right = true;
   }
 } if (left == true) {
     x-=speed*mB;
     metersMoved++;
   } if (right == true) {
     x+=speed*mB;
     metersMoved++;
   }

  powerMeter();
  healthMeter();                         //all the meters
  heatMeter();
  scoreMeter();
  
  //powerup control
  shootBoost=constrain(shootBoost,0,1000);
  moveBoost=constrain(moveBoost,0,1000);
  shield=constrain(shield,0,1000);
    shootBoost=shootBoost-1;
    if (shootBoost>0) {
    sB=0.5;
  } else {
    sB=1;
  }
    moveBoost=moveBoost-1;
   if (moveBoost>0) {
    mB=2;
  } else {
    mB=1;
  }
  shield=shield-1;

  x=constrain(x, 60, width-60); //constraining the position of the tank
  
  //let the tank go to the other side of the screen when he hits the edge
  if (x<0) {
    x=1800;
  }
  if (x>1860) {
    x=0;
  }
  //constraining the power
  power=constrain(power, 10, 30);
  
  barrelFlash=constrain(barrelFlash, 0, 250); //barrelflash code
  barrelFlash=barrelFlash-12.5;

  heat=constrain(heat, 0, 250); //overheated and heat code
  heat=heat-5/(overheated+1);
  if (heat>240) {
    overheated=1;
  }
 
  if (heat<=2) {
    overheated=0;             //heat code goes untill here
  }
  
  //if you get hit the health becomes yellow for a little bit
  healthHit=constrain(healthHit,0,255);
  if (healthHit > 4) {
    healthHit = healthHit-5;
  }
  //spawning in planes
  float spawn = random(30);
  if (spawn<1) {
    planes.add(new Plane());
  } if (spawn<0.02 && score > 200) {
    bigPlanes.add(new bigPlane(random(0,1), random(30,100), random(3,4)));
  }
//collision between the bullets and the planes
  for (int j=planes.size()-1; j>=0; j--) {
    Plane p = (Plane)planes.get(j);
    for (int i=bullets.size()-1; i>=0; i--) {
      Bullet b = (Bullet) bullets.get(i);
      if (p.Hit(b)) {
        p.isHit();
        b.hit();
      }
    }
  }
  //collision between the bullets and the big planes
  for (int o = bigPlanes.size()-1; o>=0; o--) {
    bigPlane bi = (bigPlane) bigPlanes.get(o);
    for (int i = bullets.size()-1; i>=0; i--) {
      Bullet b = (Bullet) bullets.get(i);
      if (bi.Hit(b)) {
        bi.isHit();
        b.hit();
      }
    }
  }
  //displaying everything
  myBarrel.display();
  for (int t=tanks.size()-1; t>=0; t--) {
    Tank ta = (Tank) tanks.get(t);
    ta.display();
  }
    for (int o=bigPlanes.size()-1; o>=0; o--) {
    bigPlane bi = (bigPlane) bigPlanes.get(o);
    bi.display();
    if (bi.destroy()) {
      bigPlanes.remove(o);
    }
  }
    for (int j=planes.size()-1; j>=0; j--) {
      Plane p = (Plane) planes.get(j);
    p.move();
    p.display();
    if (p.destroyed()) {
      planes.remove(j); //remove from ArrayList
    }
  }
  for (int i=bullets.size()-1; i>=0; i--) {
    Bullet b = (Bullet) bullets.get(i);
    b.display();
    b.move();
    if (b.destroy()) {
      bullets.remove(i); //remove from ArrayList
    }
  }
    for (int l=enemyBullets.size()-1; l>=0; l--) {
      enemyBullet e = (enemyBullet) enemyBullets.get(l);
   e.display();
   e.move();
   if (e.destroyed()) {
     enemyBullets.remove(l); //remove from ArrayList
   }
 }
   //collision between trees and enemy bullets
   for (int l=enemyBullets.size()-1; l>=0; l--) {
     enemyBullet e = (enemyBullet) enemyBullets.get(l);
     for (int t = trees.size()-1; t>=0; t--) {
       Tree Tr = (Tree) trees.get(t);
       if(Tr.destroyed(e)) {
         Tr.removeTree(); //not removing the tree, but only showing a treetrunk
       }
     }
   }
   
   if (mouseY<700) { //cursor code
    noCursor();
    fill(0, 0, 0, 0);
    strokeWeight(2);
    stroke(0);
    ellipse(mouseX, mouseY, 20, 20);
    line(mouseX-15, mouseY, mouseX+15, mouseY);
    line(mouseX, mouseY-15, mouseX, mouseY+15);
  } 
  else {
    cursor(HAND); //end of cursor code
  }
  
  //displaying the powerups
  for (int p=powerups.size()-1; p>=0; p--) {
    Powerup po =(Powerup) powerups.get(p);
    po.display();
    if (po.destroy()) {
      powerups.remove(p);
    }
  }
  
    //spawning in trees
    for (int t=0; t<treeAmount; t++) {
      treeAmount-=1;
      trees.add(new Tree(int(random(width))));
    }
  //displaying the trees
     for (int t=trees.size()-1; t>=0; t--) {
       Tree Tr = (Tree)trees.get(t);
    Tr.display();
     }
     
  
  //the achievements
    if(achievementOp >0) {
    achievementOp=achievementOp-1;
  }
  if (score > 49 && score < 60 && metersMoved == 0) {
    achievementOp=255;
  score=score+50;
    }
    fill(220,220,220,achievementOp);
    textSize(40);
    text("Achievement unlocked",20,40);
    textSize(30);
    text("not so mobile fortress",20,90);
    
    //loading the endmenu/ending the game
    if (health <=0) {
      game = 0;
    }
  }
  //displaying the endmenu with the score
  if (game == 0) {
   endMenu();
  }
  //displaying the starting menu
  if (game ==2) {
    startMenu();
  timer-=1;
  timer=constrain(timer,0,100);
  }
}

//if the mouse is pressed a bullet is spawned in at the end of the barrel
void mousePressed() {
  if (mouseY<700 && overheated==0 && game == 1) {
    bullets.add(new Bullet((((((mouseX-x)/((sqrt(sq(mouseX-x)))+(sqrt(sq(mouseY-680))))*80)+x))),
    ((((mouseY-680)/((sqrt(sq(mouseX-x)))+(sqrt(sq(mouseY-680))))*80)+680)), 10));
    barrelFlash=250;                        //barrelflash code
    heat=heat+(((5*power)+10)*sB);
  }
}
//moving the tank around and changing the power
void keyPressed() {
     if (key == CODED) {
     if (keyCode == UP) {
      power++;
    } 
    else if (keyCode == DOWN) {
      power--;
    }
  }
  }
//using the mouseWheel to change the power
void mouseWheel(MouseEvent event) {
  if (game == 1) {
  power=power-event.getAmount();
  }
}

//all meters and stuff

void powerMeter() {
  float i=200;
  noStroke();
  for (int c=0; c<=power-10; c++) {
    fill(255, 255-(c*10), 0);
    rect(i-30, 825, 12, 50);
    i=i+12;
  }
  stroke(0);
  line(170, 825, 170, 875);
  textSize(30);
  fill(255);
  text("POWER", 20, 862);
  fill(0, 0, 0, 50);
  stroke(0);
  strokeWeight(5);
  rect(-10, 825, 430, 50);
}

void heatMeter() {
  if (overheated==0) {
    noStroke();
    fill(255, 255, 255, 150);
    rect(750, height-20, 50, -(heat*0.5));
    strokeWeight(5);
    stroke(0);
    fill(0, 0, 0, 0);
    rect(750, height-20, 50, -125);
    arc(775, height-145, 50, 80, PI, TWO_PI);
    line(750, height-50, 800, height-50);
  } 
  else {
    strokeWeight(5);
    fill(int(random(0, 255)));
    rect(750, height-20, 50, -125);
    arc(775, height-145, 50, 80, PI, TWO_PI);
    line(750, height-50, 800, height-50);
  }
  fill(255);
  text("HEAT", 500, height-80);
  text("OVERHEATED", 500, height-135);
  strokeWeight(1);
  line(600, height-90, 750, height-90);
  line(700, height-145, 750, height-145);
}
void healthMeter() {

  fill(255, healthHit, 0);
  noStroke();
  rect(170, height-75, health*2.5, 50);
  fill(255);
  text("HEALTH", 20, height-38);
  fill(0, 0, 0, 50);
  strokeWeight(5);
  stroke(0);
  line(170, height-75, 170, height-25);
  rect(-10, height-75, 430, 50);
}
void scoreMeter() {
  fill(255);
  String message = "SCORE  "+score;
  text(message, 1000, 900);
}



 class Barrel {
   int Bl = 0;
   void display() {
     pushMatrix();
     float Yp=mouseY; //the mouse is never below the ground, making sure the barrel doesn't rotate fully
  Yp=constrain(Yp,0,680);
  translate(x, 680);
  float a = atan2(Yp-680, mouseX-x); //rotating the barrel towards the mouse position
  rotate(a);
  fill(255,255,0,barrelFlash);
  noStroke();
  ellipse(65+power,0,power*3,5+(power/3)); //the barrelflash
  if (sB < 1) {
    Bl=255;
  } else {
    Bl=0;
  }
  if (overheated == 1) {
    fill(heat,0,Bl); //barrel turns red when overheated
  } else {
  fill(0,0,Bl);
  }
  rect(0, -5, 60, 10);
  popMatrix();
   }
 }

class bigPlane {
  float xpos;
  float ypos;
  float speed;
  float dir;
  float health=3;
  
  bigPlane(float tempXpos, float tempYpos, float tempSpeed) {
    if (tempXpos<=0.5) {
      xpos=-90;
      dir =1;
    } else if(tempXpos>0.5) {
      xpos=1890;
      dir=-1;
    }
    speed=tempSpeed;
    ypos=tempYpos;
  }
  void display() {
    float bomb = random(0,40);
    if (bomb<1) {
      enemyBullets.add(new enemyBullet(xpos,ypos+40,1));
    } if (bomb>38.5) {
      enemyBullets.add(new enemyBullet(xpos+50*dir,ypos+20,0));
    }
    xpos+=speed*dir;
    float d = -dir;
    float vlam=random(30,40);
    fill(100);
    stroke(0);
    ellipse(xpos-d*100,ypos,80,40);
    rect(xpos-100*d,ypos-20, 200*d, 40);
    triangle(xpos+d*40,ypos+20,xpos+d*120,ypos+20,xpos+d*120,ypos-60);
    fill(255);
    rect(xpos-d*110,ypos-15,d*10,10);
    triangle(xpos-d*135,ypos-5,xpos-d*115,ypos-5,xpos-d*115,ypos-15);
    fill(255,255,0);
    ellipse(xpos+d*10,ypos+23,vlam,12);
    fill(100);
    rect(xpos-d*45,ypos+15,d*60,15);
    arc(xpos-d*20,ypos+10,50,70,0,PI,CHORD);
    noStroke();
    rect(xpos+d*30,ypos-19,70*d,39);
    stroke(0);
  
    if (health==0) {
      powerups.add(new Powerup(xpos, ypos, random(1,3)));
      score+=10;
      speed=0;
      ypos=2000;
    } if (xpos>1900 || xpos<-100) {
      speed=0;
      ypos=2000;
      health=health-5;
      healthHit+=100;
    }
  }
  void isHit() {
    health=health-1;
  }
  boolean destroy() {
    if (ypos==2000) {
      return true;
    }
      else {return false;}
    }
  
    boolean Hit(Bullet b) {
        if (dist(xpos,ypos,b.X,b.Y)<b.W && b.timer<1 || b.Y>ypos-20 && b.Y<ypos+20 && b.X>xpos-150 && b.X<xpos+150 && b.timer<1) {
          return true;
        } else return false; 
        }
} 

  

class Bullet {

  float X;
  float Y;
  float W;
  float yspeed1=(mouseY-680)/((sqrt(sq(mouseX-x)))+(sqrt(sq(mouseY-680)))); //calculating the speed in y pt1
  float xspeed1=(mouseX-x)/((sqrt(sq(mouseX-x)))+(sqrt(sq(mouseY-680)))); //calculating the speed in x pt1
  float yspeed=(yspeed1/(sqrt(sq(xspeed1)+sq(yspeed1))))*power; //pt2
  float xspeed=(xspeed1/(sqrt(sq(xspeed1)+sq(yspeed1))))*power; //pt2
  float op=255; //not doing anything with it, didn't like it that much, still keeping it
  float splosionsize=power; //EXPLOSIONS!
  float timer;
  
  Bullet(float tempX, float tempY, float tempW) {
    X=tempX;
    Y=tempY;
    W=10;
    timer=0;
  } 
  void move() {
    X=X+xspeed;
    Y=Y+yspeed;
    
    timer=constrain(timer,0,50);
    timer-=1;
  }
  void display() {
    noStroke();
    fill(255, 255, 0, op);
    ellipse(X,Y,W,W);

    if (W>10) {
      W=W-(2*(splosionsize/4)); //EXPLOSIONS!
      timer=50;
    }

    if (W<10 || W>10 && W<25) { //if W is small enough send the bullet to a far away place. just to get instantly removed from the ArrayList i mean why not?
      X=5000;
      W=10;
    }
  }
  void hit() { //EXPLOSIONS!
    yspeed=0;
    xspeed=0;
    W=15*(splosionsize/2);
  }
  
  boolean destroy() {
    if (X>width+60 || X < -60 || Y < -50 || Y > 800) return true; // if the bullet is out of screen remove it
    else return false;
  }
}

class Plane {
  float Dir; //what direction is the plane flying in?
  float speed; 
  float planeHeight; //how heigh does the plane fly?
  float xPos;
  float rDir=random(0, 1);
  int planeColor=200;

  Plane() {
    if (rDir>0.5) { //randomizing the direction of the plane
      Dir = 1;
      xPos=-50;
    } 
    else {
      Dir = -1;
      xPos=1850;
    }
    speed = random(3, 8)*Dir; //random speed
    planeHeight=random(30, 300); //random height
  }
  void move() { //moving the plane
    xPos+=speed;
    if (xPos<-50 || xPos>1850) {
      planeHeight=2000;
      xPos = 1000;
      speed=0;
      health = health-2; // if the plane hits the edge -2 health
      healthHit = healthHit+50;
    }
    //shooting
    //random shooter:D
    float shoot;
    if (score<600) {
     shoot = random(0,700-score);
    } else {shoot = random(0,100);}
    if (shoot < 1.5 && planeHeight<1000) {
      enemyBullets.add(new enemyBullet(xPos, planeHeight,0)); //add an enemyBullet at the location of the plane
   }
  }
  void display() {
    float s=0.75;
    float vlam=random(30, 50); //flames at the back of the plane :D
    fill(planeColor);
    strokeWeight(2);
    triangle(xPos-((50*-Dir)*s), planeHeight, xPos, planeHeight-(40*s), xPos, planeHeight);
    triangle(xPos+((100*-Dir)*s), planeHeight, xPos+((100*-Dir)*s), planeHeight-(15*s), xPos+((50*-Dir)*s), planeHeight);
    fill(255, 255, 0.200);
    ellipse(xPos+(110*-Dir)*s, planeHeight, vlam*s, 10*s);
    fill(planeColor);
    ellipse(xPos, planeHeight, (-Dir*200)*s,(20*s));
    triangle(xPos+((100*-Dir)*s), planeHeight, xPos+((100*-Dir)*s), planeHeight+(20*s), xPos+((50*-Dir)*s), planeHeight);
    //triangle(xPos+((90*Dir)*s),planeHeight-(5*s),xPos+((100*Dir)*s),planeHeight-(20*s),xPos+((50*Dir)*s),planeHeight-(5*s));
    triangle(xPos-((50*-Dir)*s), planeHeight, xPos, planeHeight+(50*s), xPos, planeHeight);
    fill(255);
    ellipse(xPos-((40*-Dir)*s), planeHeight-(8*s), 30*s, 10*s);
  }
  void isHit() {
       float spawnUp= random(0,200+score); // add a powerup
   if (spawnUp<10) {
     powerups.add(new Powerup(xPos, planeHeight, random(1,3)));
   }
    planeHeight=2000;
    speed=0;
    score = score+1;
  }

  boolean Hit(Bullet b) { //checking if the plane is hit
    float d = dist(xPos, planeHeight, b.X, b.Y);

    if (d<50+(b.W/1.5) && xPos<width+50 && xPos > -50 && planeHeight < 700 && planeHeight > 0 || b.Y > planeHeight-15 && b.Y<planeHeight+15 && b.X>xPos-80 && b.X<xPos+80) {
      return true;
    } 
    else {
      return false;
    }
  }
  boolean destroyed() { //removing the plane from the ArrayList
    if (planeHeight > 1000) return true;
    else return false;
  }
}

class Powerup {
  float xPos;
  float yPos;
  float Cl;
  float ySpeed=0;
  float red= 0;
  float green = 0;
  float blue = 0;
  float timer;
  float Gravity;
  
  Powerup(float tempXpos, float tempYpos, float tempColor) {
    xPos = tempXpos;
    yPos = tempYpos;
    Cl = tempColor;
    timer = 600;
    Gravity = gravity;
  }
  void display() {
      timer-=1;
      ySpeed+=Gravity;
      yPos+=ySpeed;
      if (timer<120) {
        stroke(int(random(0,255)));
      }
      
    if (Cl <= 1.2) {
      red=255;
    }
    if (Cl >1.2 && Cl <= 2.4) {
      green=255;
    }
    if (Cl > 2.4) {
      blue=255;
    }
    fill(red,green,blue);
    rect(xPos-10,yPos-10,20,20);
    if (yPos > 700) {
      ySpeed=0;
      Gravity=0;
    }
    if (x+60>xPos-10 && x-60<xPos+10 && yPos > 690) {
      if (Cl <= 1.2) {
        shootBoost = 1000;
      } if (Cl > 1.2 && Cl <= 2.4) {
        moveBoost = 1000;
      } if (Cl > 2.4) {
        shield =1000;
      }
    }
  } boolean destroy() {
    if (timer < 0|| x+60>xPos-10 && x-60<xPos+10 && yPos >690)return true;
    else return false;
  }
}
    
    
class Tank {
  int red;
  int green;
  int blue;
  
  Tank(int tempRed, int tempGreen, int tempBlue) {
    red = tempRed;
    green = tempGreen;
    blue = tempBlue;
  }
  
  void display() { //displaying the tank
    float xpos=x;
    float ypos=height-300;
    
    //tank 1
    if (tankChoice == 0) {
    strokeWeight(5);
    fill(red,green,blue);
    if (shield>0) { 
    stroke(0,0,255);
    } else {
      stroke(0);
    }
    ellipse(xpos,ypos-20,40,20);
    strokeWeight(3);
    ellipse(xpos,ypos-10,120,20);
    noStroke();
    rect(xpos-61,ypos-10,122,20);
    strokeWeight(3);
    stroke(0);
    line(xpos-61,ypos-10,xpos-61,ypos+10);
    line(xpos+61,ypos-10,xpos+61,ypos+10);
    strokeWeight(3);
    if (mB > 1) {
    fill(255,0,0);
    } else {
      fill(120);
    }
    for (float p=xpos-50; p<xpos+51; p=p+25) {
      ellipse(p,ypos+10,20,20);
    }
    line(xpos+50,ypos+20,xpos-50,ypos+20);
    line(xpos+50,ypos,xpos-50,ypos);
    }
    //tank 2
    if (tankChoice ==1) {
      noStroke();
      if (mB > 1) {
        fill(255,0,0,150);
      }  else {
  fill(0,0,255,150);
      }
      if (shield>0) {
        stroke(0,0,255);
      } else {
        stroke(0);
      }
  ellipse(xpos,ypos+5,120,20);
  fill(r,g,b);
  strokeWeight(5);
  ellipse(xpos,ypos-20,40,20);
  strokeWeight(3);
  beginShape();
  vertex(xpos-60,ypos);
  vertex(xpos+60,ypos);
  vertex(xpos+50,ypos-10);
  vertex(xpos+30,ypos-20);
  vertex(xpos-30,ypos-20);
  vertex(xpos-50,ypos-10);
  endShape(CLOSE);
  fill(0);
  stroke(0);
  rect(xpos-61,ypos,122,5);
    }
    
    //tank 3
    if (tankChoice == 2) {
  fill(r,g,b);
   if (shield>0) {
     stroke(0,0,255);
   } else {
     stroke(0);
   }
  strokeWeight(5);
    ellipse(xpos,ypos-20,40,20);
    strokeWeight(3);
    beginShape();
    vertex(xpos-70,ypos+5);
    vertex(xpos+70,ypos+5);
    vertex(xpos+50,ypos-17);
    vertex(xpos+35,ypos-20);
    vertex(xpos-35,ypos-20);
    vertex(xpos-50,ypos-17);
    endShape(CLOSE);
    fill(200);
    stroke(0);
    if(mB > 1) {
      fill(255,0,0);
    } else {
      fill(120);
    }
    for(float p=xpos-60; p<xpos+61; p=p+20) {
      ellipse(p,ypos+10,20,20);
    }
    line(xpos-60,ypos,xpos+60,ypos);
    line(xpos-60,ypos+20,xpos+60,ypos+20);
  }
}
}
class enemyBullet {
  
  float X;
  float Y;
  float xspeed;
  float yspeed;
  float W;
  float l = 0;
  float hit;
  float sp = 5;
  float x1;
  float y1;
  float power=random(1.5,3.5);
  int id;
  
  enemyBullet(float tempX, float tempY, int tempid) {
    X=tempX;
    Y=tempY;
    id=tempid;
    if (tempid ==0) {
  float xSpeed1=(x-X)/((sqrt(sq(x-X)))+(sqrt(sq(680-Y)))); //calculating how to shoot
  float ySpeed1=(680-Y)/((sqrt(sq(x-X)))+(sqrt(sq(680-Y))));
  xspeed=(xSpeed1/(sqrt(sq(xSpeed1)+sq(ySpeed1)))*random(4.5-hidden,5.5+hidden)*power); //if hidden it is less accurate
  yspeed=(ySpeed1/(sqrt(sq(xSpeed1)+sq(ySpeed1)))*random(4.5-hidden,5.5+hidden)*power);
    } else if(id ==1) {
      xspeed=0;
    }
    W=10;
    hit = 0;
    x1=x;
    y1=700;
  }
  void move() {
    if (id == 1 && W==10) {
      yspeed+=gravity;
    }
    X=X+xspeed;
    Y=Y+yspeed;
    
    if(W>10) {
      W=W-10.1;
    }
          
    if (W<10) { //sending it away to a far away place
 X=500;
 Y=3000;
 W=10;
    }
      
    }
  void display() { //displaying the bullet
    fill(255,255,0);
    if (id == 0) {
    stroke(255,l,0);
    strokeWeight(2);
    } if(id == 1) {
      if (l==255) {
        stroke(255,255,0);
        fill(255,255,0);
      } else {
        stroke(0);
        strokeWeight(5);
        fill(0);
      }
    }
    ellipse(X,Y,W,W);
    
    if (dist(X,Y,x,y1)<50+W) { //calculating a hit
    if (shield < 1) {
      if(tankChoice ==0) {
        if (id==0) {
   health = health-10;
        } if (id==1) {
          health = health-15;
        }
      } else if(tankChoice ==1) {
        if (id==0) {
        health=health-15;
        } if (id==1) {
          health = health-20;
        }
      } else if(tankChoice==2) {
        if (id==0) {
        health=health-5;
        } if (id==1) {
          health = health-8;
        }
      }
   healthHit = healthHit+100;
    }
    shield-=250;
 y1=4000;
 x1=4000;
 if (id==0) {
 W=140;
 } else {
   W=220;
 }
 xspeed=0;
 yspeed=0;
 l=255;
    }
 if (Y>y1 && Y<y1+20) { //ENEMY EXPLOSIONS!
 y1=4000;
 x1=4000;
 if (id==0) {
 W=100;
 } else {
   W=160;
 }
 xspeed=0;
 yspeed=0;
 l=255;
}
  }
  boolean destroyed() { //if it is out of screen remove the bullet
    if (Y >1000) return true;
    else return false;
  }
}

class Tree {
  
  int xPos;
  int yPos;
  int dxPos; //guess what it is... it is a treeTrunk locator!
  int treeSize;
  int stump; //yes, stump, should be trunk but pfff at least it is random
  
 Tree(int tempxPos) { //random loactions
 xPos = tempxPos;
 yPos = 640;
 dxPos= tempxPos;
 treeSize = int(random(50,70));
 stump = int(random(20,40));
}

void display() { //displaying the trees
  stroke(0);
    fill(100,50,0);
  rect(dxPos,730-stump,12,stump); //displaying the trunk when the tree is gone
    fill(120,75,0);
  rect(xPos,yPos,12,90); //tree
  fill(75,255,75);
  ellipse(xPos+6,yPos,treeSize,treeSize); //leaves
  if (dist(x,640,xPos,yPos)<100) {
    hidden=2;
  } else {
    hidden = 0;
  }
}
boolean destroyed(enemyBullet eB) { //checking if an enemy hits it
 float d = dist(eB.X,eB.Y,dxPos,yPos+70);
 if (d<10+eB.W) {
   return true;
 } else {
   return false;
 }
}
void removeTree() { //just sending the tree to somewhere far away
  xPos = 1000;
  yPos = -500;
}
}
void endMenu() {
      fill(255);
    textSize(100);
    text("    GAME OVER", (width/2)-400, (height/2)-200); //this appears once you are dead
    textSize(50);
    text("       SCORE = "+score, (width/2)-250, (height/2));
    cursor(ARROW);
    fill(255,0,0,120);
    rect(width/2-200,650,400,100);
        fill(255);
    text("continue",width/2-100,710);
    if (mouseX>700 &&mouseX<1100 && mouseY>650 && mouseY<750) {
      cursor(HAND);
      if (mousePressed) { //brings you to startMenu
      game = 2; //resetting everything!
      score = 0;
      metersMoved = 0;
      x=900;
      health=100;
      heat = 0;
      power = 10;
      shootBoost = 0;
      moveBoost = 0;
      shield = 0;
      //removing everything there was in the level
      for (int i = bullets.size()-1; i>=0; i--) { 
        Bullet b = (Bullet) bullets.get(i);
        bullets.remove(i);
      }
      for (int j = planes.size()-1; j>=0; j--) {
        Plane p = (Plane)planes.get(j);
        planes.remove(j);
      }
      for (int l = enemyBullets.size()-1; l>=0; l--) {
        enemyBullet e = (enemyBullet)enemyBullets.get(l);
        enemyBullets.remove(l);
      }
      for (int t = tanks.size()-1; t>=0; t--) {
        Tank ta = (Tank)tanks.get(t);
        tanks.remove(t);
      }
      for (int t = trees.size()-1; t>=0; t--) {
        Tree tr = (Tree)trees.get(t);
        trees.remove(t);
      }
      for (int p = powerups.size()-1; p>=0; p--) {
        Powerup po = (Powerup) powerups.get(p);
        powerups.remove(p);
      }
      for (int o = bigPlanes.size()-1; o>=0; o--) {
        bigPlane bi = (bigPlane) bigPlanes.get(o);
        bigPlanes.remove(o);
      }
    }
  }
}

void startMenu() {
  //background
  fill(0, 120, 255);
  rect(0,0,width,height);
  fill(0, 255, 0);
  noStroke();
  rect(0, height-300, width, 300);
  noStroke();
  fill(255,255,255,100);
  rect(0,0,width,height);
   /* for(int ad=0; ad<50; ad++) {
    fill(ad*5,ad*5,ad*5,150);
    rect(0,1010-(10*ad),width,-10*ad);
  }*/
  cursor(ARROW);
  
  if (mouseX>50 && mouseX<450 && mouseY>150 && mouseY<250) {
  cursor(HAND);
  if (mousePressed) {
    treeAmount = int(random(10,30));
    game = 1;
    tanks.add(new Tank(r,g,b));
  }
}
  fill(255,0,0);
  rect(50,150,400,100);
  fill(255);
  textSize(60);
  text("START GAME", 60, 230);
  
  //color pickers
  //red
  noStroke();
  if(mouseX>50 && mouseX < 305 && mouseY > 440 && mouseY < 480) {
    cursor(HAND);
    if(mousePressed) {
      r = int(mouseX-50);
    }
  }
    for(int aa = 0; aa<255; aa++) {
      fill(aa,0,0);
  rect(50+aa,height/2-60,1,40);
    }
    fill(r,0,0);
    strokeWeight(4);
    stroke(0);
    rect(375,height/2-60,40,40);
    noFill();
    rect(r+46,440,8,40);
  //green
  noStroke();
    if(mouseX>50 && mouseX < 305 && mouseY > 500 && mouseY < 540) {
    cursor(HAND);
    if(mousePressed) {
      g = int(mouseX-50);
    }
  }
    for(int ab = 0; ab<255; ab++) {
      fill(0,ab,0);
  rect(50+ab,height/2,1,40);
    }
    fill(0,g,0);
    strokeWeight(4);
    stroke(0);
    rect(375,height/2,40,40);
    noFill();
    rect(g+46,500,8,40);
  //blue
  noStroke();
    if(mouseX>50 && mouseX < 305 && mouseY > 560 && mouseY < 600 ) {
    cursor(HAND);
    if(mousePressed) {
      b = int(mouseX-50);
    }
  }
    for(int ab = 0; ab<255; ab++) {
      fill(0,0,ab);
  rect(50+ab,height/2+60,1,40);
    }
    fill(0,0,b);
    strokeWeight(4);
    stroke(0);
    rect(375,height/2+60,40,40);
    noFill();
    rect(b+46,560,8,40);
  
  //the color you pick
  fill(r,g,b);
  rect(50,660,365,100);
  //little randomizer
  if (mouseX>50 && mouseX<415 && mouseY>660 && mouseY<760) {
    cursor(HAND);
    if (mousePressed && timer<1) {
      timer=5;
      r=int(random(255));
      g=int(random(255));
      b=int(random(255));
    }
  }
  
  //divider lines
  strokeWeight(5);
  line(600,0,600,height);
  line(1200,0,1200,height);
  
  //landscape for the tank
  fill(0,255,0);
  rect(600,520,600,500);
  fill(0,120,255);
  rect(600,0,600,520);
  
  //the arrows for picking your tank
       if (tankChoice>0 && mouseX>650 && mouseX<700 && mouseY>450 && mouseY<550) {
         cursor(HAND);
         if (mousePressed && timer<1) {
      tankChoice-=1;
      timer=10;
      }
    }  if (tankChoice<2 && mouseX>1100 && mouseX<1150 && mouseY>450 && mouseY<550) {
      cursor(HAND);
      if (mousePressed && timer<1) {
        tankChoice+=1;
        timer=10;
      }
    }
  if(tankChoice>0) {
    fill(255,255,255,100);
    triangle(650,500,700,450,700,550);
  }
  if(tankChoice<2) {
    fill(255,255,255,100);
    triangle(1150,500,1100,450,1100,550);
  }
  
  //displaying the picked tank with the picked color :D
  float xpos = width/2;
  float ypos = height/2;
  if(tankChoice==0) {
  //the barrel
  pushMatrix();
     float Yp=mouseY;
  Yp=constrain(Yp,0,465);
  translate(xpos, ypos-35);
  float a = atan2(Yp-465, mouseX-xpos);
  rotate(a);
 fill(0);
  rect(0, -10, 120, 20);
  popMatrix();
  
  strokeWeight(10);
    fill(r,g,b);
    stroke(0);
    ellipse(xpos,ypos-40,80,40);
    strokeWeight(6);
    ellipse(xpos,ypos-20,240,40);
    noStroke();
    rect(xpos-122,ypos-20,244,40);
    strokeWeight(6);
    stroke(0);
    line(xpos-122,ypos-20,xpos-122,ypos+20);
    line(xpos+122,ypos-20,xpos+122,ypos+20);
    fill(120);
    strokeWeight(6);
    for (float p=xpos-100; p<xpos+101; p=p+50) {
      ellipse(p,ypos+20,40,40);
    }
    line(xpos+100,ypos+40,xpos-100,ypos+40);
    line(xpos+100,ypos,xpos-100,ypos);
  }
  if(tankChoice==1) {
    //the barrel
    pushMatrix();
     float Yp=mouseY;
  Yp=constrain(Yp,0,465);
  translate(xpos, ypos-35);
  float a = atan2(Yp-465, mouseX-xpos);
  rotate(a);
 fill(0);
  rect(0, -10, 120, 20);
  popMatrix();
  //the tank
    noStroke();
  fill(0,0,255,150);
  ellipse(xpos,ypos+10,240,40);
  fill(r,g,b);
  strokeWeight(10);
  stroke(0);
  ellipse(xpos,ypos-40,80,40);
  strokeWeight(6);
  beginShape();
  vertex(xpos-120,ypos);
  vertex(xpos+120,ypos);
  vertex(xpos+100,ypos-20);
  vertex(xpos+60,ypos-40);
  vertex(xpos-60,ypos-40);
  vertex(xpos-100,ypos-20);
  endShape(CLOSE);
  fill(0);
  rect(xpos-122,ypos,244,10);
  }
  if (tankChoice == 2) {
    //the barrel
     pushMatrix();
     float Yp=mouseY;
  Yp=constrain(Yp,0,465);
  translate(xpos, ypos-35);
  float a = atan2(Yp-465, mouseX-xpos);
  rotate(a);
 fill(0);
  rect(0, -10, 120, 20);
  popMatrix();
    //the tank
      fill(r,g,b);
    stroke(0);
  strokeWeight(10);
    ellipse(xpos,ypos-40,80,40);
    strokeWeight(6);
    beginShape();
    vertex(xpos-140,ypos+10);
    vertex(xpos+140,ypos+10);
    vertex(xpos+100,ypos-34);
    vertex(xpos+70,ypos-40);
    vertex(xpos-70,ypos-40);
    vertex(xpos-100,ypos-34);
    endShape(CLOSE);
    fill(200);
    for(int i=780; i<1022; i+=40) {
      ellipse(i,ypos+20,40,40);
    }
    line(xpos-120,ypos,xpos+120,ypos);
    line(xpos-120,ypos+40,xpos+120,ypos+40);
}
}


