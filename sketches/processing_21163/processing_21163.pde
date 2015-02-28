
//Global variables, not to be altered.
Ball[] baller;
Control c;

//Global editable -- Can be replaced. 
int numBalls = 70;                     //The total amount of balls on the canvas
int xsize = 800;                        //The width of the canvas
int ysize = 800;                        //The height of the canvas
int maxdim = 100;                       //The maximum dimention of a particular ball
int maxbreak = 5;                       //The maximum fragments a ball can break into // NOT IN USE
int maxspeed = 10;                      //The maxium speed -1 the balls can be seeded with

/*
Initialize the program
*/
void setup(){
  size(xsize,ysize);                   
  background(255,255,255);
  c = new Control();
  baller = new Ball[numBalls];
  c.seedArray();
}

/*Draws the canvas, the balls, and tells Control to move the balls. Listens for mouseclick which results in new seeding of the baller Array */
void draw(){
  background(255,255,255);
  for(int i = 0; i<numBalls; i++){
    Ball tempball = baller[i];
    fill(tempball.colour[0],tempball.colour[1],tempball.colour[2]);
    ellipse(tempball.xpos,tempball.ypos,tempball.dimention,tempball.dimention);
   }  
  c.moveBalls();
    }

 void mousePressed() {
    c.seedArray();
}
/* Controls the program. Seeds the array in the beginning of each turn, and tell the balls to move. */
class Control{
   
  void seedArray(){
   for(int i = 0; i<numBalls; i++){
    baller[i] = createBall();
   
   } 
       
  }
    
  Ball createBall(){
   Ball tempball; 
   int[] tempCol = {int(random(255)),int(random(255)),int(random(255))};
    tempball = new Ball(int(random(maxdim)),int(random(maxbreak)),random(xsize),random(ysize),tempCol,int(random(maxspeed))+1);
    return tempball;
  }
  
  void moveBalls(){
    for(int i = 0; i<numBalls; i++){
    baller[i].move();
   
     }   
    } 
}

/*Knows facts about itself, and is responsible for moving, turing at the y-axis edges and increase speed by one when reaching the top */

class Ball{
  int dimention;
  int breakfactor;
  float xpos; 
  float ypos; 
  int[] colour;
  int speed;
  boolean direction;
  
  Ball(int dimention, int breakfactor, float xpos, float ypos, int[] colour, int speed){
   this.dimention = dimention;
   this.breakfactor = breakfactor;
   this.xpos = xpos; 
   this.ypos = ypos; 
   this.colour = colour;
   this.speed = speed;
   direction = true;
    
  }
  
  void move(){
    if(direction == true) {
  this.ypos = this.ypos + speed;
    if(this.ypos > ysize-dimention){
     direction = false;
    }
  } else if(direction == false){
    this.ypos = this.ypos - speed;
    if(this.ypos < 0){
     direction = true;
     this.speed++;
    }
  }
  }
}

