
//interactive Christmas card

// Declare all global variables 
int x = 0;
int speed = 2;
PImage chato; // A variable for the image file
PImage snowflake;
float z,y;   // Variables for image location
float rot;   // A variable for image rotation


// Setup does not change
void setup() {
  size(1000,1000);
  String url1 = "http://icons.iconarchive.com/icons/aha-soft/standard-new-year/256/Snowflake-icon.png";
  snowflake = loadImage(url1);
  snowflake.resize(50,50);
  String url2 = "https://lh5.googleusercontent.com/-fgtZb_EnNic/AAAAAAAAAAI/AAAAAAAAABo/iIy8P33jiO4/photo.jpg";
  chato = loadImage(url2);
  chato.resize(500,500);
  z = 0.0;
  y = width/2.0;
  rot = 0.0;
  }
  
void draw() {
  background(#90eeae);
  move(); 
  bounce();
  display();
}

// A function to move the banner
void move() { 
  // Change the x location by speed
  x = x + speed;
}

// Moving banner
void bounce() {
  // If it reaches an edge, reverse speed
  if ((x > width) || (x < 0)) {
    speed = speed * - 1;
  }
}

// A function to display the rectangle
void display() {
  stroke(0);
  fill(#ff8787);
  rect(x,100,600,100);
  fill(#ffffff);
  textSize(32);
  text("Merry Christmas",x+175,160);
  fill(#FAFAFA);
  rect(x,300,600,600);
  
  if (x > 100) {
  fill(#ffffff);
  rect(x,100,600,100);
  }
  if (x > 100) {
  fill(#ff8787);
  text("Merry Christmas",x+175,160);
  }
   if (x > 200) {
  fill(#ff8787);
  rect(x,100,600,100);
  }
  if (x > 200) {
  fill(#ffffff);
  text("Merry Christmas",x+175,160);
  }
   if (x > 300) {
  fill(#ffffff);
  rect(x,100,600,100);
  }
  if (x > 300) {
  fill(#ff8787);
  text("Merry Christmas",x+175,160);
  }
  
  if (x > 400) {
  fill(#ff8787);
  rect(x,100,600,100);
  }
  if (x > 400) {
  fill(#ffffff);
  text("Merry Christmas",x+175,160);
  }
   if (x > 500) {
  fill(#ffffff);
  rect(x,100,600,100);
  }
  if (x > 500) {
  fill(#ff8787);
  text("Merry Christmas",x+175,160);
  }
  
  image(chato,x+45,345);
  // Translate and rotate
  translate(z,y);
  rotate(rot);
  
  // animate image
  image(snowflake,0,0);
  
  // Adjust variables for animation
  z += 1.0;
 rot += 0.02;
 
 if (z > width+snowflake.width) {
    z = -snowflake.width;
 }
 
}

 void keyPressed() {
if(key == '1') {
    speed = 1;
  }
if(key == '2') {
    speed = 2;
  }
if(key == '3') {
    speed = 3;
  }
if(key == '4') {
    speed = 4;
  }
if(key == '5') {
    speed = 5;
  }  
}


