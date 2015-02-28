
//barbara compagnoni draw tool
int counter = 0; // for fun later
color r = color(255,0,0); //declare and define color red
color y = color(255, 255, 0); //declare and define color yellow
color g = color (0, 255, 0); //declare and define color green 
color b = color (0, 0, 255); //declare and define color blue
color blk = color (0); //declare and define color black for eraser
float xDist; //defines x distance
float yDist; //defines y distance
float xPos = height/2; //sets x position in centre
float yPos = width/2; //sets y position in centre
int fillColor; //defines fill color

void setup () {
  background (0); //background black
  size (500,500); //frame size 500 x 500
  
  fill (r) ; //fill below red
  rect (10, 10, height/10, width/10); //creates rectangle 1
  
  fill (y);  //fill below yellow
  rect (10, 70, height/10, width/10); //creates rectangle 2
  
  fill (g); //fill below green
  rect (10, 130, height/10, width/10); //creates rectangle 3
  
  fill (b); //fill below blue
  rect (10, 190, height/10, width/10); //creates rectangle 4
  
  stroke (255); //stroke white
  strokeWeight (5); //stroke 5 px thick
  fill (blk); //fill below black
  rect (10, 250, height/10, width/10); //creates rectangle 5
}

void draw (){ //begins draw function
  frameRate (60); //sets frame rate to 60
  
  noStroke ();
  fill (fillColor); //sets the fill color of the ellipse trail below
  ellipse(xPos, yPos , 10, 10); //draws ellipse with a trail using the x position and y position of the mouse

  yDist = mouseY-yPos; //calculates the distance from y position to the mouse y position
  xDist = mouseX-xPos; //calculates the distance from x position to the mouse x position
  xPos = xPos+xDist/15; //adds a small fraction of the x distance to the x position 
  yPos = yPos+yDist/15; //adds a small fraction of the y distance to the x position

  counter++; //for fun later
  
  
 if (mousePressed && mouseX > 10 && mouseX < 60 && mouseY > 10 && mouseY < 60){
      fillColor = r; //if mouse in pressed on red square trail changes to red
     }
    else if (mousePressed && mouseX > 10 && mouseX < 70 && mouseY > 10 && mouseY < 120){
      fillColor = y; //if mouse in pressed on yellow square trail changes to yellow
    }
   else if (mousePressed && mouseX > 10 && mouseX < 130 && mouseY > 10 && mouseY < 180){
      fillColor = g; //if mouse in pressed on green square trail changes to green
    }
   else if (mousePressed && mouseX > 10 && mouseX < 180 && mouseY > 10 && mouseY < 250){
      fillColor = b; //if mouse in pressed on blue square trail changes to blue
    }
   else if (mousePressed && mouseX > 10 && mouseX < 260 && mouseY > 10 && mouseY < 310){
      fillColor = blk; //if mouse in pressed on black square trail changes to black
    }
}


