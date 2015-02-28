
//int for number of critters (use to start at highest amount) 

Squasher squasher;
Sprite[] sprites= new Sprite[8]; //object name[] name of array
PImage img; // declaring the image
PImage swatter;


void setup(){
  frameRate(60);
  size(900,650);
  ellipseMode(CENTER);
  strokeWeight(2);
  colorMode(HSB,360,100,100);
  noCursor();
  
  squasher= new Squasher(25); //make a new Squasher and give it a radius of 25
  //sets the new sprites random location between 45 and 850 on the x-axis and 
  //580 and 1000 on the y (so some start off the page)
  
  for(int i=0; i<sprites.length; i++){
    sprites[i]=new Sprite(random(45,850),random(680,1000)); }
    
  //load image file
  img= loadImage("blanket.jpg");
  
  //load swatter
  swatter= loadImage("swatter.png");
}

void draw() {
  //draw background
  background(86,95,61);
  image(img,0,0); //blanket image
  //background lines
  for (int i=0; i<width; i+=20) {
  line(i,0,i,800);
  stroke(0,0,99,45);
  }
  
  for(int i=0; i<sprites.length; i++){
  sprites[i].display(); //display the sprites
  sprites[i].flap(); //make the sprites flap
  // if the squasher intersects the sprites, then the sprites are caught
  if (squasher.intersect(sprites[i])){ 
    sprites[i].caught();
  } // if (sprites[i].boolean name){
    // increment how many are at picnic by 1 (local variable in if statement)
    // if number at the picnic is equal to number of how many there are in total
    // then play lose screen
  }
  
  squasher.setLocation(mouseX,mouseY); //set the location of the squasher to the mouse location
  squasher.display(); // display the squahser
  }

  class Squasher { 
    int r; // the radius
    int x;
    int y;
    
    Squasher(int tempR) { // constructor for temporary radius
    //set variables
    r= tempR;
    x=0;
    y=0;
    }
  
  void setLocation(int tempX, int tempY) {
    x= tempX;
    y= tempY;
  }
  
  void display(){
    image(swatter,mouseX,mouseY);
    noFill();
    noStroke();
    ellipse(x+r*1.7,y+r*1.5,r*4.5,r*4.5); // x and y (which is now mouseX and mouseY) diamter and diamter
  }
  
  // test to see if the radius of the squasher intersects the radius of Sprite
  boolean intersect(Sprite s) {
    int distance= dist(x,y,s.cx,s.cy); //s.cx and s.cy are the variables used to define Sprite
    if (distance < r + s.r) { // if the radius of the squasher plus the radius of the Sprite is less than the distance set intersect to true
      return true;
    }else{ // otherwise it is false
      return false;
    }
  }
  } // end of Squasher class
  
  class Sprite { // somewher in here, need boolean that starts at false to test if at picnic

  //variables
  int cx;
  int cy;
  int diameter;
  int r;
  int eyeSize;
  int pupil;
  int speed;
  //color
  int h;
  int s;
  int b;
  //
  int strokeColor;
  int x;
  int y;
  int angle;
  boolean armUp=true;
  
  //constructor--> define above variables
  Sprite(int centerX,int centerY) { //defines center point x to use the mouseX location and y that is stated above in mouse clicked
     cx= centerX;
     cy= centerY;
     diameter= 75;
     r= 30;
     eyeSize= diameter/2;
     pupil= eyeSize/3;
     speed=25;
     angle= -45;
     h=276;
     s=38;
     b=89;
     strokeColor= color(167,90,40);
     
     h=random(167,250);
     speed= constrain(random(10,25));
  }
  
  void display() { 
  //body
  fill(h,s,b);
  stroke(strokeColor);
  strokeWeight(2);
  ellipse(cx,cy,diameter,diameter);
  
  //eyes
  for(int i=0; i<2; i++){ //I want 2 eyes
    fill(0,0,99); //fill it with white
    noStroke();
    ellipse(cx-20+i*40,cy-20,eyeSize,eyeSize); //draw an ellipse 40 pixels subtracted from x and 20 subtracted from y at 60 by 60. Then tell it to add 80 pixels inbetween both eyes (i*80 is the space inbetween each eyes center point)
  }
  
  //pupil
  for(int i=0; i<2; i++){
    fill(0);
    ellipse(cx-20+i*40,cy-20,pupil,pupil);
  }

  //evebrows
  //for(int i=0; i<2; i++){
    stroke(strokeColor);
    strokeWeight(5);
    //line(cx-65+i*60,cy-40,cx-15+i*60,cy-40);
    line(cx-45,cy-30,cx-10,cy-45);
    line(cx+10,cy-45,cx+45,cy-30);
    
  
    // arms
    
    // makes the arms rotate
    x= cos(radians(angle))*r;
    y= sin(radians(angle))*r;
     
    stroke(strokeColor);
    strokeWeight(7);
    line(cx-10-r,cy,cx-r-x,cy+y); 
    line(cx+10+r,cy,cx+r+x,cy+y); 
  
   if(armUp){ 
     angle=angle-5;
   }
   else{
     angle=angle+speed;
   }
   
   if(angle>= 50){
     armUp=true;
   }
   else if (angle<= -30){
     armUp=false;
   }
   
  }
  
  void flap(){
  if(!armUp){ // if armUp is false (the arm is down) move the y center point 4 pixels down the screen
    cy=cy+speed/10;
  }
  else{
  cy=cy-speed/7;
  }  // otherwise (if arm is up) move the y center point 5 spaces up the screen  

  } // if cy <0 statement

void caught() {
  cy= random(800,1000); // when the sprite is caught, move the sprite somewhere off the screen to a random y loctation between 800 and 1000
  cx= random(45,850); // when the sprite is caught, move the sprite somewhere off the screen to a random x loctation between 45 and 850
  speed= speed+3; // when they are caught and then reappear increase the speed by 5 each time
}

} //end of Sprtie class



