

//some varabel for our object we will interact with 
float xPos=0;  
float yPos=0;
float d=5;

void setup() {
  size( 400, 400);    //screen size 400 x 400
  background(255);    //background white
  xPos= width/2;      //postition our ellipse in the center of the screen
  yPos=height/2;
}

void draw() {
  background(255);    //every frame re draw with white backgorund
  
  stroke(0);  //line colour is black          
  strokeWeight(0.1);  //very thin line
  ellipse(xPos,yPos,100,100);  //draw a large ellips this is our line of collision

  //if you mouse is inside the ellips above 
  // distance from center to mouse is less than radius
  if (dist(mouseX, mouseY, xPos, yPos) <50) {
   
    //calculate the distance in the x axis from our ellipse
    //to our mouse
    float xDist = mouseX-xPos;
 
    //map the distance from its range 0-100 to a much smaller one 0-10
    //this means the furhter our mouse the quicker it will move towords it
    // as we get closer it slows and we get a nice deceleration effect
    float xMove = map(xDist, 0, 100, 0, 10);
    
    //change the xPos by the amoutn we have calculated
    xPos+=xMove;
    
    //duplicate the previous three steps for the y axis and you ellipse will move in 2 dimensions
    
  }
  //draw the ellips at the center
  ellipse(xPos, yPos, d, d);
}

