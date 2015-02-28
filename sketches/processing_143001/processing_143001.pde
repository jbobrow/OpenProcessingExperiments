



//the width and hieght of the output window
int myWidth = 450;
int myHeight = 550;

//declare plane tank and clouds
Plane myPlane;
Tank myTank;
Clouds myClouds;

//array for bullet
Bullet[] bullets = new Bullet[100];
int bulletCounter = 0;

//arrays for missle
Missle[] missles = new Missle[100];
int missleCounter = 0;

//A timer object to trigger the instantiation of missle
Timer timer;

//Set the size of the output window and drawing with smooth
//intsatiatate mytank
//Instantiatate the time to 1-1/2 seconds and start it running

void setup()
{
  //size of window and smooth
  size(myWidth, myHeight);
  smooth();
  
  //declare class's here
  myPlane = new Plane();
  myTank = new Tank();
  myClouds = new Clouds();
  timer = new Timer(600);
  timer.start();
}

void draw()
{
  //declare what i want to be shown in window
  background(random(10,55),random(10,55),random(10,55));
  myBackground();
  myClouds.display();
  myClouds.move();
  myPlane.display();
  myPlane.move();
  myTank.display();
  myTank.move();
  newMissles();
  iterateMissles();
  iterateBullets();
}

//timer for missle being shown
void newMissles()
{
  if (timer.isFinished())
  {
    missles[missleCounter] = new Missle(myPlane.x-80,myPlane.y+5);
    missleCounter++;

    if (missleCounter >= missles.length) {
      missleCounter=0;
    }
    timer.start();
  }
}

//show missle and intersection
void iterateMissles()
{
  for (int index = 0;index < missleCounter; index++)
  {
    missles[index].display();
    missles[index].move();
    
    for(int index2 = 0; index2 < bulletCounter; index2++)
    {
      if(bullets[index2].intersect(missles[index]))
    {
      missles[index].explode();
    }
    }
  }
}
//declare bullets here
void iterateBullets() {
  for (int index=0;index<bulletCounter;index++) {
    bullets[index].display();
    bullets[index].move();
  }
}

//how i want to make the background
void myBackground()
  {                        

   int bW=0;//background location for width
   int bH=0;//background location for hieght
  
     for(int ctr=0; ctr<height; ctr++)
     {
    bW=1+ctr*30;//size of rectangles
    bH=1+ctr*30;//size of inbetween rectangles
   
       
   fill(random(0,20)); // will make rectangles flash black
   stroke(0);//make stroke
   //rects background from bottom to middle
   fill(207,224,97,200);//sand color
   rect(bW-560,bH,80,40);
   rect(bW-480,bH,80,40);
   rect(bW-400,bH,80,40);
   rect(bW-320,bH,80,40);
   rect(bW-240,bH,80,40);
   fill(99,209,202,160);//sky color
   //top to middle background
   rect(bW-160,bH,80,40);
   rect(bW-80,bH,80,40);
   rect(bW,bH,80,40);
   rect(bW+80,bH,80,40);
   rect(bW+160,bH,80,40);
   rect(bW+240,bH,80,40);
   rect(bW+320,bH,80,40);
   rect(bW+400,bH,80,40);
   rect(bW+480,bH,80,40);
   rect(bW+560,bH,80,40);
 }  
}   

//press the SPACE to shoot
void keyPressed()
{
  if (key == ' ')
  {
    if (bulletCounter >= 100)
    {
      bulletCounter =0;
    }
    bullets[bulletCounter]=new Bullet(myTank.x+5, myTank.y);
    bulletCounter++;
  }
}

 //begin bullet class
 class Bullet
{
  //declare x and y as floats
  float x;
  float y;

  Bullet(float newX, float newY)
  {
   //declare x to newX and y to newY
    x = newX;
    y = newY;
  }
  //how i want to display my bullet
  void display()
  {
    fill(255,5,51);//color of star or bullet
 beginShape();//begin star bullet
 vertex(x-10,y-10);
 vertex(x-20,y-10);
 vertex(x-10,y-5);
 vertex(x-15,y+3);
 vertex(x-5,y-5);
 vertex(x,y+3);
 vertex(x-1,y-5);
 vertex(x+6,y-10);
 vertex(x,y-10);
 vertex(x-3,y-20);
 vertex(x-10,y-10);
 endShape();//end star bullet
  }
  
