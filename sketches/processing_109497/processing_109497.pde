
/* @pjs preload="cloud.png"; */

/**
 * Interaction Sketch
 * @author David Anderson
 * Course: ITEC-3450-01
 * Date: Sept 13, 2013
 * 
 * Interactive sketch with multiple features. As the program runs, raindrops fall down in varying speeds.
 * Hover over the cloud to spawn a thunderbolt. Control the raindrop size with the joystick on the right. Adjust the raindrop
 * falling speed with the slider at the top.
 
 * Stop button and slider source: Dr. Lutz
 *  
 */

PImage cloud;

Slider mySlider;
Raindrop myRaindrop1;
Raindrop myRaindrop2;
Raindrop myRaindrop3;
Thunder myThunder;
SizeJoyStick mySizeJoyStick;

int x;
int buttonX = 60;
int buttonY = 60;
int buttonW = 60;
int buttonH = 30;
float prevValue;

boolean running;
String buttonText;

// Setups program
void setup()
{
  running = true;
  buttonText = "STOP";
  mySlider = new Slider(250, 20, 300, 30, "Speed");

  // Create 3 raindrop objects
  myRaindrop1 = new Raindrop(200);
  myRaindrop2 = new Raindrop(250);  
  myRaindrop3 = new Raindrop(300);  

  // Create thunder object
  myThunder = new Thunder();

  // Create size joy stick object
  mySizeJoyStick = new SizeJoyStick();

  cloud = loadImage("cloud.png");  
  size(500, 500);
}

// Draw
void draw()
{   

  // println(mouseX + " " + mouseY);

  background(255);   
  image(cloud, 150, 0);

  //Stop button
  fill(255);
  rectMode(CENTER);
  rect(buttonX, buttonY, buttonW, buttonH);
  stroke(0);
  fill(0);
  textAlign(CENTER, CENTER);
  text(buttonText, buttonX, buttonY);

  myRaindrop1.draw();
  myRaindrop2.draw();
  myRaindrop3.draw();

  mySlider.display();

  if (running) 
  {
    myRaindrop1.move();
    myRaindrop2.move();
    myRaindrop3.move();
  }  

  // If mouse is inside the cloud, create the thunder
  if ((mouseX >= 173 && mouseX <= 337) && (mouseY >= 44 & mouseY <= 136))    
    myThunder.draw();

  // Draws raindrop size joystick
  mySizeJoyStick.draw();

  // If mouse presses up joystick, increase raindrop size
  if ((mouseX >= 428 && mouseX <= 478 && mouseY <= 234 && mouseY >= 189) && mousePressed)  
  {
    myRaindrop1.increaseSize();
    myRaindrop2.increaseSize();
    myRaindrop3.increaseSize();
  }

  // If mouse presses down joystick, decrease raindrop size
  else if ((mouseX >= 428 && mouseX <= 478 && mouseY >= 234 && mouseY <= 277) && mousePressed)  
  {
    myRaindrop1.decreaseSize();
    myRaindrop2.decreaseSize();
    myRaindrop3.decreaseSize();
  }

  fill(150);
  rect(0, 473, 600, 30);
  fill(0);

  text("Speed: " + prevValue*10, 160, 490);
  text("Size: " + myRaindrop1.getSize(), 300, 490);
}


/* Method that controls start/stop button
 * Source: Dr. Lutz
 */
void mouseReleased() 
{
  //see if the mouse loc is within the button boundary 
  if ((mouseX >= buttonX-buttonW/2) && (mouseX <= buttonX+buttonW/2) && 
    (mouseY >= buttonY-buttonH/2) && (mouseY <= buttonY+buttonH/2) ) 
  {
    //stop/start accordingly
    running = !running;
    if (buttonText.equals("STOP")) 
      buttonText = "START";
    else 
      buttonText = "STOP";
  }

  if (mySlider.isUpdating()) mySlider.setUpdate(false);
}

void mousePressed() 
{
  if (mySlider.contains(mouseX, mouseY)) 
    mySlider.setUpdate(true);
}

void mouseDragged()
{
  if (mySlider.isUpdating()) 
  {
    prevValue = (mySlider.interp(mouseX, mouseY));
    mySlider.setValue(prevValue);

    myRaindrop1.setYspeed(prevValue * 10);
    myRaindrop2.setYspeed(prevValue * 10);
    myRaindrop3.setYspeed(prevValue * 10);
  }
}

