
PImage myImage;
PImage secImage;

void setup (){
  size (900, 700);
  myImage= loadImage("mushroom.jpg");
   //strokeWeight (0);
  noStroke();
  //stroke(0, 0, 125);
  background(255);//white
  frameRate(5);
  smooth ();
}

void draw(){
  //image(myImage, X location, Y location,
  //                  width, height);
  image(myImage, 0, 0, width, height);
  fill (random (300), random (300), random (200), random (100));
  rect(0,0, width, height);
  
  rect (random (900), random (900), random (900), random (900));
 
  
  ellipse (50, 575, 10, 10);
  fill (random (255));
  
  ellipse (60, 600, 30, 30);
  fill (random (255));
  
  ellipse (150, 550, 40, 40);
   fill (random (255));
  
  ellipse (200, 600, 50, 50);
  fill (random (255));
  
  ellipse (250, 545, 25, 25);
  fill (random (255));
  
  ellipse (300, 600, 60, 60);
  fill (random (255));
  
  ellipse (400, 550, 50, 50);
  fill (random (255));
  
  ellipse (500, 500, 70, 70);
  fill (random (255));
  
  ellipse (475, 570, 30, 30);
  fill (random (255));
  
  ellipse (700, 560, 40, 40);
  fill (random (255));
  
  ellipse (750, 300, 30, 30);
  fill (random (255), random (255), random (255), random (255));
 
 
 
  
  ellipse (600, 540, 40, 40);
  fill (random (255), random (255), random (255), random (255));
  
  ellipse (620, 580, 30, 30);
   fill (random (255), random (255), random (255), random (255));
   
 ellipse (80, 550, 25, 25);
 fill (random (255), random (255), random (255), random (255));
 
 ellipse (400, 610, 30, 30);
  fill (random (255), random (255), random (255), random (255));
  
}



 

