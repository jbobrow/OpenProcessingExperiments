
// ASSIGNMENT 5

void setup() {
  size(600,600); //this determines the size of the sketch, it is 600 pixels wide and 600 pixels high
  smooth();
}

void draw() {
  background(#000000); //the background color for the sketch will be black.
  
  float x = mouseX;
  float y = mouseY; //this determines the variables x and y for any shape or function that requires it.
  
  //feet
  
  noFill();
  stroke(80);
  strokeWeight(20);
  line(300,400,300,450);
  bezier(250,500,250,450,350,450,350,500); //this creates the arc shape for the legs
  noStroke();
  fill(#610B38); //this is the color of the leg
  ellipse(250,500,50,50); //this creates the two circle shapes at the bottom for feet
  ellipse(350,500,50,50);
  
     
    // face
    fill(255);
  stroke(80);
  strokeWeight(3);
  ellipse(270,180,80,80); //this creates two circle shapes for the eye balls, the numbers are the x, y coordinates and the height and width of the eye balls
  ellipse(330,180,80,80);
  
  float pupilX1 = map(mouseX,0,width,245,280); //this determines the x and y of the pupils for the eyes
  float pupilX2 = map(mouseX,0,width,305,355); //it determines where they go in relation to the movement of the mouse
  float pupilY = map(mouseY,0,height,150,210);
  noStroke();
  fill(0);
  ellipse(pupilX1,pupilY,20,20); //this is where the pupils go on the axis.
  ellipse(pupilX2,pupilY,20,20);
  
  stroke(0);
  strokeWeight(5);
  fill(#610B38); //this is the color of the face/body of the monster
  beginShape();
  rectMode(CENTER);  // this sets the rectangular shape to the center
  rect(300, 325, 250, 270, 100); //these are the coordinates of the shape for the face and its size.
  endShape();
  
  // happy face / sad face
  
  
  stroke(11); //this is the stroke color for the perimeter of the frown
arc(300, 420, 150, 150, -PI, 0);  //this determineds the position (x and y coordinates) and the size of the arc that makes up the frown
  
 
 
 
  
  // moving eyes
  
  noStroke();
  fill(#610B38); //color of the outline of the eyes
  ellipse (y,x,75,75); //size of the eyes in pixels
  fill(255); //color of the eyes
  ellipse(y,x,65,65); //size of the white eyes
  fill(0); //color of the pupils
  ellipse(y,x,50,50); //size of the pupils
  
  fill(#610B38);
  ellipse(width-x,height-y,75,75);
  fill(255);
  ellipse(width-x,height-y,65,65);
  fill(0);
  ellipse(width-x,height-y,50,50);
  
  fill(#610B38);
  ellipse(x*0.5,y*0.5,75,75);
  fill(255);
  ellipse(x*0.5,y*0.5,65,65);
  fill(0);
  ellipse(x*0.5,y*0.5,50,50);
}




