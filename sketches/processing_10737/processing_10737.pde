
/*
5. Play
This project focuses on motion and interaction. To place the focus on those two components exclusively, 
the visual elements will be minimal. 
The visual components of the game are restricted to two lines and two circles on the screen at a time, 
but you may use any motion or interaction technique that you can imagine. 
You many also employ simple typography to keep score or show other basic data.

Name: Kuo-Ang Huang
*/

int scene =0;
String [] titles = {"Force: ", "Pmass: ", "Angle: ", "WindSpeed: ", "Acceleration: ", "Shoot: ", "Hit: "};
float [] value1 = new float[5];
int [] value2 = new int [2];
int shoot =0;
int goal =0;
int tt =0;

PImage mountain;
PImage cloud;
PImage garrow;

PFont txt1;

projectile p1;

target t1;

cloud c1, c2, c3, c4 ,c5, c6, c7, c8, c9 ,c10;

garrow ga1;

Boolean go = false;
Boolean hit = false;

void setup()
{
  size(480, 320);
  background(255);
  smooth();
  
  mountain = loadImage("mountain.png");
  cloud = loadImage("cloud.png");
  garrow = loadImage("apple.png");
  
  txt1 = loadFont("LucidaBright-Italic-20.vlw");
  textFont(txt1);
  
  c1 = new cloud(cX(), cY());
  c2 = new cloud(cX(), cY());
  c3 = new cloud(cX(), cY());
  c4 = new cloud(cX(), cY());
  c5 = new cloud(cX(), cY());
  c6 = new cloud(cX(), cY());
  c7 = new cloud(cX(), cY());
  c8 = new cloud(cX(), cY());
  c9 = new cloud(cX(), cY());
  c10 = new cloud(cX(), cY());
  
  p1 = new projectile(55, 265, 1000.0, 10.0, 30.0, 1.0);  
  t1 = new target(250, 200);

  ga1 = new garrow();
 
}

