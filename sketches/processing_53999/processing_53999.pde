
//this is the array for the rain drops that will fall 
Rain[] rain = new Rain[300];

 //the image of me
PImage x;    
 
void setup() {
  size(600,600);
  //my pix 
   x = loadImage("me.jpeg");
  noStroke();
  smooth();
 
 
   for (int i = 0; i < rain.length; i++ ) {
     //random (6,10) is the random speed the pictures are falling 
      rain[i] = new Rain(random(width), random(height), random(6,10));
   }
    
 
}
 
void draw() {
  background(255);
 
  noStroke();
 
  
   
   
   
    for (int i = 0; i < rain.length; i++ ) {
    rain[i].fall();
    rain[i].display();
  }
 
}


