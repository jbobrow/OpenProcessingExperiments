
//Array of falling snowflake objects
//Bryan Cera 2014

ArrayList<Snowflake> flakes;//(set # of "slots" in second [])

int wait = 1;

void setup(){  //do normal setup stuff
  size(800,800);
 
  background(150,175,255); // sky blue?
  smooth();
  
flakes = new ArrayList<Snowflake>();

//add first snowflake object
//flakes.add(new Snowflake(random(width),random(height)));

}

void draw(){
  background(150,175,255); // sky blue?
  
//animate array using a for loop (length=number of slots)
   for(int i = 0; i < flakes.size(); i++){
     Snowflake freshflake = flakes.get(i);  //name and initialize the new object!
  freshflake.update(1,1);  //math
  freshflake.display();  //visual
  
 for(int j = 0; j < flakes.size(); j++){
if(i != j){
  Snowflake freshflake2 = flakes.get(j);  //name and initialize the new object!
  
  
  if(dist(freshflake.posx,freshflake.posy,freshflake2.posx,freshflake2.posy) <= int(freshflake.radius/3)){
  if(freshflake.fallspeed == 0 || freshflake2.fallspeed== 0){
      freshflake.update(0,0);  //math
      
      freshflake2.update(0,0);  //math
  }
}
}
  
  }
  
}

//if(mousePressed){

 if(dist(mouseX,mouseY,pmouseX,pmouseY)>10){
  
  flakes.add(new Snowflake(mouseX+random(-5,5),mouseY+random(-5,5)));
  flakes.add(new Snowflake(mouseX+random(-5,5),mouseY+random(-5,5)));
  

}

if(mousePressed){
  setup();
}



}

//begin class block
class Snowflake{
  
float posx, posy;  //declare variables for x and y position
float radius;  //declare variable for radius
float fallspeed;  //declare variable for "speed" 
int collide = 1;
int stopcheck = 1;

 
 //class constructor (like setup function)
 Snowflake(float tx,float ty){
  posx = tx;  //set initial x position (random)
  posy = ty; // set initial y position (random)
  radius = random(25,55); // set initial radius (random)
  fallspeed = random(3,4);  //set intial fallspeed
 }
 
 //method for the "math" behind the object
 void update(int col, int tstopcheck){

   collide = col;
   
   stopcheck = tstopcheck;
   
   
   
   
  posy += fallspeed;  // y position moves downward
   
  
  if(posy >= height){  //if statement "resets" snowflake
    fallspeed = 0;        //when it reaches bottom
  
  }
  
  if(collide == 0){
   if(stopcheck ==0){
    fallspeed = 0;   
   }
  if(stopcheck ==1){
  fallspeed = random(3,4);
   }  
  }
  

  
 }
  
  //method for drawing the object to the screen
  void display(){
    //draw the snowflake!
    stroke(255);
    strokeWeight(radius);
    point(posx,posy);
  }  
}
//end class block


