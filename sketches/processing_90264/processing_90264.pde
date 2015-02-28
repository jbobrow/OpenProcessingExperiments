
/* @pjs font="Raleway-Heavy.ttf"; */
PFont rh;
PImage np1;


PVector position = new PVector(350, 350);
float d = random(0, 360);
PVector velocity = new PVector (sin(d)*5, cos(d) *5);




int x = 300;

void setup() {
  
  frameRate(24) ;
  smooth(0);
  size(1920, 1080);
  rh = createFont("Raleway-Heavy.ttf", 240) ;
  
  np1 = loadImage("nipsink.jpg") ;

}

void draw() {
  
  background(100);
  image(np1, 0, 0, width, height) ;
  

  
  
  //add acceleration
  velocity.x += 0.01 * velocity.x / abs(velocity.x);
  velocity.y += 0.01 * velocity.y / abs(velocity.y);
   
  // Add the current speed to the location.
  position.x += velocity.x;
  position.y += velocity.y;
 
  // Check for bouncing
  if ((position.x > width) || (position.x < 0)) {
    velocity.x *= -1;
  }
  if ((position.y > height) || (position.y < 0)) {
    velocity.y *= -1;
  }
 
  // Display at x,y location
  stroke(0);
  fill( 255, 80);
  textSize(250);
  text("Nippersink", position.x, position.y);
  textSize(75);
  text("Watershed", random(position.x), random(position.y));
  text("Recycle", random(position.x), random(position.y));
  text("Community", random(position.x), random(position.y));
  text("Rain Garden", random(position.x), random(position.y));
  text("Reuse", random(position.x), random(position.y));


  

  textFont(rh, 200) ;
 // textAlign(CENTER. CENTER);
 stroke(0);
  

  x--;
  if (x < -400) {
    x = 300;
  }
}


