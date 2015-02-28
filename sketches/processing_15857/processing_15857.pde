
//Andres Kõpper
//Processing class, IED Barcelona, Week 5
//21.11.2010

//The sketch can be used as a background installation for music (for example in clubs etc)
//Here it is possible to change a sketch to your liking, by pressing r,g,b,y,q or w  to get different colours for the circes (explained later on).
//To change the background press q - for black and w - for white.


//First, I show what things I have in "the box".

 float diameter = random(0);
  float angle ;
  float ellipse;
  float rect;
 float i;
 float j;
 float distance;
 float o;

float y;
float u;
float t;
float p;

void setup () {
  size(300,300);

smooth();
frameRate(20);
strokeWeight(2); // I set the thickness of the stroke.
}

void draw () {
 
 
  
  int o = 0;
  while (o < width) {
  float distance = abs(mouseX - o); // I make the fill to interact with the mouse and its horizontal location.
  
 p = random(255);
  y = random(255);
  u = random(170,255);

  
  
  fill(distance);
  o +=20;
noStroke();

//I set the main grid by using for array.

for (int i = width/width + 25 ; i < width ; i = i+50) { // Set the beginning and end locations of horizontal ellipses
  for (int j = height/height + 25 ; j < height ; j = j+50) { //Set the beginning and end locations of vertical ellipses
    
    ellipse(i, j, diameter,diameter);
    
    }
    }

    diameter = (15 * sin(angle) ); // I use sin, to set the motion of small-big to the ellipses.
  
  angle += 0.02; 



  
  }
  // I make the keybard interactive with different cases having different effects.
  if(keyPressed) {
    smooth();
noFill();
     switch(key) {
  case 'w': 
   

    background(225);
    }
    switch(key) { // Blue key to produce blue circles.
  case 'b': 
   fill(0,0,255);

    stroke(255);
    for (int i = width/width + 50; i < width - 25; i = i+50) { // The size of the grid
  for (int j = height/height + 50; j < height - 25; j = j+50) {
    
    
    
    ellipse(i, j, diameter,diameter);
}
}
    
    
    
}
}

    switch(key) {
  case 'r': 
   
    fill(200,40,0);
    stroke(255,200,200);
    for (int i = width/width + 100; i < width - 50; i = i+50) {
  for (int j = height/height + 100; j < height - 50; j = j+50) { //  Different grid size
    ellipse(i, j, diameter,diameter);
    stroke(255,200,200);
    }
    }
  }
  switch(key) {
  case 'g': 
   // Green color
fill(70,230,50);
    stroke(250,230,250);
    for (int i = width/width + 150; i < width - 100; i = i+50) { // Different size again
  for (int j = height/height + 150; j < height - 100; j = j+50) {
    ellipse(i, j, diameter,diameter);
    stroke(250,230,250);
    }
    }
  }
    switch(key) {
  case 'y': 
   //yellow color
fill(170,200,0);
    stroke(250,200,255);
    for (int i = width/width + 200; i < width - 150; i = i+50) { // Again different size
  for (int j = height/height + 200; j < height -150; j = j+50) {
    ellipse(i, j, diameter,diameter);
    stroke(250,200,250);
    }
    
    } 
    }
    switch(key) {
  case 'q':        // if letter Q is pressed, everything is cleared and black background.
  background(0);

    
    }
    if(mousePressed) { // Also if mouse is pressed the background turns white

 background(245);
    } 
    

}




