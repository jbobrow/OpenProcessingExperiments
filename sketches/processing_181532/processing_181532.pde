
/* 
Exercise Three: Time
Suzanne Boretz
This program rotates a square, circle, and line over one minute.
I am confused about why the original shapes get drawn each time and at full opacity... 
It probably has something to do with the if statement's placement, but I don't see how it's happening. 
Also I originally wanted to rotate something on the outside in the opposite direction of the square, 
but I feel like I tried everything and it couldn't get it to work. Is it possible to rotate objects
in different directions? 
*/

int v1; //vertex length of the square
int counter; //counting variable that will increase every second
float startY; 
float startX;
float angle = 0.0;
float alpha = 0; //first alpha value
float alpha2 = 0; //second alpha value
int lastTime;
int pause = 1000; 
int ellipseW;
PImage img;


void setup(){
  size(500, 500); //sets canvas size
  counter = 1; //assigns a value to the counter
  v1 = 150; //sets the vertex length of the square
  startX = width/2; //where the window origin will be moved to
  startY = height/2;
  ellipseW = 15;
  lastTime = millis(); //sets the start time to the current time in milliseconds
  background(0, 30, 30);
  alpha = 15;
  img = loadImage("kitten03.png");
}


void draw(){
  translate(startX, startY); //moves the origin to the starting points
  stroke(255, 255, 255, alpha); //sets the stroke
  strokeWeight(4); //sets the stroke weight
  noFill(); //sets no fill
  rect(0 - v1 /2, 0 - v1/2, v1, v1); //draws a rectangle outline
  
  if(millis() >= lastTime + pause && counter <= 60) { //if the current time is greater than the last time we checked plus the pause
    angle += (PI/30); //increases the value of angle
    rotate(angle); //rotates the origin
    lastTime = millis(); //last time gets the current time
    rect(0 - v1 /2, 0 - v1/2, v1, v1); //draws a rectangle outline
    counter++; //counter increases
    alpha += 0.75; //alpha increases
    alpha2 += 3.5; //alpha2 increases
  } 
 
  stroke(255, 255, 255, alpha2); //sets the stroke
  line(0, -v1, 0, -v1 - v1/6); //draws a line
  noStroke(); //sets no stroke
  fill(204, 0, 102, alpha); //pink
  ellipse(0 - v1/2, 0 + v1/2, ellipseW, ellipseW); //draws a circle
  fill(178, 102, 255, alpha); //purple
  ellipse(0 - v1/2, 0 - v1/2, ellipseW, ellipseW); //draws a circle
  fill(102, 178, 255, alpha); //blue
  ellipse(0 + v1/2, 0 + v1/2, ellipseW, ellipseW); //draws a circle
  fill(255, 178, 102, alpha); //orange
  ellipse(0 + v1/2, 0 - v1/2, ellipseW, ellipseW); //draws a circle
  
  if(counter == 61){
    image (img, -50, -50);
  }
    
}


