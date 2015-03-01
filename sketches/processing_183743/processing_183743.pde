
//Array of falling snowflake objects
//Bryan Cera 2015

Snowflake[] flakes = new Snowflake[1000];  //declare and name array
//(set # of "slots" in second [])

void setup(){  //do normal setup stuff
  size(800,800);
  background(150,175,255); // sky blue?
  smooth();
  
//initialize array using a for loop (length=number of slots)
  for(int i = 0; i < flakes.length; i++){
  flakes[i] = new Snowflake(); 
  }

}

void draw(){
  background(150,175,255); // sky blue?
  
//animate array using a for loop (length=number of slots)
  for(int i = 0; i < flakes.length; i++){
  flakes[i].update(0,0);  //math
  flakes[i].display();  //visual
  
  //nested loop to test all flakes against each other
for(int j = 0; j < flakes.length; j++){

  //exclude the flake being tested
  if(i != j){
  
  
  //what is the current distance between tested flake and all other flakes?
  if(dist(flakes[i].posx,flakes[i].posy,flakes[j].posx,flakes[j].posy) <= int(flakes[i].radius/2)){  //if it's less than the radius/2
  if(flakes[i].fallspeed == 0 || flakes[j].fallspeed== 0){  //if the colliding flake has "landed"
 //update all flakes accordingly
      flakes[i].update(1,1);  //stop falling
      flakes[j].update(1,1);  //stop falling
  }
} 
}
  
  }
  
}
}
//begin class block
class Snowflake{
  
float posx, posy;  //declare variables for x and y position
float radius;  //declare variable for radius
float fallspeed;  //declare variable for "speed" 
int collide = 1; //collision variable
int landed = 1; //variable to declare if the colliding flake has "landed"
 
 //class constructor (like setup function)
 Snowflake(){
  posx = random(width);  //set initial x position (random)
  posy = random(height); // set initial y position (random)
  radius = random(3,15); // set initial radius (random)
  fallspeed = random(1,5);  //set intial fallspeed
 }
 
 //method for the "math" behind the object
 void update(int col, int tlanded){

   collide = col;
   
   landed = tlanded;
   
   
  posy += fallspeed;  // y position moves downward
  
  if(posy >= height){  //if statement "stops" snowflake
    fallspeed = 0;        //when it reaches bottom
  
  }
  
  if(collide == 1){  //if its colliding
   if(landed == 1){  //with a snowflake that has "landed"
    fallspeed = 0;   //stop falling
   }   
  }
  
 }
  
  //method for drawing the object to the screen
  void display(){
    //draw the snowflake!
    stroke(255);
    strokeWeight(radius);
    point(posx,posy);  //point with weight for radius faster than drawing an ellipse
  }  
}
//end class block


