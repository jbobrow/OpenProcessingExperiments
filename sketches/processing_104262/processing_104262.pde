
Screen screen; // Class that contains my screen
Ball ball; // Ball element

final int WIDTH = 800;
final int HEIGHT = 600;
final int SCREEN_WIDTH = 500;
final int SCREEN_HEIGHT = 500;
final int BALL_QUANT = 50;
final int SCREEN_VELOCITY = 5;

void setup(){
   size(WIDTH,HEIGHT); // Seting the size of window
   screen = new Screen(); // Init Screen
   screen.width = SCREEN_WIDTH; // Seting size of screen
   screen.height = SCREEN_HEIGHT;
   
   ArrayList<Element> elements = new ArrayList<Element>();
   // Init elements
   
   for(int i = 0; i < BALL_QUANT; i++){
       // Creating 100 ball's element
       elements.add(new Ball(new PVector(random(100, screen.width - 100),random(100,screen.height - 100))));
   }
   
   screen.elements = elements; // Seting screen elements
}

// Method that are call every moment
void draw(){
  background(0); // Paint background black
  screen.draw(); // Call the method draw of Screen
}

void keyPressed(){
  // Method call everytime a key is pressed
   switch(keyCode){// Depeding on the keyCode it's going to do something diferent
      case UP: screen.location.y += SCREEN_VELOCITY; break; // Moviment
      case DOWN: screen.location.y -= SCREEN_VELOCITY; break;
      case LEFT: screen.location.x += SCREEN_VELOCITY; break;
      case RIGHT: screen.location.x -= SCREEN_VELOCITY; break;
      default : break;
   } 
}
class Ball implements Element{
  float radious; 
  PVector location; // Vector with the location
  PVector velocity; // Vector with the velocity
  PVector acceleration;
  Color c;
  private final static float BALL_RADIOUS = 40;
  
  Ball(PVector l){
    // On the constructor it receive the location vector
    this.location = l;
    
    // That determines the radius of the ball
    this.radious = BALL_RADIOUS*2;
    
    // Velocity is a random number between -1.5 and 1.5 for x and y( a Vector )
    this.velocity = new PVector(random(-2.5,2.5),random(-2.5,2.5));
    
    // Acceleration is the variation of velocity in our case is 0
    this.acceleration = new PVector(0,0);
    
    // Color is  a green or blue color
    this.c = new Color(0,random(50,255),random(50,255));
  }
  
  public void update(PVector origem, ArrayList<Element> elements){
    Ball element;
    
    // For each element in the array elements it verify if the distance between the two are equal to the radius
    for(int i = 0; i < elements.size(); i++){
        element = (Ball)elements.get(i);
        
        if(this.location.dist(element.location) <= this.radious){
           // If the distance it's less or equal the limit it draw a white line between the two elements
           stroke(255,150);
           smooth();
           strokeWeight(0.5);
           line(location.x + origem.x, location.y+origem.y ,origem.x + element.location.x , origem.y + element.location.y);
        }
    }
    
    // If the location + the radius/2 is less or equal to the horizontal limits then invert the velocity
    if(location.x + radious/2 >= width || location.x - radious/2 <= 0)
      velocity.x *= -1;
      
    // If the location + the radius/2 is less or equal to the vertical limits then invert the velocity
    if(location.y + radious/2 >= height || location.y - radious/2 <= 0)
      velocity.y *= -1;

    // Update the velocity and location
    location.add(velocity);
    velocity.add(acceleration);
    
    // Draw the ball
    this.draw(origem);
  }
  
  public void draw(PVector origem){
    // Set the color to the ball's color
    fill(this.c.r, this.c.g, this.c.b, 50);
    
    // Set noStroke at all
    noStroke();
    
    // Draw a ellipse with the location
    ellipse(origem.x + location.x,origem.y + location.y,this.radious,this.radious);
    
    // Set the color to white
    fill(255,150);
    
    // Draw a square in the center of the Ball
    rect(origem.x + location.x,origem.y + location.y,2.5,2.5);
  }
  
  public String toString(){
    return "Ball:"+"X: "+this.location.x+"Y: "+this.location.y;
  }
  
}
class Color{
 float r;
 float g;
 float b;

  // Simple color class with red, green and blue
  Color(float r, float g, float b){
    this.r = r;
    this.g = g;
    this.b = b;
  } 
  
}
interface Element{
  
  // Interface that i'm going to use for every element on screen
  void draw(PVector origem);
  void update(PVector origem, ArrayList<Element> t);
  
}
class Screen{
   // My Screen class wich has elements
   ArrayList<Element> elements; 
   
   // A location in wich a screen is looking at
   PVector location;
   float width,height;
  
  
  Screen(){
      // Initilazing with a empty array and at the origin
      elements = new ArrayList<Element>();
      location = new PVector(0,0);
  }
  
  void draw(){
    // Draw all the elements
    Ball element;
    for(int i = 0; i < elements.size(); i++){
      element = (Ball)elements.get(i);
      element.update(location, elements);
    }
    
  }
}


