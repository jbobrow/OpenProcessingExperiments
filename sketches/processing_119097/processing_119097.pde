
Catcher catcher;
Drop[] drops = new Drop[10];
int caught = 0;
float catcher_x = 0;
float catcher_y = 0;
float catcher_w = 0;
float catcher_h = 0;
float drop_x;
float drop_y;
int lives=10;

 PImage img;
 PImage bin;
 PImage can;
 PImage over;
 


void setup(){
  
  //sets the size of the background and size of the game
  size(800,800);
  
  //loading the images for the animations
    img = loadImage("Recyclinggamebackground.png");
    bin = loadImage("transparentgreenbin.png");
    can = loadImage("can1.png");
    over = loadImage("Backgroundrecycling.png");
    
  
  //int totalDrops = 10;
  size(800,800);
  //when the drop is caught by the catcher this creates a loop for another drop to be created
  catcher = new Catcher(50);
  drops = new Drop[10];
  
  //this is for the repeating of the dropping of the cans after they have been caught
  
  for (int i = 0; i < drops.length; i++ ) {
    drops[i] = new Drop();
  }
  
  //catcher.display();
}
void draw(){
  
  //background colour of white
  background(255);
  
  //Inclusion of recycling background done using Photoshop
   
image(img, 0, 0 );    
  
  //text at the top left-hand corner to demonstrate the user's score
  text(caught, 10,10);
  
  
  for (int i = 0; i < drops.length; i++ ) {
    
    drops[i].display();
    drops[i].move();
  }
  //this demonstrates where the can hits the area of the catcher
  catcher.display();
  
  catcher_x = mouseX-50;
  catcher_y = 500;
  catcher_w = catcher.get_catcher_width();  // need to code this
  catcher_h = catcher.get_catcher_height();
  
  for (int i = 0; i < drops.length; i++ ) {
    
    drop_x = drops[i].get_drop_x();
    drop_y = drops[i].get_drop_y();
    //shows that when the x/y position of the catcher hits the x/y position of the can then it has been caught and the drop loop begins again
     if(drop_x > catcher_x && drop_x < (catcher_x+catcher_w) && drop_y > catcher_y && drop_y < (catcher_y+catcher_h) )  // collision detected
     {
       // add to the counter
      // background(255,0,0);
       drops[i].setCaught();
       caught++;
     } else if (drop_y > height) {
       lives = lives-1;
       drops[i].setCaught(); 
     }
     //shows that after 10 lives meaning the cans have hit the bottom of the screen ten times then the game is over
  }
  if (lives <= 0){
    background(0);
    image (over, 0,0);
    noLoop();
  }  
}


//∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞
//                                  Bin
//∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞
class Catcher {
  float r;   // radius
  color col; // color
  float x,y; // location
  float c_width;                // maybe set depending on image
  float c_height;
  //this shows the image of the catcher and the area it travels according to the mouse position
  Catcher(float tempR) {
    r = tempR;
    col = color(250,10,10,150);
    x = width/2;
    y = 500;
    c_width = 180;
    c_height = 100;
  }
  
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
  //This is the image of the bin and its positioning on the page according to where the mouse travels
  void display() {
    stroke(0);
    fill(col);
    //rect(mouseX-50, 575, 100,100);  // change to image
    image(bin,mouseX-50,500);
  }
  //these floats show the catcher's movements and job when the can is being caught
  float get_catcher_x(){
    return x;
  }
  
  float get_catcher_y(){
    return y;
  }
  
  float get_catcher_width(){
    return c_width;
  }
  
  float get_catcher_height(){
    return c_height;
  }
}
//∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞
//                                  Can
//∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞
class Drop {
  float x,y;   // Variables for location of raindrop
  float speed; // Speed of raindrop
  color c;
  float r;     // Radius of raindrop
  float w,h;
  boolean caught;
  //demonstrates when and where the cans will fall
  Drop() {
    r = 9;                 // All raindrops are the same size
    x = random(width);     // Start with a random x location
    y = -r*4;              // Start a little above the window
    speed = random(1,5);   // Pick a random speed
    c = color(50,250,50); // Color
    w=10;
    h=10;
  }
  // Move the raindrop down
  void move() {
    // Increment by speed
    y += speed; 
  }
  // Display the raindrop
  void display() {
    // Display the drop
    fill(c);
    noStroke();
    image(can,x,y);
    //ellipse(x,y,w,h);
    
    if (y > height + r*4) { 
      y=-r*4;
      speed = random(1,5);
    }
    
    if(caught == true){
      y=-r*4;
      speed = random(1,5);
      caught = false;
    }
 }
 
  float get_drop_x(){
    return x;
  }
  
  float get_drop_y(){
    return y;
  }
  
  void setCaught(){
    caught = true;
  }
    
    
  }