void draw()
{
  background(70, 200, 245);
  image(mountain, 0, 255);

//=========================START======================================
  if(scene ==0)
  {    
    strokeWeight(2);
    t1.put();
    noStroke();
    fill(0, 0, 255);
    ellipse(55, 265, 15, 15);
    
    c1.go(p1);
    c2.go(p1);
    c3.go(p1);
    c4.go(p1);
    c5.go(p1);
    c6.go(p1);
    c7.go(p1);
    c8.go(p1);
    c9.go(p1);
    c10.go(p1);
    
    fill(255, 100);
    rect(0, 0, 480, 320);
    
    if(overMe(mouseX, mouseY, 210, 140, 65, 20))
      fill(255, 255, 0);
    else
      fill(0);
    textSize(20);
    text("START", 210, 160);
  }
//====================Introduction=====================================
  else if(scene ==1)
  {
    noStroke();
    fill(255, 100);
    rect(0, 0, 480, 320);
    
    fill(0, 0, 255);
    ellipse(50, 50, 15, 15);
    strokeWeight(7);
    stroke(255, 220, 0);
    noFill();
    arc(50, 50, 40, 40, PI/2, PI);
    strokeWeight(2);
    pushMatrix();
    translate(50, 50);
    rotate(radians(-45));
    stroke(0);
    line(0, 0, 25, 0);
    line(25, 0, 20, 5);
    line(25, 0, 20, -5);
    popMatrix();
    fill(0);
    textSize(14);
    text("Use your mouse to drag the froce from the solid ball then\n move your mouse to adjust the angle of ball.\nThe yellow arc indicates the range of the angle.\nThe color of the solid ball indicates the mass of the ball.\nPush \"SPACE\" to fire.", 80, 30);
    
    stroke(255, 0, 0);
    fill(255);
    ellipse(50, 130, 15, 15);
    fill(0);
    text("This is your target.", 80, 135);
    
    image(cloud, 30, 170);
    text("Clouds will indicate the speed and direction of the wind.", 80, 190);
    
    image(garrow, 40, 230);
    text("An apple will indicate the gravity.\n( This is not the Earth gravity =) )", 80, 240);
    
    if(overMe(mouseX, mouseY, 210, 280, 65, 20))
      fill(255, 255, 0);
    else
      fill(0);
    textSize(20);
    text("Ready?", 210, 300);
  }
//=======================Play Ball===================================
  else if(scene ==2)
  {
    value1[0] = p1.f;
    value1[1] = p1.m;
    value1[2] = p1.ang;
    value1[3] = p1.Wv;
    value1[4] = p1.Yacc;
    value2[0] = shoot;
    value2[1] = goal;
    
    textSize(14);
    fill(255);
    text("Push \"SPACE\" to fire!\nPush \"g\" to change the gravity (Cost 1 shoot).\nPush \"e\" to end this game.", 80, 280);
        
    ga1.go(p1);
    
    if(go)
      p1.go();
    else
      p1.stop();
    
    if(!hit)
      t1.put();
    
    if(t1.hit(p1))
      hit = true;
      
    if(p1.touchWall && hit)
    {   
      p1.Wv = random(-30, 30);
      p1.Wang = random(0.0, 360.0);
      p1.m = random(10.0, 20.0);
      p1.mclr = round(map(p1.m, 10, 20, 0, 255));
      p1.ballClr = color(p1.mclr, 0, 255-p1.mclr);
      p1.Yacc = random(-30, 30);
      if(p1.Yacc <0)
      {
        t1.Xloc = random(200, width -50);
        t1.Yloc = random(20, height -100);
      }
      else
      {
        t1.Xloc = random(200, width -50);
        t1.Yloc = random(100, height -20);
      }   
      reset();
      goal++;
    }
    else if(p1.touchWall)
      reset();
    
    c1.go(p1);
    c2.go(p1);
    c3.go(p1);
    c4.go(p1);
    c5.go(p1);
    c6.go(p1);
    c7.go(p1);
    c8.go(p1);
    c9.go(p1);
    c10.go(p1);
    
    for(int i =0; i <7; i++)
    {
      fill(120);
      textSize(12);
      text(titles[i], 345, 20 +i*15);
      if(i <5)
        text(value1[i], 420, 20 +i*15);
      else
        text(value2[i -5], 423, 20 +i*15);
    }
  
  }
//=============================The Result================================
  else if(scene ==3)
  {
    reset();
    p1 = new projectile(55, 265, 1000.0, 10.0, 30.0, 1.0); 
    t1.put();
    noStroke();
    fill(255, 0 ,0);
    ellipse(55, 265, 15, 15);  
    
    c1.go(p1);
    c2.go(p1);
    c3.go(p1);
    c4.go(p1);
    c5.go(p1);
    c6.go(p1);
    c7.go(p1);
    c8.go(p1);
    c9.go(p1);
    c10.go(p1);
    
    fill(255, 100);
    rect(0, 0, 480, 320);
    
    textSize(20);
    fill(0, tt);
    text("Your Result: ", 180, 100);
    fill(0, tt -80);
    text(titles[5], 160, 130);
    text(value2[0], 255, 130);
    fill(0, tt -160);
    text(titles[6], 160, 160);
    text(value2[1], 255, 160);
    
    float hitrate = 0.0;
    if(shoot !=0)
      hitrate = float(goal) / shoot * 100.0;
    fill(0, tt -240);
    text("Hit Rate: ", 160, 190);
    text(hitrate, 245, 190);
    text("%", 330, 190);
    
    if(overMe(mouseX, mouseY, 200, 230, 65, 20))
      fill(255, 255, 0, tt -320);
    else
      fill(0, tt -320);
    text("Restart?", 200, 250);
    
    if(tt <600)
      tt++;
  }
  
}

//========================over the P and color it========================
void mouseMoved()
{
  if(p1.overTheP() && !go)
    p1.ballClr = color(255, 255, 0);
  else
    p1.ballClr = color(p1.mclr, 0, 255-p1.mclr);
}

