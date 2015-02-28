
class critter1{



  //positon values
  float postx;
  float posty;
 
  //speed values
  float speedx;
  float speedy;
  float accererationx;
  float accererationy;
   
  //size values
  float sizeheight;
  float sizewidth;
   
  //growth rate
  float growthrate;
   
  //color
  color crittercolor;
   
  //constructor
  critter1(float positionx, float positiony, float grow, color rgb, float accelx, float accely){
    postx = width/2;
    posty = height/2;
    speedx = positionx;
    speedy = positiony;
    growthrate = grow;
    sizeheight = 10;
    sizewidth = 10;
    crittercolor = rgb;
    accererationx = accelx / 10;
    accererationy = accely / 10;
  }
   
  //grow
  void grow(){
    sizeheight += growthrate;
    sizewidth += growthrate;
  }
   
  //move
  void move(){
    postx += speedx;
    posty += speedy;
    display();
    speedx += accererationx;
    speedy += accererationy;
 
  }
   
  //draw circle that represents size and position
  void display(){
    fill(crittercolor);
    stroke(crittercolor);
    ellipse(postx, posty, sizewidth, sizeheight);
  }
   
  //draw circle that follows mouse
  void mousefollow(){
    noStroke();
    fill(crittercolor);
    ellipse(mouseX, mouseY, sizewidth, sizeheight);
  }
 
  //update size, position, and speed
  void update(){
    grow();
    move();
  }
   
  //changes the acceleration
  void changeDirection(){
    accererationx = random(-11, 11);
    accererationy = random(-11, 11);
    speedx = 0;
    speedy = 0;
  }
   
  //changes the color
  void changeColor(){
    float rred = random(255);
    float rgreen = random(255);
    float rblue = random(255);
    float ralpha = random(255);
    crittercolor = color(rred, rgreen, rblue, ralpha);
  }
   
  //resets the size to the same size the constructor sets
  void resetSize(){
    sizeheight = 10;
    sizewidth = 10;
  }
}
//////////////////////
//end critter object//
//////////////////////
 
 
//declare variables for setup and draw
int count = 0;
critter1[] critterarray = new critter1[100];
 
PFont f;
String message = "bubbles!";
float theta; 
 
////////////////////////
//set up the draw area//
////////////////////////
void setup(){
  size(640, 640);  // Size must be the first statement
  f = loadFont("Lot-50.vlw");
  frameRate(10);    // Number of frames per second
  color sky = color(0, 191, 255, 0);
  for (int i = 0; i < 100; i++){
    critterarray[i] = new critter1(0, 0, 0, sky, 0, 0);
  } 
}
 
/////////////////
//the draw loop//
/////////////////
void draw(){
//  background(255);

    
  //move and grow objects, increase count(spawn) clock, refresh background
  count++;
  color sky = color(0, 191, 255);
  background(sky);

  for (int i = 0; i <100; i++){
    critterarray[i].update();
  }
 
  if(mousePressed){
    for (int i = 0; i <100; i++){
      critterarray[i].changeDirection();
      critterarray[i].changeColor();
    }
  }
  float ratex = random(-10, 10);
  float ratey = random(-10, 10);
  float growr = random(7);
  float rred = random(256);
  float rgreen = random(256);
  float rblue = random(256);
  float ralpha = random(256);
  color bubcolor = color(rred, rgreen, rblue, ralpha);
  float accelx = random(-11, 11);
  float accely = random(-11, 11);
  critterarray[count] = new critter1(ratex, ratey, growr, bubcolor, accelx, accely);
  if (count == 99)
    count = 0; 
    
      fill(255);
  textFont(f);   
  translate(width/2,height/2); // Translate to the center
  rotate(theta);               // Rotate by theta
  textAlign(CENTER) ;
    text(message,0,0); 
    theta += 0.15; 
}


