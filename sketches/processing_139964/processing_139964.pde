

 
void setup() {
  size(600,600); //this is the pixel size of the sketch, so it is 600px wide and high
  smooth();
}
 
void draw() {
  background(#F7819F); //this is the color for the background
   
  float x = mouseX; //this gives the component X and Y for anything that requires it
  float y = mouseY; //for example, the eye movement needs x and y, which is determined by where the mouse is
   
stroke(0);
  strokeWeight(5); //this is how large the stroke of color is for the face, if i increase it, the face looks all bubbly because of how large the stroke is
  fill(#0040FF); //this is the color for the face
  beginShape();
  vertex(150,300); //these are all the vertecies of the face of the monster
  vertex(250,100);
  vertex(350,100);
  vertex(450,300);
  vertex(350,500);
  vertex(250,500);
  vertex(150,300);
  endShape();
   

stroke(11); //this is the stroke color for the perimeter of the frown
arc(300, 420, 150, 150, -PI, 0);  //this determineds the position (x and y coordinates) and the size of the arc that makes up the frown
  
stroke(200);  //this is the stroke color for the perimeter of the nose, the higher it is, the lighter the color
  rect(300, 255, 50, 50); //these three rectangles determine the x and y coordinates of the nose parts, and the size of the rectangles that make it
  rect(250, 255, 50, 50);
  rect(275, 200, 50, 100);
  
  
 noFill();
  stroke(#0040FF); //the color of the arms
  strokeWeight(30); //the size of the stroke that makes the arms
  bezier(100,400,100,420,180,550,150,1550); //the positions of the arms
  bezier(500,400,600,620,180,550,450,1550);
  fill(#0040FF); //the color of the hands/palms
  rect(90,400,50,50);     //these rectangles create the palms and fingers of the monster, they start with the coordinates, and then the dimensions of the rectangles 
  rect(480,350,50,50);
  rect(90,330,1,50);
  rect(139,330,1,50);
  rect(480,275,1,50);
  rect(529,275,1,50);
    
//these make the eyes    
    
  noStroke();
  fill(#0040FF);  //this is the color of the perimeter of the eyes
  ellipse (y,x,55,55); //this is the size of the circle that makes the outer eye
  fill(255); //this is the color of the middle eye
  ellipse(y,x,40,40); //this is the size of the middle eye
  fill(0); //this is the color of the center eye
  ellipse(y,x,15,15); //this is the size of the center eye

  fill(#0040FF); //this is the color of outer eye
  ellipse(x*0.5,y*0.5,95,95); //size of the outer eye
  fill(255); //color of middle eye
  ellipse(x*0.5,y*0.5,80,80); //size of middle eye
  fill(0); //color of inner eye
  ellipse(x*0.5,y*0.5,50,50); //size of inner eye
 
}

//code for the eyes goes last so that they overlap everything else
//this is so that the eyes do not move behind the head or hands or arms. THey are supposed to be floating in space like an alien so they shouldn't be behind it.


