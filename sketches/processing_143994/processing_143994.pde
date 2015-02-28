
 // This is a code fragment that shows how to use an ArrayList.
// It won't compile because it's missing the Ball class.

// Declaring the ArrayList, note the use of the syntax "<Ball>" to indicate
// our intention to fill this ArrayList with Ball objects 

ArrayList<Ball> balls;
int r, g, b; //colors
PFont f;   // text
 

void setup() {
  
  size(500, 500);
  background(r, g, b);
  balls = new ArrayList<Ball>();  // Create an empty ArrayList
  balls.add(new Ball(width/2, height/2, 10));  // Start by adding one element
  f = createFont("Georgia", 28, true);
  
  r = 0; 
  g = 0;
  b = 0;
}

void draw() {
  background(r, g, b);
  textFont(f);
  fill(0);
  textAlign(CENTER);
  smooth();
  text("The Nature of Cells",width/2, 100);

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
    balls.add(new Ball(mouseX, mouseY, balls.get(i).radius/2));
    }
      
   
    
      }
  
}
class Ball{
int X, Y; //ellipse 
int nX, nY; //ellipse 

int num = 100; 
float mx[] = new float[num]; 
float my[] = new float [num]; 
int r, g, b; //colors for background  

float posx, posy;  //declare variables for x and y position
float radius;  //declare variable for radius
float speed = random( -0.1, 0.009);  //declare variable for "speed" 

float radiusMax;
float ballXSpeed =  random(0, 1);
float ballYSpeed =  random(-2, .2);
 
 //class constructor (like setup function)
 Ball(float x,float y,float s){
  posx = x;  //set initial x position (random)
  posy = y; // set initial y position (random)
  radius = s; // set initial radius (random)
  radiusMax = random(20, 25);
 
 }
 
 //method for the "math" behind the object
 //behavior for ball
 void move(){
    
   if (keyPressed) {
    if (key == mouseX || key == mouseY) {
      fill(0);
    }
  } else {
    fill(100,10, 0);
    smooth();
  }
  ellipse(width/2, height/2, radius/2, radius/2); //background ellipse
  noFill();
  smooth();
  ellipse(width/2, height/2, posx+1, posy+1);

  frameRate(35);  
  X = width/2; 
  Y = height/2; 

  posy += speed; 
  posx += speed; 
 
  radius++;
  
  if(radius >= radiusMax){
    radius = radiusMax;
  }

  if(posx >= height + radius){  //if statement "resets" snowflake
    posy = 0 - radius;        //when it reaches bottom
    posx = random(-1, 5);
    speed = random(-1 , 0.009);
    radius = random(-5, 10); 
  }
  
    if (posx > width) {
      ballXSpeed = ballXSpeed * -1;
      }
  if (posx < 0) {
      ballXSpeed = ballXSpeed * -1;
  }
    
  //Bounce off top and bottom of the screen
  if (posy > height) {
      ballYSpeed = ballYSpeed * -1;
      }
  if (posy < 0) {
      ballYSpeed = ballYSpeed * -1;
  }
 }
  
  //method for drawing the object to the screen
  void display(){
    //draw the cell!
    //noStroke();
  fill(r, g, b); //color 
  stroke(0); 
  radius = radius + sin( frameCount /8); 
  //track cricle to new destination 
  posx = posx + ballXSpeed;
  posy = posy + ballYSpeed;
  fill(200, 100 , 10);
  ellipse(posx, posy, radius, radius); //shape
  fill(200, 0, 70);
  stroke(0); 
  ellipse(posx, posy, 20, 10);
  fill(150, 80, 100);
  ellipse(posx, posy, 10, 9.5);
  fill(250, 100, 0);
  noFill();
  stroke(0);
  ellipse(posx, posy, radius*2, radius*3);
  fill(200, 100, 10);
  ellipse(width/2, height/2, radius, radius);
  fill(200, 0, 70);
  ellipse(width/2, height/2, 20, 10);
  fill(150, 80, 100);
  ellipse(width/2, height/2, 10, 9.5);
  smooth();
 
  
  for(int i = 10; i<num; i++) { //increase the size of ellipse


    mx[i-1] = mx[i]; 


    my[i-1] = my[i]; 


  } 
  }  
}
  void keyPressed() {
 r = int(random(256)); //pressing any key will bring out random colors
 g = int(random(256));
 b = int(random(256));
 
}




