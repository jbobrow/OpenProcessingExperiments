
//Copyright 2013
//D. John Kirby

Spring s, p, ans;
Pendulum pen, pen2, comp1, comp2, comp3;
int simNum =-1, count;

void mouseDragged()
{
 s.clicked();
 if(simNum == 1 || simNum == 2 || simNum == 3)
   s.display();
 p.clicked();
 if(simNum == 3)
   p.display();
 pen.clicked();
 if(simNum ==4)
   pen.display();
 pen2.clicked();
 if(simNum == 5)
   pen2.display();
 comp1.clicked();
 comp2.clicked();
 if(simNum == 6)
 {
   comp1.display();
   comp2.display();
 }
 if(simNum == 7)
 {
   comp1.display();
   comp2.display();
   comp3.display();
 }
}
void mouseReleased()
{
 s.released();
 p.released();
 pen.released();
 pen2.released();
 comp1.released();
 comp2.released();
}

void initializeAll()
{
   s = new Spring(width/2,height/4,width/4,height/4,10.0,1000.0);
   ans = new Spring(width/2,height/2,width/4,height/2,10.0,1000.0);
   p = new Sproing(width/2,3*height/4,width/4,3*height/4,10.0,100000.0);
   pen = new Pendulum(width/2,0,3*width/4,3*height/4);
   pen2 = new Pendulum(width/2,height/2,3*width/4,height/2-50);
   comp1 = new Pendulum(width/2,height/2,3*width/4,3*height/4);
   comp2 = new Pendulum(3*width/4,3*height/4,4*width/5,4*height/5); 
   comp3 = new Pendulum(4*width/5,4*height/5, 3*width/4,3*height/4);
}
void setup()
{
  size(400,650);
  rectMode(CENTER);
  initializeAll();  
}

void draw()
{
 if(keyPressed)
    {
      background(255);
      if(key == '1')
      {
        translate(0,-height/4);
        count = 0;
        simNum = 1;
      }
      else if(key == '2')
        simNum = 2;
      else if(key == '3')
       simNum =3;
      else if(key == '4')
        simNum = 4;
      else if(key == '5')
        simNum = 5;
      else if(key == '6')
        simNum = 5;
      else if(key == 'q')
        simNum = -1;
      initializeAll();
    }
 if(simNum == -1)
 {  
  background(255);
  textSize(20);
  fill(0);
  text("Select your simulation", 0, 0);
  text( "1: Proves springs are sinusoidal", 0,20);
  text("2: compare analytical to computational", 0, 40);
  text("solution",0,60);
  text("3: compare real spring to -kx^2 spring",0,80);
  text("4: simulates a simple pendulum",0,100);
  text("5: simulates a pendulum that goes above its own pivot",0,120);
 // text("6: simulates a compound pendulum",0,140);
  //text("7: THREE COMPUND PENDULA!",0,160);
  text("Press q to stop your simulation", 0,180);
  text("Click and drag on equilibrium points and masses",0,200);
  text("to move them",0,220);
 } 
 
 
 else if(simNum == 1)
 {
  count++;
  translate(0,-height/4 + count);
  s.move();
  s.display(); 
 }
 else if(simNum == 2)
 {
 background(0);
 ans.analyticalMove();
 s.move();
 ans.display();
 s.display();
}
 else if (simNum == 3)
 {
  background(0);
  s.move();
  p.move();
  s.display();
  p.display(); 
 }
 else if (simNum == 4)
 {
  background(0);
  pen.move();
  pen.display(); 
 }
 else if(simNum == 5)
 {
   background(0);
   pen2.move();
   pen2.display();
 }
 else if (simNum == 6)
 {
   background(0);
   comp2.pivotX = comp1.bobX;
   comp2.pivotY = comp1.bobY;
   comp1.move();
   comp2.move();
   comp1.display();
   comp2.display();
 }
else if(simNum == 7)
{
  background(0);
   comp2.pivotX = comp1.bobX;
   comp2.pivotY = comp1.bobY;
   comp3.pivotX = comp2.bobX;
   comp3.pivotY = comp2.bobY;
   comp1.move();
   comp2.move();
   comp3.move();
   comp1.display();
   comp2.display();
   comp3.display();
}
}
class Spring
{
 float equiX, equiY, x, y, mass, xvel, yvel, constant, amp;
 boolean isClicked, equiClicked; // lets you move both the equilibrium and the do-bobber
 
 Spring( float equiX, float equiY, float x, float y, float constant, float mass)
 {
   this.equiX = equiX;
   this.equiY = equiY;
   this.x = x;
   this.y = y;
   this.constant = constant;
   this.mass = mass;
   xvel = 0;
   yvel = 0;
   amp = x-equiX;
   isClicked = false;
 } 
 
