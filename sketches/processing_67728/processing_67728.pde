

//INITIAL SETTINGS

void setup(){
  size (400, 300);
  background (0);
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

  fill (0);
  
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


