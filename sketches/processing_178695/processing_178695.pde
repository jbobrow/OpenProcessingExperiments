

void setup(){
  size(600,300);//Size of Display Window
  background(0);//Creates a Black Window
  fill(255);//Fills Object White
  rect(300,0,300,300);//Creates a Square that covers the Right Side of the Display
  instructions();
}

void draw(){
  smooth();
  noStroke();//Disables the outline
  
  fill(random(255),random(255),random(255),random(255));//Fills Object a Random RGB Colour & Alpha
  if(mouseX>width/2){//If Statement Used (If the x position of the mouse if greater than 600..) 
    fill(random(0,255));//Fill Object a Random Greyscale Shade
  }
  //Creates a circle whereever the cursor is. The radius is determined by the distance of previous mouse position and its current position.
 //The quicker the mouse is moved the larger the circle. 
  ellipse(mouseX, mouseY,(pmouseX-mouseX + pmouseY-mouseY)/2, (pmouseX-mouseX + pmouseY-mouseY)/2);
  reset();
  
}

void reset(){
  if (mousePressed==true){//If the mouse is pressed..
    background(0);
    fill(255);
    rect(300,0,300,300);//it will reset the background back to its original display.
  }
}

void instructions(){
  textSize(20);
  fill(255);
  text("Click Play to Start",50,550);
  text("Click to Reset",50,570);
}



