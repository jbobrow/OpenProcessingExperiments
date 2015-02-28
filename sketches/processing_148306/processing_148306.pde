
ArrayList<Branches> branch;

PImage Rose;

int R = 0;

int counter = 0;
int counterMax = 50;


void setup(){ 
  size(500,500);
  background(255);
  smooth();
  ellipseMode(RADIUS);
  frameRate(50);
  Rose = loadImage("Rose.png");

  //initialize array list
branch = new ArrayList<Branches>();

 //add first line
branch.add(new Branches(width/2,height, -2)); 
 
}

void draw(){
  background(255); 
 
  
  //naming and initializing new object
    for(int i = 0; i < branch.size(); i++){
    Branches limb = branch.get(i);  
    limb.update();
    }
      int branchNum; //variable that picks which branch to add a new branch on to
  branchNum = int(random(branch.size()));
    if(keyPressed){
      if((key == 'r')||(key == 'R')){
        R = 1;
     }
    }
    if( R >= 1){
      image(Rose,int(branch.get(branchNum).lastX),int(branch.get(branchNum).lastY), 20, 20); 
    }


counter++;

if(counter > counterMax){
//add new branch at lastx and lasty position of line segment to random branch already drawn 
branch.add(new Branches(int(branch.get(branchNum).lastX),int(branch.get(branchNum).lastY),branch.get(branchNum).dir));
  counter = 0;
  counterMax = int(random(50,200)); 

}




//count # of branches and which point they are initially drawn  
  for(int i = 0; i < branch.size(); i++){
    
 print(i);
 print(" = ");
 print(branch.get(i).lastX);
 print("  ");
 println(branch.get(i).lastY);

  }

}
 
 

class Branches{
  ArrayList<Vine> grow;
  
float newX;
float newY;

float dir;
float XdirNeg = -3;
float XdirPos = 3;

//initialize new variables for last x and y position drawn in grow
float lastX;
float lastY;

int spacer = 0;

int spacerMax = 15;

int ranX;
float ranY;

float followerX;

int r = int(random(255));


Branches(int x, int y, float d){
  //initialize array list
grow = new ArrayList<Vine>();

 //add first line
grow.add(new Vine(x,y));

dir = d;

}

void update(){

    //naming and initializing new object
    for(int i = 0; i < grow.size(); i++){
    Vine stem = grow.get(i);  
    stem.update();
    //killing off the old lines
    if(stem.finished()){
    grow.remove(i);
    }
    }
  
//add new stem each frame, with new end point from previous
spacer++;

if(spacer > spacerMax){
  
  ranX = int(random(XdirNeg,XdirPos));
  ranY = random(dir/2,dir); 
  spacer = 0;
  spacerMax = int(random(5,25));   ////////////// how often branch changes direction
}

followerX += (ranX - followerX) * .1; //////////////// '.1' determines smoothness of branch

grow.add(new Vine(newX+followerX,newY+ranY));


//draw...

  for(int i = 1; i < grow.size(); i++){    
    strokeWeight(5);
    stroke(r, 0, 0);
    line(grow.get(i).posx,grow.get(i).posy,grow.get(i-1).posx,grow.get(i-1).posy);
//make lastX and lastY equal to endpoint of line seg in previous frame to call in other tab
    lastX = grow.get(i).posx;
    lastY = grow.get(i).posy;

  }
  
}

void display(){
 
}


//vine class
class Vine{
  
 //declare variables
  float posx, posy;
  
  float life;
//class constructor
Vine(float x, float y){
  
  posx = x;
  posy = y;

  newX = posx;
  newY = posy; 
  
  life = 700;
}
//movement method
void update(){
  //updating new x and y position
  newX = posx;
  newY = posy;  
  
  life --;
  //to prevent line going off window
if(newY <= -50){
  dir = 2;
}
if(newY >= 550){
  dir = -2;
}
if(newX <= 0){
 XdirNeg = 3;
}else{
  XdirNeg = -3;
}
if(newX >= width){
  XdirPos =  -3;
}else{
  XdirPos = 3;
}

}
 boolean finished(){
 if(life<=0){
 return true;
 }else{
 return false;
 } 
 }
}


}