 void display()
 {
   stroke(100,20,244);
   //Make a bunch of cool jagged lines to show that this is a spring and not a
   //mass on a stretchy rope.
   line(equiX, equiY, x, y);
   fill(255,100,20);
   stroke(0);
   rect(x,y,10,10);
 }
 //This function uses good ol' Euler differenerntial equation solving to 
 //Show us how a spring ought to spring
 void move()
 {
  //don't do anything if the user is clicking me.
  if(isClicked || equiClicked)
    return;
  //Calculate the force -k/m*x
  float displacement = dist(x,y,equiX,equiY); 
  float F = constant/mass*displacement;
  
  xvel = xvel - F*(x-equiX)/displacement;
  yvel = yvel - F*(y-equiY)/displacement;
  x = x + xvel;
  y = y + yvel;
 }
 //This function actually shows you the analytical solution of a spring
 //equation. Since springs are spawned in this sim using xvel = 0 to start
 //This solution relies on the spring's amplitude being whatever it starting positoin had been.
 void analyticalMove()
 {
   x = amp*cos(sqrt(constant/mass) *frameCount)+equiX;
 }
 
 void clicked()
 {
  if(dist(mouseX, mouseY, x, y) < 30 ^ (isClicked== true && equiClicked == false))
  {
    xvel = 0;
    yvel = 0;
    x=mouseX;
    y=mouseY;
    isClicked = true;
  }
  if(dist(mouseX,mouseY,equiX, equiY) < 30 ^ (isClicked == false && equiClicked == true))
  {
   xvel = 0;
   yvel = 0;
   equiX = mouseX;
   equiY = mouseY;
   equiClicked = true; 
  }
 } 
 void released()
 {
  if(isClicked)
  {
  x= mouseX;
  y = mouseY;
  isClicked = false;
  }
  else if(equiClicked)
  {
   equiX = mouseX;
   equiY = mouseY;
   equiClicked = false; 
  }
 }
}

class Sproing extends Spring
{
  Sproing(float equiX, float equiY, float x, float y, float constant, float mass)
  {
   super(equiX, equiY, x, y, constant, mass); 
  }
  
  void move()
  {
    float displacement = dist(x,y,equiX,equiY); 
    float F = constant/mass*displacement*displacement;
    //Calculate the force -k/m*x^2
    xvel = xvel - F*(x-equiX)/displacement;
    yvel = yvel - F*(y-equiY)/displacement;
   
    x = x + xvel;
    y = y + yvel;
  }
}

class Pendulum
{
    float pivotX, pivotY, bobX, bobY, theta, thetadot, l;
    boolean pivotClicked, bobClicked;
    
    Pendulum(float pivotX, float pivotY, float bobX, float bobY)
    {
     this.pivotX = pivotX;
     this.pivotY = pivotY;
     this.bobX = bobX;
     this.bobY = bobY;
     thetadot = 0;
     pivotClicked = false;
     bobClicked = false;
     l = dist(pivotX, pivotY, bobX, bobY);
    }
    
    void display()
    {
     stroke(100,20,244);
     line(pivotX, pivotY, bobX, bobY);
     fill(255,100,20);
     stroke(0);
     rect(bobX, bobY, 10, 10);
    }
    
    void move()
    {
      
      //Trickonometry!
      if(pivotY < bobY)
       theta = atan((bobX-pivotX)/(bobY-pivotY));
      else if(pivotX < bobX)
        theta = PI/2 + atan((pivotY-bobY)/(bobX-pivotX));
      else
        theta = -PI/2 - atan((pivotY-bobY)/(pivotX-bobX));
        //else
     //  theta = PI + atan((bobY-pivotY)/(bobX-pivotX)); 
       //calculate all motion in theta, then translate back to x and y
     thetadot = thetadot - 0.01*sin(theta);
     theta = theta + thetadot;
     bobX = pivotX + l*sin(theta);
     bobY = pivotY + l*cos(theta);
    }
     
    void clicked()
    {
     if(dist(mouseX, mouseY, bobX, bobY) < 30 ^ (bobClicked== true && pivotClicked == false))
     {
      thetadot = 0;
      bobX = mouseX;
      bobY= mouseY;
      bobClicked = true;
     }
  if(dist(mouseX,mouseY,pivotX, pivotY) < 30 ^ (bobClicked == false && pivotClicked == true))
  {
    thetadot =0;
    pivotX = mouseX;
    pivotY = mouseY;
    pivotClicked = true; 
  }
 }
 
 void released()
 {
    if(bobClicked)
  {
  bobX= mouseX;
  bobY = mouseY;
  bobClicked = false;
  }
  else if(pivotClicked)
  {
   pivotX = mouseX;
   pivotY = mouseY;
   pivotClicked = false; 
  }
  l = dist(pivotX, pivotY, bobX, bobY);
 }
}
