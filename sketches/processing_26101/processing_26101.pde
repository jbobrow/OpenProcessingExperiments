
//Melissa Hunt 2011

// Lesson Four Project
// Take the Class you made in Lesson Th ree and make an array of objects from that class.
// Can you make the objects react to the mouse?


//INITIAL SETTINGS
void setup(){
  size (400, 300);
  background (255);
  stroke (255);
  fill (0);
  smooth ();  
}

//REPEAT
void draw(){
  drawCircle(20,20);
  
}

//EVENT HANDLERS
void mousePressed(){
  fill (255,104,3);
  drawCircle(100,100);
  
}

void keyPressed(){
  
 drawCircle (50,50); 
}


//CUSTOM FUNCTIONS
void drawCircle(int CircleWidth, int CircleHeight){
  float xPos = random(10,350);
  float yPos = random(10,250);
  ellipse(xPos, yPos, CircleWidth, CircleHeight);
}

