
// This is a code fragment that shows how to use an ArrayList.
// It won't compile because it's missing the Ball class.

// Declaring the ArrayList, note the use of the syntax "<Ball>" to indicate
// our intention to fill this ArrayList with Ball objects


ArrayList<Ball> balls;

void setup() {
  size(400, 400);
  background(0);
  balls = new ArrayList<Ball>();  // Create an empty ArrayList
  balls.add(new Ball(mouseX, mouseY, 25));  // Start by adding one element
}

void draw() {
  background(0);

  // With an array, we say balls.length. With an ArrayList,
  // we say balls.size(). The length of an ArrayList is dynamic.
  // Notice how we are looping through the ArrayList backwards.
  // This is because we are deleting elements from the list.
  for (int i = balls.size()-1; i >= 0; i--) {
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
  //  if (ball.finished()) {
      // Items can be deleted with remove().
  //    balls.remove(i);
  //  }
  }
}

void mousePressed() {
  // A new ball object is added to the ArrayList, by default to the end.
   
  
  for (int i = balls.size()-1; i >= 0; i--) {
   
    if(dist(mouseX,mouseY,balls.get(i).posx,balls.get(i).posy) < balls.get(i).radius/2){
    balls.add(new Ball(mouseX, mouseY, random(10,100)));
    }
   
    
      }
  
}
class Ball{
int X, Y; //ellipse 
int nX, nY; //ellipse 
int delay = 10; //delay effect 
int num = 60; 
float mx[] = new float[num]; 
float my[] = new float [num]; 
int r, g, b; //colors for background  

float posx, posy;  //declare variables for x and y position
float radius;  //declare variable for radius
float speed = 0.100;  //declare variable for "speed" 
 
 //class constructor (like setup function)
 Ball(float x,float y,float s){
  posx = x;  //set initial x position (random)
  posy = y; // set initial y position (random)
  radius = s; // set initial radius (random)
 
 }
 
 //method for the "math" behind the object
 
 //behavior for ball
 void move(){
  frameRate(35);  
  X = width/2; 
  Y = height/2; 

  
  posy += speed; 
 

  
  if(posx >= height + radius){  //if statement "resets" snowflake
    posy = 0 - radius;        //when it reaches bottom
    posx = random(width);
    speed = random(CENTER);
  
    radius = random(25, 25); 
  }
 }
  
  //method for drawing the object to the screen
  void display(){
    //draw the snowflake!
    //noStroke();
  fill(r, g, b); //color 
  stroke(100); 
  radius = radius + sin( frameCount /4); 
  //track cricle to new destination 
  X+=(nX-X)/delay; //delay effect
  Y+=(nY-Y)/delay; //delay effect
  ellipse(posx, posy, radius, radius); //shape
  fill(150, 0 ,0); 
  ellipse(posy, posx, radius, radius);
  fill(100, 0 ,0); 

  for(int i =1; i<num; i++) { 


    mx[i-1] = mx[i]; 


    my[i-1] = my[i]; 


  } 
  }  
}