/**
 * Raindrop
 * @author David Anderson
 * Course: ITEC-3450-01
 * Date: Sept 13, 2013
 * 
 * Class that represents the raindrop object.
 *  
 */

class Raindrop
{
  float rainDropX;
  float rainDropY;

  int rainDropWidth;
  int rainDropHeight;

  float y;

  // Constructor
  Raindrop(float _rainDropX)
  {          
    rainDropX = _rainDropX;
    rainDropY = 150;

    rainDropWidth = 15;
    rainDropHeight = 15;
  }

  // Getter for size
  int getSize()  
  {
    return rainDropWidth + rainDropHeight;
  }

  // Increases size of raindrops
  void increaseSize()
  {
    rainDropWidth += 1;
    rainDropHeight += 1;
  }  

  // Decreases size of raindrops
  void decreaseSize()
  {
    // Prevents sizes smaller than 0
    if (rainDropWidth != 0 && rainDropHeight !=0)
    {
      rainDropWidth -= 1;
      rainDropHeight -= 1;
    }
  }

  // Draw method draws the raindrops
  void draw()
  {      
    fill(0, 0, random(200, 250));   
    ellipse(rainDropX, rainDropY, rainDropWidth, rainDropHeight);
  }

  // Move method controls the raindrops downward movement.
  void move()
  {        
    rainDropY += y + random(0, 5);

    // Moves raindrops down if they fall off screen
    if (rainDropY >= 500)     
      rainDropY = 150;
  }

  void setYspeed(float _f) 
  {  
    y = _f;
  }
}

/**
 * SizeJoyStick
 * @author David Anderson
 * Course: ITEC-3450-01
 * Date: Sept 13, 2013
 * 
 * Class that creates a size joystick
 *  
 */

class SizeJoyStick
{
  void draw()
  {
    fill(255);
    rectMode(CORNER);
    rect(428, 188, 50, 90);
    line(428, 234, 478, 234);

    fill(0);
    textSize(10);
    textAlign(CORNER);
    text("Increase", 432, 215);
    text("Decrease", 432, 259);
  }
}

class Slider {
  private int x,y;      //location
  private int w,h;      // size
  private String label; // tesxt to show
  
  private float value;  // current value for the slider, range is 0 to 1
  private boolean update = false; // flag to signal when slider is being dragged
  
  Slider (int _x, int _y, int _w, int _h, String _label) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    label = _label;
  }
  
  void setValue(float _f) {
      value = _f;
  }
  
 boolean contains(int _x, int _y) {
   return ( (_x>=x-w/2) && (_x<=x+w/2) && (_y>=y-h/2) && (_y<=y+h/2) ) ? true : false;
 }
  
  void display() {
    
    fill(255,0,0);
    textAlign(CENTER,CENTER);
    text(label, x ,y);
    
    // draw the underlaying box
    fill(255,64);
    rectMode(CENTER);
    rect(x,y,w,h);
    
    // draw the box with the current value
    fill(0, 127);
    rectMode(CORNER);
    rect(x-w/2, y-h/2, w*value, h); 
  }
  
  float interp(int _x, int _y) {
   float d = _x - (x-w/2);
   //float new = map (d, x-w/2, x+w/2, 0, 1); // norm is a little easier, conceptually
   float nw = norm (d, x-w/2, x+w/2); 
   //clamp at 0.0, 1.0
   nw = min(1.0, nw);
   nw = max(0.0, nw);
   return nw;
  }
  
  boolean isUpdating() {
    return update;
  }
  
  void setUpdate(boolean _b) {
    update = _b;
  }
   
}
/**
 * Thunder
 * @author David Anderson
 * Course: ITEC-3450-01
 * Date: Sept 13, 2013
 * 
 * Class that represents a thunder bolt object
 *  
 */

class Thunder
{
  float thunderY1;
  float thunderY2;
  float thunderY3;

  int endY = 0;

  // Constructor
  Thunder()
  {          
    thunderY1 = 170;
    thunderY2 = 150;
    thunderY3 = 200;
  }

  // Move method that controls thunder bolts downward movement
  void draw()
  {    
    fill(255, 255, 0);     

    triangle(239, thunderY1, 243, thunderY2, 247, thunderY3);

    thunderY1 += 2;
    thunderY2 += 2;
    thunderY3 += 2;   



    endY += 1;

    // Resets thunder once it falls off screen
    if (thunderY1 >= 500 && thunderY2 >= 500 && thunderY3 >=500)
    {   
      thunderY1 = 170;
      thunderY2 = 150;
      thunderY3 = 200;
    }
  }
}



