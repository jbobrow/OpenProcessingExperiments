
void setup(){ //setup for the height, smoothing, stopping the looping, altering the frame rate, setting to no stroke, changing the rect and ellipse mode to Radius so their co-ord are centred
  size(600, 600);
  smooth();
  noLoop();
  frameRate(5);
  noStroke();
  rectMode(RADIUS);
  ellipseMode(RADIUS);
}

void draw(){ //draw the background, and the rect
  background(100, 100, 220);
  fill(255);
  rect(300, 300, 100, 100, 15);
  fill(0);
  
  int roll = int(random(1, 7)); //generate a variable between 1 and 6 and then if statements to paint the number of ellipses on the rect
  if(roll == 1){
  ellipse(300, 300, 15, 15);
  }
  if(roll == 2){
  ellipse(250, 250, 15, 15);
  ellipse(350, 350, 15, 15);
  }
  if(roll == 3){
  ellipse(300, 300, 15, 15);
  ellipse(250, 250, 15, 15);
  ellipse(350, 350, 15, 15);
  }
  if(roll == 4){
  ellipse(250, 350, 15, 15);
  ellipse(350, 250, 15, 15);
  ellipse(250, 250, 15, 15);
  ellipse(350, 350, 15, 15);
  }
  if(roll == 5){
  ellipse(300, 300, 15, 15);
  ellipse(250, 350, 15, 15);
  ellipse(350, 250, 15, 15);
  ellipse(250, 250, 15, 15);
  ellipse(350, 350, 15, 15);
  }
  if(roll == 6){
  ellipse(300, 350, 15, 15);
  ellipse(300, 250, 15, 15);
  ellipse(250, 350, 15, 15);
  ellipse(350, 250, 15, 15);
  ellipse(250, 250, 15, 15);
  ellipse(350, 350, 15, 15);
  }
  
  if(mousePressed && mouseButton == LEFT) //if the mouse button that was pressed was the left click then it won't keep running the code, it will stop the looping
  noLoop();
}

void mousePressed(){ //if a mouse button is pressed then start looping
 loop(); 
}


