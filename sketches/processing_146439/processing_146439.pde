
//Rain of Cage
//by Devin Lopina
ArrayList<Snowflake> flakes;
float groundlevel;
PImage img1;

void setup(){  //do normal setup stuff
  size(800,800);
  background(150,175,255); // sky blue?
  smooth();
  img1 = loadImage("nickcage.png");
  
//initialize array using a for loop (length=number of slots)
  flakes = new ArrayList<Snowflake>();

//  flakes.add(new Snowflake(height - groundlevel));
}

void draw(){
  background(150,175,255); // sky blue?
  
  for(int i = 0; i < flakes.size(); i++){
  Snowflake freshflake = flakes.get(i);
  freshflake.update();
  freshflake.display();
  }
  
//  flakes.add(new Snowflake(height - groundlevel));

//  groundlevel = map(flakes.size(), 0, 100, 0, 1);
  
  println(groundlevel);
 
}

void mouseDragged() {
  /*for(int i = 0; i < flakes.size(); i++){
  Snowflake freshflake = flakes.get(i);
  freshflake.update();
  freshflake.display();
  }*/
  
  flakes.add(new Snowflake(height - groundlevel));

  groundlevel = map(flakes.size(), 0, 100, 0, 5);
  
  println(groundlevel);
  
}
//begin class block
class Snowflake{
  
float posx, posy;  //declare variables for x and y position
float radius;  //declare variable for radius
float fallspeed;  //declare variable for "speed" 
float ground;
float spin;
int life = 0;
int dead = 0;
int lifeTime = 100; //how many frames the objects lives

 //class constructor (like setup function)
 Snowflake(float g){
  ground = g;
  posx = mouseX;  //set initial x position (random)
  posy = mouseY; // set initial y position (random)
  radius = random(3,15); // set initial radius (random)
  fallspeed = random(1,5);  //set intial fallspeed
  spin = .1;

 }
 
 //method for the "math" behind the object
 void update(){
  
//  rotate(random(1,360));
  spin+=.1;
  
  posy += fallspeed;  // y position moves downward
  
  if(posy >= ground){  //if statement "resets" snowflake
    posy = ground;
  }
  
  if(life >= lifeTime){
    flakes.remove(this);
  }
  
  
  life ++;
  
 }
  
  //method for drawing the object to the screen
  void display(){
    //draw the snowflake!
  
  cageMove(posx,posy);
  

  } 
 
 void cageMove(float x, float y){
  pushMatrix();
  translate(x,y);
  cageSpin();
  popMatrix();
 }
 
 void cageSpin(){
  pushMatrix();
  rotate(spin);
  image(img1, -10,-15,20,30);
  popMatrix();
}
  
}
//end class block




