
//Create the array for x and y positions and store it from 0 to 1000
//Hold the number of clicks
//Can i have infinate Arrays instead of [1000]?
int xPos[]=new int [1000];
int yPos[]=new int [1000];
int clicks = 0;

//Easly change the ellipse size
float radius = 10;

/*For creating the curving line
float px, py, px2, py2;
float angle;

float frequency = 2;
float x, x2;
*/
void setup() {
  size (800 , 500);
}

//Draw the background in a loop
void draw() {
  frameRate(30);
  smooth();
  background (255);
//  angle = 0;
  
  for (int i = 0; i<1000 && i<clicks; i++) {
    // the color changes as you draw more (more clicks)
    fill(clicks*3,random(0,255),clicks*2);
    stroke(clicks*3,random(0,255),clicks*2);
    strokeWeight(random(2,3));
    ellipse(xPos[i], yPos[i], radius+10, radius+10);
    ellipse(xPos[i], yPos[i], radius, radius);
    if (i>0){
      line(xPos[i-1], yPos[i-1], xPos[i], yPos[i]);
      
    /* I wanted to draw the line in between the balls with using sin and cos? :/    
      px2 = width/8 + cos(radians(angle))*(radius/2);
      py2 = 75 + sin(radians(angle))*(radius/2);
      point(width/8+radius/2+i, py2);
      angle -= frequency;
    */
    
    }
  }
  //to count the clicks
  println(clicks);
}

// Add +1 to clicks
// Get the postion of mouseX , Y for the [# of click]
// so # click has the value of X.Y. to draw the elipse at

void mouseReleased() {
  xPos[clicks]=mouseX;
  yPos[clicks]=mouseY;
  clicks++;
}
                                
