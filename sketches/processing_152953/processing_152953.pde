
Flock[] f;
int current=0;
int init=-1;
int total =1056643;
String [] syria;
int index=0;
 PImage img;
int tracker=current-50;

 
void setup(){
  size(900, 722);
   syria=loadStrings("syria4.csv");
 img = loadImage("Syria3.png");
  smooth();
  //initialize our flock guys
  f = new Flock[1056643];
  frameRate(240);
}
 
void draw(){
  background(255);
 image(img, 0, 0);
 
 
textSize(32); 
fill(0);
text("Syria", 560, 40); 
text("Lebanon", 180, 450);
textSize(32); 
fill(255  , 0, 0, 204);
text("Refugee Count", 160, 200);
 
 
 if (index<syria.length){
    String [] syria2= split (syria[current],',');
String y = (syria2 [0]);
int w=int(syria2[1]);
current= int(syria2 [2]);
//println(y);
//println(current);


textSize(32); 
fill(255  , 0, 0, 204);
text(current, 160, 240);


index++;
 if (current>init && current<total){
      f[current] = new Flock();
  } else if (current==total){
  noLoop();
    }
    
  
  
  if (current<=total){
 for (int i=1; i< current;i++){
    f[i].grow(); 
    f[i].move();
    f[i].display();  //move all boids
  }}
}
}
 

 
class Flock {
 
  PVector position, velocity, acceleration;
  PVector target;
  float startx, starty;
 float diameter;
 boolean on = true; 
  //Variables to calculate our starting position.
  //The s will be the size of the Flock.
  int w, h, s;
 
 
  Flock() {
 
    w = width;
    h = height;
    //the size of our boid
    s = 4;
 
    //temporary x and y position to start flying
    startx = random(500, 899);
    starty = random(20, 570);
 
    position =new PVector(startx, starty);
    //start with no velocity, acceleration will take care of that
    velocity=new PVector(0, 0);
    //start with no accelartion, our target function will take care of that
    acceleration=new PVector(0, 0);
    //target position starts with the center.
    target=new PVector(w/2, h/2);
  }
 
   void grow(){
 if (on == true) {
diameter += 5.5;
if (diameter > 160) {
on = false;
}
}
   
 
 
 }
  void move(){
    //We call the targetFunction() to calculate the acceleration    
    if (current<=total){
     for (int i=1; i< current;i++){
    f[i].setTarget(350, 300);
  }
    
    targetFunction();
 
    velocity.add(acceleration);
    velocity.limit(55);
    position.add(velocity);
 
        //boid
  }}
  void display(){
   if (on == true) {
    noStroke();
    fill(255,0,0);
    ellipse(position.x, position.y, s, s);      //boid
 
   }
 }
 
  //This function will be used to change the vector with the target location.
  void setTarget(int inX, int inY){
    //We recieve x and y and set the vector with those values.
    target.set(inX, inY);
  }
 
  
  void targetFunction(){
    //desired vector to calculate a vector from our position towards the target
    PVector desired = PVector.sub(target, position);
    desired.normalize();
    desired.mult(0.5);
    // desired.setMag(maxspeed);
 
    acceleration = desired;
  }
}