  //how to make bullet move
  void move()
  {

    y-=10;
  }
  //formula for intersection of bullet and troopers
 boolean intersect(Missle myMissle)
 {
   
   if(dist(x,y,myMissle.x,myMissle.y) <(5+myMissle.radius))
   {
      return true;
   }
   else{
     return false;
   }
 }


} //end of bullet class   
//begin class
class Plane
{
  //x and y are floats
  float x;
  float y;
  
  //speed declared here
  int speedX = 2;
  int speedY = 2;
  
  //object contructor 
  Plane()
  {
    x = -350;
    y = myHeight/10;
  }
  
  //display object goes here
  void display()
  {
    stroke(1);//adds stroke to plane
    fill(209,186,211);//color of drop plane
    beginShape();//begin of body
    vertex(x+20,y-20);
    vertex(x+10,y-25);
    vertex(x-60,y-25);
    vertex(x-70,y-40);//start tail
    vertex(x-80,y-45);
    vertex(x-70,y-25);//end of tail
    vertex(x-75,y-20);
    vertex(x-75,y-15);
    vertex(x-70,y-13);
    vertex(x-60,y-13);
    vertex(x+10,y-13);
    vertex(x+20,y-17);
    vertex(x+20,y-20);
    endShape();//end of body
    beginShape();//top wing
    vertex(x-40,y-25);
    vertex(x-55,y-40);
    vertex(x-40,y-40);
    vertex(x-25,y-25);
    vertex(x-40,y-25);
    endShape();//end of top wing
    beginShape();//bottom wing
    vertex(x-40,y-13);
    vertex(x-55,y+5);
    vertex(x-40,y+5);
    vertex(x-25,y-13);
    vertex(x-40,y-13);
    endShape();//end of bottom wing
   /* beginShape();//burner
    vertex(x-75,y-20);
    vertex(x-85,y-19);
    vertex(x-90,y-17);
    vertex(x-85,y-16);
    vertex(x-90,y-14);
    vertex(x-75,y-14);
    vertex(x+random(-75,-90),y-20);
    endShape();//burner end*/
    fill(240,39,39);//burner color
    rect(x-85,y-20,10,random(2,6));//burner
    fill(0);//door and window color
    rect(x-19,y-21,5,7);//door
    ellipse(x-28,y-19,5,5);//right window
    ellipse(x-35,y-19,5,5);
    ellipse(x-42,y-19,5,5);
    ellipse(x-49,y-19,5,5);
    ellipse(x-56,y-19,5,5);//left window
    beginShape();//cockpit
    vertex(x+10,y-25);
    vertex(x+10,y-20);
    vertex(x+20,y-20);
    vertex(x+10,y-25);
    endShape();//end of cockpit
    beginShape();//dropping doors
    vertex(x-60,y-13);
    vertex(x-80,y-5);
    vertex(x-77,y-5);
    vertex(x-57,y-13);
    vertex(x-60,y-13);
    endShape();//end of dropping doors
  }
  
  //movement of plane
  void move()
  {
    x = x + speedX;//keeps plane moving right
    
    //reset of plane
    if(x > width+150)
    {
      x = -500;
    }
  }
  
}//end of plane class    

//begin tank class
class Tank
{
  //declare x and y as floats
  float x;
  float y;
  //make the speed of x 2
  int speedX =2;

//begin contructor
  Tank()
  {
 //declare where the x and y should be of tank
    x = width/2;//
    y = height - 40;
  }
 //display tank
  void display()
  {
   //constrain the x to a certain level  
    x = constrain(x, 15, width-15);

  smooth();
  noFill();//no fill for tracks of tank
  ellipse(x,y+30,40,10);//tracks of tank
  fill(219,174,84);
  noStroke();//no stroke for wheels
  //begin wheels of tank
  ellipse(x,y+30,5,5);
  ellipse(x-7,y+30,5,5);
  ellipse(x-14,y+30,5,5);
  ellipse(x+7,y+30,5,5);
  ellipse(x+14,y+30,5,5);
  //end track wheels
  stroke(0);//stroke for body
  fill(111,144,64);//tank color
   beginShape();//body 
   vertex(x,y+26);
   vertex(x+22,y+26);
   vertex(x+17,y+15);
   vertex(x,y+15);
   vertex(x-17,y+15);
   vertex(x-22,y+26);
   vertex(x,y+26);
   endShape();//end of body
   beginShape();//tank top
   vertex(x-10,y+15);
   vertex(x-5,y+5);
   vertex(x+5,y+5);
   vertex(x+10,y+15);
   endShape();//end of tank top
   fill(0);//color of tank barrel
   rect(x-1,y-5,3,14);//tank barrel
 }
 
