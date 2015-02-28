
//Arc Clock 1
//this code was written exclusivly by James Frankis

int s;

float rand1, rand2, map_s;

int r = 255;
int g = 255;
int b = 255;

float change1= random(-2000, 2000);
float change2 = random(-2000, 2000);

int centerX = 400;
int centerY = 400;

int circleX = centerX;  
int circleY = centerY;

int diskW = 200;
int diskH = 200;

float pos = 0;

float positionX = 0;
float positionY = 0;

void setup(){
  
  size (800, 800);
  background (0);
  smooth();
  ellipseMode(CENTER);

}


void draw(){
  
diskW=150; 
diskH=150;


  
  frameRate(60); //lower frame rate so as not to create too many curves
  // each second
  
  s = second();

  
  rand1 = random(-4000, 4000); //creates a random number so the curves 
  //are very slightly different
  rand2 = random(-6000, 6000); //creates a random number so the curves 
  //are very slightly different
  
  if (s==0){ //at the end of each minute this if statement resets everything
    noStroke();
    fill(0,0,0,50);
    rect(0,0,width,height);
    change1= random(-1000,1000); //creates a new random number all 
    //the curves that minute
    change2= random(-9000, 9000); //creates a new random number all
   // the curves that minute
   
       positionX = random(0, width);
    positionY = random(0,height);
    
    r=r-1; //cycles down through shades of red
  g=g-10; //cycles down through shades of green
  b=b-5; //cycles down through shades of blue

  if (r<=0){ //if r (red) drops below zero this reverts it back to 255
    r=255;
  }

  if (g<=0){ //if g (green) drops below zero this reverts it back to 255
    g=255;
  }

  if (b<=0){ //if b (blue) drops below zero this reverts it back to 255
    b=255;
  }
   
  }

 
 
  map_s = (map(s, 0, 59, 0, 6.2)); //maps seconds from 0 - 6.2
 // rather than 0 - 59

  noFill();
  
  
 strokeWeight(0.1);
  stroke(r, g, b);

  curve(rand1, change1 ,positionX,positionY, circleX, circleY, change2, rand1); 
  //draws similar but random curves


  circleX = int(centerX + 0.5 * diskW * cos(map_s-1.55)); 
  //creates an x co ordinate for a circle of points that changes each second
  circleY = int(centerY + 0.5 * diskH * sin(map_s-1.55)); 
  //creates a y co ordinate for a circle of points that changes each second

  

println(s); //prints seconds in the prompt window as the programe runs

}



