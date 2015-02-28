
//Directions: Have the bird attack the men by click on the men. 
//With a succeful attack the men will  disapear. Kill them all and you win. 

Human man, woman, child ;
Flyer bird;



int bg;
PImage Man;
PImage Bird;
PImage street;


//TIME
float time;
//Tally
int pointup;

float xx, yy, dir1, ang1, ang2, angle1, angle2;


void setup(){
  size(999,666);
  noCursor();
 
  time = 0;
 
  pointup = 0;
 
  man = new Human(0, 400, 200, 250, 1);
 
  woman = new Human(0, 500, 150, 174, 3);
 
  child = new Human(0, 600, 250, 100, 3.5);
 
  bird = new Flyer(0, 200, 33, 60, 62);
  
  Man = loadImage("MAN.gif");
  Bird = loadImage("bird.gif");
  street = loadImage("STREET.gif");


}

void draw(){

  background(street);
    float ang1 = radians(angle1);
    float ang2 = radians(angle2);
  xx = 485 + (cos(ang1) * 500.0);
  yy = 150;
  dir1 = 0;
  yy += dir1;
  

 
   
  fill(0);

  angle1 += 2;
  angle2 += 15;
 
  //timer
  text(time, 900, 40);
  time = 120 - millis()/1000;
  if(time <= 0){
    background(100,0,0);
    text("YOU LOSE", 444,333);
  }

 
  man.display();
  man.move();
 
  woman.display();
  woman.move();
 
  child.display();
  child.move();
 
  bird.display();
  bird.move();

   
     //"framelines"
  noFill();
  stroke(111,222,333);
  rectMode(CENTER);
  ellipse(mouseX, mouseY, 100, 100);
  ellipse(mouseX, mouseY, 33, 33);
  ellipse(mouseX, mouseY, 12, 12);
 
 
 
  if(pointup >= 12){
    background(100, 50, 60);
    text("YOU WIN", 444, 333);
  }
 
if(dist(bird.x, bird.y, man.x, man.y) <=20){
  background(0);
  man.x = 2000;
 pointup += 1;
 }
 
if(dist(bird.x, bird.y, woman.x, woman.y) <= 20){
 woman.x = 2000;
 pointup += 1;
}

if(dist(bird.x, bird.y, child.x, child.y) <= 20){
  child.x = 2000;
  pointup += 1;
}

   
 if(pointup == 3){
 background(0);
 stroke(255);
 text("WINNER", 444, 333);
 }
 

  }
 
  void mousePressed(){
  
   if((dist(mouseX, mouseY, man.x, man.y) <= 300) || (dist(mouseX, mouseY, woman.x, woman.y) <= 300) || (dist(mouseX, mouseY, child.x, child.y) <= 300) || (dist(mouseX, mouseY, X, Y) <= 300) ) {
   dir1 = 3;
  } 
  
 }
 
 class Human{
  
   float x, y, sizeX, sizeY, dir;
  
   Human(float x_, float y_, float sizeX_, float sizeY_, float dir_){
    
     x = x_;
     y = y_;
     sizeX = sizeX_;
     sizeY = sizeY_;
     dir = dir_;
  
    
   }
  
  
   void display(){
     fill(125);

  image(Man, x, y, sizeX, sizeY);


    
   }
   
   void move(){
     x += dir;
    
     if(x > width || x < 0){
       dir = -dir;
     }
     
   }

      
   }
 
 class Flyer{
   float x, y, sizeX, sizeY, dir, angle1, angle2;
  
   Flyer(float x_,float y_,float sizeX_,float sizeY_,float dir_){
     x = x_;
     y = y_;
     sizeX = sizeX_;
     sizeY = sizeY_;
     dir = dir_;
   }
   void display(){
     fill(125);
     image(Bird, x, y, sizeX, sizeY);
  
   }
   void move(){
    
    
    float ang1 = radians(angle1);
    float ang2 = radians(angle2);
   
   x = 485 + (cos(ang1) * 500.0);
   y = 150 + (sin(ang2) * 30.0)/2;
 
  angle1 += 2;
  angle2 += 15;
  
  if(mousePressed && (dist(mouseX, mouseY, man.x, man.y) <= 300)) {
   dir1 = 3;
   y = 200 + (sin(ang2) * 600.0)/2;
   
   }
   
  if(mousePressed && (dist(mouseX, mouseY, woman.x, woman.y) <= 300)) {
     
     dir1 = 3;
   y = 200 + (sin(ang2) * 650.0)/2;
   }
   if(mousePressed && (dist(mouseX, mouseY, child.x, child.y) <= 300)) {
      dir1 = 3;
   y = 200 + (sin(ang2) * 775.0)/2;
   }
  }
}