  //make tank move
  void move()
  {
    if (keyPressed && keyCode == LEFT)//LEFT arrowkey will move tank left 
    {
      x-=5;
    }

    if (keyPressed && keyCode == RIGHT)//RIGHT arrowkey will move tank right
    {
      x+=5;
    }
  }
}//end tank class

//begin timer class
class Timer 
{
  //declare saveTime and totalTime floats
  float savedTime;
  float totalTime;

//contructer for timer
  Timer(float newTotalTime) 
  {
    totalTime=  newTotalTime;
  }

//how timer should start
void start()
{
  savedTime=millis();
}
//the formula for finished timer
boolean isFinished()
{
  if ((millis()-savedTime) > totalTime){
    return true;
  }
  else
  {
    return false;
  }
 }
}//end of class

class Clouds
{
  float x;
  float y;
  
  int speedX = 2;
 Clouds()
{
  x = -150;
  y = 150;
}

void display()
{
  //sun
  fill(233,250,13);
  ellipse(420,25,100,100);
  
  
  noStroke();//mo stroke for clouds
  fill(255);//white clouds
  
  //first set of clouds
  ellipse(x-5,y+2,10,15);
  ellipse(x-20,y+15,40,20);
  ellipse(x-35,y,20,25);

  
  //second set of clouds
   ellipse(x+5,y+50,10,15);
  ellipse(x+20,y+62,40,20);
  ellipse(x+35,y+48,20,25);
  
  //third set of clouds
  ellipse(x-35,y+90,20,25);
  ellipse(x-14,y+95,30,20);
  ellipse(x-6,y+90,30,40);
  
  //forth set of clouds
  ellipse(x-70,y+22,10,15);
  ellipse(x-85,y+35,40,20);
  ellipse(x-100,y+20,20,25);
  stroke(0);
}

void move()
{
   x = x + speedX;
   
   if(x > width+120)
    {
      x = -200;
    }
}

}

//start missle class
class Missle
{
  //declare radius,x,y,speedX,speedY, all floats
  float radius;
  float x;
  float y;
  float speedX;
  float speedY;
  
  //begin constructor
  //add missile with paremeters
  Missle(float newZ, float newV)
  {
  radius=20;//the radius is 20
  x= newZ;//rename x into Z
  y= newV;//renamed y into V
  
  speedX=5;//makes speed of X only 5
  speedY=random(1, 3);//makes speed of y random
  }
  
  //how object should be displayed
 void display(){
 
 fill(170,161,89);//color of object
 noStroke();//no stroke
 /*beginShape();
 vertex(x,y);
 vertex(x+radius-30,y+radius);
 vertex(x+radius-10,y+radius);
 vertex(x,y);
 endShape();*/
  beginShape();//begin parachute
  vertex(x-10,y+radius-40);
  vertex(x+radius-20,y+radius-20);
  vertex(x+radius-10,y+radius-40);
  vertex(x-10,y+radius-40);
  endShape();//end parachute
  fill(0);//color of bomb
  ellipse(x+radius-20,y+radius-20,radius,radius);//bomb
  fill(247,0,50);
 }
 
 void move(){
   x+=speedX;//move right  
   y+=speedY;//move down
   
   //formula to make it now stick to window sides
   if(x>width || x<-20)
   {
     speedX=-speedX;
   }
}
//intersection formula
 boolean intersect(Missle myMissle){
   
   if(dist(x,y,myMissle.x,myMissle.y)<(radius+myMissle.radius)){
     
     return true;
   }
   else{
     return false;
   }
 }
 //explode the missle if shot by tank
 void explode(){
   
   if(radius>0){
     radius-=5;
     }
 }
}//end of missle class 
  
         

 