//========================Adjust Force==================================
void mouseDragged()
{
  if(!go)
  {
    float d = dist(p1.Xori, p1.Yori, mouseX, mouseY);
    d = constrain(d, 0, 50);
    p1.arrowDIS = d;
      
    float arrowX = constrain(mouseX, p1.Xori -50, p1.Xori);
    float arrowY = constrain(mouseY, p1.Yori, p1.Yori +50);    
    p1.getArrow(arrowX, arrowY);   
    
    p1.f = d*25;
  }
  
}

//======================Make Decisions===============================
void mouseReleased()
{
  if(scene ==0) //====Change to play scene========
  {
    if(overMe(mouseX, mouseY, 210, 140, 65, 20))
      scene =1;
  }
  else if(scene ==1)
  {
    if(overMe(mouseX, mouseY, 210, 280, 65, 20))
      scene =2;
  }
  else if(scene ==2)
  {
    if(!p1.overTheP()) // Change P color back if not over it
      p1.ballClr = color(p1.mclr, 0, 255-p1.mclr);
  }
  else if(scene ==3) //=====Back to START======
  {
    if(overMe(mouseX, mouseY, 200, 230, 65, 20))
    {
      shoot =0;
      goal =0;
      tt =0;
      scene =0;
    }
  }
}

void keyPressed()
{
  if(scene ==2)
  {
    if(!go)  //=====Fire=====
      if(key == ' ')
      {
        go = true;
        shoot++;
        p1.ballClr = color(p1.mclr, 0, 255-p1.mclr);
      }
    if(key == 'g')  //=====Change Acceleration======
    {
      p1.Yacc = random(-30, 30);
      shoot++;
    }
    if(key == 'e' && !go)  //=====End Game======
      scene =3;
  }
}

//==============Random the positions================
float cX()
{
  return random(0, width);
}

float cY()
{
  return random(0, height-50);
}

//=========Reset to STOP positon===================
void reset()
{
  hit = false;
  p1.touchWall = false;
  key = '?';
  go = false;
}

//==========Over Me?==============================
boolean overMe(int posX, int posY, int boxX, int boxY, int bsizeX, int bsizeY)
{
   return (posX >boxX && posX <boxX+bsizeX && posY >boxY && posY <boxY+bsizeY);
}

//=========One Cloud==============================
class cloud
{
  float cloudX =0.0;
  float cloudY =0.0;
  
  float WXvel =0.0;
  float WYvel =0.0;
  
  float cloudT =0.0;
  
  cloud(float oriX, float oriY)
  {
    cloudX =oriX;
    cloudY =oriY;   
  }
  
  void go(projectile p)
  {
    
    WXvel =p.Wv*cos(radians(p.Wang));
    WYvel =-p.Wv*sin(radians(p.Wang));
    
    cloudX =cloudX + WXvel*cloudT;
    cloudY =cloudY + WYvel*cloudT;
    
    image(cloud, cloudX, cloudY);
    
    if(cloudX <-50)
    {
      cloudX =width+50.0;
      cloudT =0.0;
    }
    else if(cloudX >width +50)
    {
      cloudX =-50.0;
      cloudT =0.0;
    }
    else if(cloudY <-50)
    {
      cloudY =height+50.0;
      cloudT =0.0;
    }
    else if(cloudY >height+50)
    {
      cloudY =-50.0;
      cloudT =0.0;
    }
  
    cloudT += (1.0/1800.0);
  }
  
}

//======The gravity arrow==================
class garrow
{
  float garrowlocY =0.0;
  float Yacc =0.0;
  float garrowT =0.0;
  
  garrow()
  {
    
  }
  
  void go(projectile p)
  {
    if(p.Yacc <0)
    {
      garrowlocY =height+0.5*p.Yacc*pow(garrowT, 2);
      pushMatrix();
      translate(20, garrowlocY);
      rotate(radians(180));
      image(garrow, -20, -20);
      popMatrix();
      if(garrowlocY <-20)
      {
        garrowlocY =height;
        garrowT =0.0;
      }
    }
    else
    {
      garrowlocY =0.5*p.Yacc*pow(garrowT, 2);
      image(garrow, 20, garrowlocY);
      if(garrowlocY >height+20)
      {
        garrowlocY =0.0;
        garrowT =0.0;
      }
    }
    
    garrowT += (1.0/60.0);
  }
}

