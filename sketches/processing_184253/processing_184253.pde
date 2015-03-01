
//Array of falling snowflake objects (hacked to be something else completely)
//Bryan Cera 2014

ArrayList<Snowflake> flakes;//(set # of "slots" in second [])

int wait = 1;

void setup(){  //do normal setup stuff
  size(800,800);
 
  background(150,175,255); // sky blue?
  smooth();
  
flakes = new ArrayList<Snowflake>();

//add first snowflake object

}


void draw(){
  

  
  background(150,175,255); // sky blue?
  noStroke();
  fill(93,71,31); // sky blue?
  rect(0,height/2,width,height);
  fill(93,71,31); // sky blue?
  rect(0,height/2,width,height);
  
  

  
//animate array using a for loop (length=number of slots)
   for(int i = 0; i < flakes.size(); i++){
     Snowflake freshflake = flakes.get(i);  //name and initialize the new object!
  freshflake.update(1,1);  //math
  //freshflake.display();  //visual
  
 for(int j = 0; j < flakes.size(); j++){
if(i != j){
  Snowflake freshflake2 = flakes.get(j);  //name and initialize the new object!
  
  
  if(dist(freshflake.posx,freshflake.posy,freshflake2.posx,freshflake2.posy) <= 15){
  if(freshflake.fallspeed == 0 || freshflake2.fallspeed== 0){
      freshflake.update(0,0);  //math
      freshflake2.update(0,0);  //math
      freshflake.display(freshflake2.posx,freshflake2.posy);  //visual
  }
}
}
  
  }
  
}

//if(mousePressed){
println(flakes.size());
  if(flakes.size()<=2000){
  

  flakes.add(new Snowflake(random(width),-25,flakes.size()));
  

}




}

//begin class block
class Snowflake{
  
float posx, posy;  //declare variables for x and y position
float radius;  //declare variable for radius
float fallspeed;  //declare variable for "speed" 
int collide = 1;
int stopcheck = 1;
float fakerad = 1;

 
 //class constructor (like setup function)
 Snowflake(float tx,float ty, float s){
  posx = tx;  //set initial x position (random)
  posy = ty; // set initial y position (random)
  radius = 150-ty; // set initial radius (random)
  fallspeed = random(2,3);  //set intial fallspeed
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
   // posx += random(-1,1);
    fakerad+=.01;
    if(fakerad > radius){
    fakerad = radius;
    }
    
   }

  }
  

  
 }
  
  //method for drawing the object to the screen
  void display(float tx, float ty){
    //draw the snowflake!



    stroke(112,90,15);
    strokeWeight(fakerad);
    point(posx,((height)-posy)+(height/2));

    stroke(58-(ty/9),173-(ty/9),18-(ty/9));
    strokeWeight(fakerad);
    line(posx,posy/2,tx,ty/2);
    

  }  
}
//end class block


