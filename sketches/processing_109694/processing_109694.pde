
// Siu Ho Wun
// Student ID: 52623053
// Assignment 1

void setup(){
  size(600,600);//the size of the display
  noStroke();
  background(255);
  frameRate(5);
}

void draw(){
  float x = random(width);
  float y = random(height);
  float v1 = random(150);//random red value
  float v2 = random(255);//random green value
  float v3 = random(255);//random blue value
  noStroke();

 if (mouseX <200) { // if mouse horizontally position below 200,the programme will draw the random color of red or yellow rectangle.
 fill(341,v2,v3,80); //random color
 rect(random(width),random(height),x,y,5);//random size of the rectangle
 }
 
else {
 fill(v1,v2,v3,130);//random color
 rect(random(width),random(height),x,y,5);//random size of the rectangle
 }

if (mousePressed==true){ // if mouse Pressed,all rectangles will be erase.
  background(255);//the background will turn to white
}

}




