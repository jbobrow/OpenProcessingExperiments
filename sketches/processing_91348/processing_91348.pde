
PImage grass;

// first, name of class.  second, custom name.
// third, new.  fourth. name of class again.
Grandpa grandpa = new Grandpa();
Cat cat = new Cat();
Mouse mouse = new Mouse();
float mX = 50;
 float mY = 50;
float radius = 30.0;

void setup(){
 grass = loadImage("grass.png");
 size(600,600); 
 frameRate(15);

 // declare what numerical value will be assigned to 
 // the class variable
 
}

void draw(){
  background(255);
  image(grass, 0, 0);
  //if you have functions within a class, make sure
  //and call them.
  
  grandpa.setup();
  grandpa.draw();
  cat.setup();
  cat.draw();
  mouse.setup();
  mouse.draw();
  mouse.move();
  
}


//cat class
class Cat
{
  PImage catPic;
  float cX = 200;
  float cY = 200;
  float cMoveX = random(10,590);
  float cMoveY = random(10,590);
  float speed = 5.0;
  
  void setup(){
    catPic = loadImage("cat2.png"); 
  }
 void draw(){
  image(catPic, cX, cY);
  cX = mX - 10 ;
  cY = mY - 10 ;
   //cY = random(10,590) - speed;
 } 
}

//mouse class
class Mouse
{
 PImage mousePic;
// float mX = 50;
 //float mY = 50;
 float mMoveX;
 float mMoveY;
 float mSpeed = 4.0;
 float speed = 10.0;
 
  void setup(){
   mousePic = loadImage("mouse2.png");
   mMoveX = random(-mSpeed, mSpeed);
   mMoveY = random(-mSpeed, mSpeed);
   ellipseMode(RADIUS);
  } 
  void draw(){
   image(mousePic, mX, mY); 
  }
  void move(){
    mX = random(20,500);
    mY = random(20,500);
    }
  }



//grandpa class
class Grandpa
{
  PImage grampsPic;
  PImage grave;
  boolean dead = false;
  float BeginGx = 400;
  float BeginGy = 400;
  float EndGx = 30;
  float EndGy = 30;
  float easing = 0.05;
  
  
  float timer = 0.0;
  
  void setup(){
    grampsPic = loadImage("grandpa2.png");
    grave = loadImage("tombstone2.png");
    timer += 1.0;
   
  }
  
  void draw(){
   image(grampsPic, BeginGx, BeginGy); 
   
   float d = dist(BeginGx, BeginGy, EndGx, EndGy);
   if( d> 1.0){
     BeginGx += (EndGx - BeginGx) * easing;
     BeginGy += (EndGy - BeginGy) * easing;
  }
  
  if(d < 20){
   image(grave, 1, 2); 
  }
  
  }

}

  
// end bracket 






