
//Naomi Rauch
//CS 118
//May 14, 2014


int numflies = 5; //sets the inital number of flies

Birds bird0, bird1, bird2; //declare and name bird objects

ArrayList<Flies> fly; //arraylist for number of flies can change



void setup (){

size(400,400);
background(255);
smooth();

//initalizing bird objects (number of birds won't change)
//start with beaks closed
bird0 = new Birds(width/4,50,.5,0); //bird on left closed beak
bird1 = new Birds(width/2,100,.8,0); //bird in center closed beak
bird2 = new Birds(width*4/5,150, 1,0); //bird on right closed beak

fly = new ArrayList<Flies>(); //initalizing array list

//adding flies to array
for(int i = 0; i<numflies; i++){
fly.add(new Flies(200,200,400,400,.05));
}
}

void draw () {

frameRate(10);
  
background(255);


//if the mouse if pressed a new fly is added to the screen

if(mousePressed){
  fly.add(new Flies(mouseX, mouseY, 400,400,.05));
}

//if the mouse hovers on fly the fly will follow mouse to feed birds
for(int i = 0; i<fly.size(); i++){
if (dist(mouseX,mouseY,fly.get(i).x,fly.get(i).y) < 20){
fly.get(i).x = mouseX;
fly.get(i).y = mouseY;
}
}

//checking for distance between each fly and each bird.
//when fly is within range the birds beak opens and bird eats fly
//fly removed from array list
//else bird stays with beak closed

for(int i = 0; i<fly.size(); i++){
 
  if (dist(fly.get(i).x, fly.get(i).y, bird0.xpos, bird0.ypos) <= 30){
  bird0 = new Birds(width/4,50,.5,1); //bird on left open beak
  
  fly.remove(i);
  
  }else if (dist(fly.get(i).x, fly.get(i).y, bird1.xpos, bird1.ypos) <= 30){
  bird1 = new Birds(width/2,100,.8,1); //bird on left open beak
  
  fly.remove(i);
  }else if (dist(fly.get(i).x, fly.get(i).y, bird2.xpos, bird2.ypos) <= 30){
  bird2 = new Birds(width*4/5,150, 1,1); //bird on left open beak
  
  fly.remove(i);
  
}else{
 
bird0 = new Birds(width/4,50,.5,0); //bird on left
bird1 = new Birds(width/2,100,.8,0); //bird in center
bird2 = new Birds(width*4/5,150, 1,0); //bird on right
  
}
}
//display birds
bird0.display();
bird1.display();
bird2.display();

//displaying all flies in array list
for(int i = 0; i<fly.size(); i++){
  
  Flies freshfly = fly.get(i);
  freshfly.update();
  freshfly.display();
}

}
//function to draw parametric birds using shapes
//x, y coordinates of birds head
//s is scale
//mouth is 0 for closed and 1 for open

void functBird(float x, float y, float s, int mouth){
  
float dhead = 75; //diameter of head
float dbody = 75; //diameter of body
float xhead = x; //x coordinate of head
float yhead = y; //y coordinate of head;



pushMatrix();
translate(x,yhead);
noStroke();
scale (s);
 
 //bird head
fill(255,255,0);
ellipse(0,0,dhead,dhead);

//eyes
fill(0);
ellipse(0+dhead/6,0,dhead/8,dhead/8);
ellipse(0-dhead/6,0,dhead/8,dhead/8);

//tail
fill(100,200,300);
quad(0-dhead/8,0+dhead/2+dbody/2, 0+dhead/8,0+dhead/2+dbody/2,0+ dhead/2, 0+dhead/2+1.5*dbody, 0-dhead/2, 0+dhead/2+1.5*dbody);

//body
fill(255,255,0);
ellipse(0,0+dhead/2+dbody/2,dhead*1.3,dbody);

//wings
fill(255,0,0);
ellipse(0-dhead/2,0+dhead/2+dbody/2,dhead/4, dbody);
ellipse(0+dhead/2,0+dhead/2+dbody/2,dhead/4, dbody);

//wire
stroke(0);
strokeWeight(3);
line(0-dhead*1.2,0+dhead/2+dbody,dhead*1.2,0+dhead/2+dbody);

if(mouth <= 0){
//beak closed
noStroke();
fill(255,106,6);
triangle(0+dhead/15,0+dhead/8,0-dhead/15,0+dhead/8,0,0+dhead/2);
}else{
//beak open
fill(81,79,28);
triangle(0+dhead/15,0+dhead/8,0-dhead/15,0+dhead/8,0,0+dhead/2.75);//down
triangle(0+dhead/15,0+dhead/8,0-dhead/15,0+dhead/8,0,0-dhead/6);//up
}

popMatrix();
}
//begin class block for birds
class Birds { //name of class

float ypos;
float xpos;
float s;
int mouth;

//class constructor (like setup function)
  Birds(float xtemp, float ytemp, float stemp, int mouthtemp){
  
  
  xpos = xtemp;
  ypos = ytemp;
  s = stemp;
  mouth = mouthtemp;
    
  }
  
  void display(){
  
  functBird(xpos, ypos, s, mouth);
  }
  
  
}

void funct(float x, float y, float flyw, float s){
  //drawing flies
  //x and y variables are coordinates of center
  //flyw is width of fly; height a factor of width by 1.618
  //s is for scale
  
  pushMatrix();
  translate(x,y);
 
    fill(0);
    noStroke();
    ellipse(0, 0, flyw, flyw*(1.618));

 popMatrix();
}

//begin class block
class Flies { //name of class
  
float x; //x coordinate
float y; //y coordinate
float flyw; //lantern W; height a factor of width by 1.618
float s; //scale
float easing;//in y direction
float targetx; //center of object in sky
float targety; //center of object in sky
float counter = 0; //counter to randomly pick targetx targety
float countermax = random(10,20);


//class constructor (like setup function)
  Flies(float tempx, float tempy, float temptargetx, float temptargety, float tempease){
  
  x = tempx;//current x coordinate
  y = tempy;//current y coordinate
  flyw = random(5,10); //random starting widths of flies
  easing = tempease;//easing as specified when calling object
  targetx = temptargetx; //specified target x position when calling lantern object
  targety = temptargety; // specified target y position when calling lantern object
  
}
//method for the "math" behind the object motion
 void update(){

counter++;//counter to pick a new target after random frames

   
 if(x > targetx){ //moving lanterns toward target x
     x += (targetx - x)*easing;
    }else if(x < targetx){
     x += (targetx - x)*easing;
 } 
 
 if(y > targety){//moving lantern toward target y
     y += (targety - y)*easing;
    }else if(y < targety){
     y += (targety - y)*easing;

 }
 if (counter>countermax) {
   counter = 0;
   countermax = random(10,20);//random time to pick new targetx and targety
   targetx = random(0,400);//random targetx
   targety = random(0,400);//random targety
 
 }
 }
 
//method for drawing the object to the screen
void display(){

 
   funct(x,y,flyw,s);//calls function for flies
 }
}