//=========Our main char, the Ball=================
class projectile
{
  Boolean touchWall = false;
  
  float f = 0.0;
  float m = 0.0;
  float v = 0.0;
  float init =0.0;
  float ang =0.0;
  float Wv =0.0;
  float Wang =0.0;
  
  float Xori =0.0;
  float Yori =0.0;
  float Xloc =0.0;
  float Xvel =0.0;
  float Xacc =0.0;
  float Yloc =0.0;
  float Yvel =0.0;
  float Yacc =9.81;
  float WXvel =0.0;
  float WYvel =0.0;
  
  float t =0.0;
  
  color ballClr;
  int mclr =0;
  float arrowX = 0.0;
  float arrowY = 0.0;
  float arrowDIS = 0.0;
  
  projectile(float x, float y, float force, float mass, float angle, float initialt)
  {
    Xori = x;
    Yori = y;
    arrowX = Xori -20;
    arrowY = Yori +20;
    f = force;
    m = mass;
    ang = angle;
    init = initialt;    
    v = (f/m)*init;
    arrowDIS = f/25.0;
    
    mclr = round(map(m, 10, 20, 0, 255));
    ballClr = color(mclr, 0, 255-mclr);
  }
  
  void stop()
  {  
    strokeWeight(7);
    stroke(255, 220, 0);
    noFill();
    arc(Xori, Yori, 40, 40, PI/2, PI);
    
    strokeWeight(2);
    noStroke();
    fill(ballClr);
    ellipse(Xori, Yori, 15, 15);
    
    pushMatrix();
    translate(Xori, Yori);
    rotate(radians(-angle(arrowX, arrowY)));
    stroke(0);    
    line(0, 0, arrowDIS, 0);
    line(arrowDIS, 0, arrowDIS -5, 5);
    line(arrowDIS, 0, arrowDIS -5, -5);
    popMatrix();
  }
  
  void go()
  {      
    Xvel = v*cos(radians(ang));
    WXvel = Wv*cos(radians(Wang));
    Xloc = Xori + (Xvel +WXvel)*t + 0.5*Xacc*pow(t, 2);  
        
    Yvel = -v*sin(radians(ang));
    WYvel = -Wv*sin(radians(Wang));
    Yloc = Yori + (Yvel +WYvel)*t + 0.5*Yacc*pow(t, 2);
    
    noStroke();
    fill(ballClr);
    ellipse(Xloc, Yloc, 15, 15);
    
    if(Xloc <-50)
    {
      t = 0.0;
      touchWall = true;
    }    
    else if(Xloc >width+50)
    {
      t = 0.0;
      touchWall = true;
    }
    else if(Yloc <-50)
    {
      t = 0.0;
      touchWall = true;
    }
    if(Yloc >height+20)
    {
      t = 0.0;
      touchWall = true;
    }
    
    t += (1.0/60.0);       
  }
  
  Boolean overTheP()
  {
    float d = dist(p1.Xori, p1.Yori, mouseX, mouseY);
    return (d <=10.0);
  }
  
  void getArrow(float aX, float aY)
  {
    arrowX =aX;
    arrowY =aY;
    ang = angle(arrowX, arrowY);
  }
    
  float angle(float mX, float mY)
  {
    float ang =degrees(atan(-(mY -Yori) / (mX -Xori)));
    ang =constrain(ang, 0.0, 90.0);
    
    if(mX == Xori)
      return 90.0;
    else
      return ang;
  }
   
}

//=========Our victim, the Target============
class target
{
  float Xloc =0.0;
  float Yloc =0.0;
  
  target(float x, float y)
  {
    Xloc = x;
    Yloc = y;    
  }
  
  void put()
  {
    stroke(255, 0, 0);
    fill(255);
    ellipse(Xloc, Yloc, 15, 15);
  }
  
  Boolean hit(projectile p)
  {
    float d =0.0;
    d = sqrt((p.Xloc - Xloc)*(p.Xloc - Xloc) + (p.Yloc - Yloc)*(p.Yloc - Yloc));
    return (d <16.0);    
  }
  
}

