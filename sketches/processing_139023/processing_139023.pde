


/*Project 1 : Due next week

  -connect and move three points in space
  *use conecpts in original ways
     -coordinates,shapes,color    |
     -variables,math              |
     -conditionals                |
     -forloops                    |    
     -//comments, on how it works |
     */




/*float xPos;
float yPos;
float speedX;
float speedY;
*/

void setup(){
  size (800,500);
  
/*  xPos = 10;
  yPos = 10;
  speedX = 5;
  speedY = 5;
 */
}



void draw(){
  

  
/*This is the code for the the lines that are connecting at the location 
of the mouse, you can move the lines anywhere on the screen. While moving the lines
theyeach change colors on a different hue scale*/
  strokeWeight(.3);
  stroke(random(0, 110),random(0, 200),random(0, 130));
  line(mouseX,mouseY,400,500);
  stroke(random(0, 190),random(0, 105),random(0, 200));
  line(mouseX,mouseY,0,500);
  stroke(random(0, 120),random(0, 110),random(0, 210));
  line(mouseX,mouseY,800,500);
  
  
  
  
/*This is the code for the looping circle at the end of the point from the three lines.
Like the lines this ellipse also follows the mouse whereever it goes, it also has a stroke
that changes hues in its own scale, seperate from the hue scales on the lines. */
  strokeWeight(.1);
  stroke(random(0, 220),random(0, 110),random(0, 100));
  noFill();
  for(int i = 0; i < 5; i++){
     ellipse(mouseX,mouseY,i*5,i*5);}
     
     
     
  
  
  
  
/*This code is for the black rectangle shape in the corner.
When hovering over the rectangle it is like wiping the screen clean of what was drawn by the
lines and ellipse. It changes the background white and when you are no longer over the rectangle
you can go back to drawing with the ellipse and lines, just like before. */
  if(mouseX>20 && mouseY>20 && mouseX<40 && mouseY<40){
    stroke(0);
    fill(0);
 ellipse(20,20,20,20);
 background(255);} 
 else{
   noStroke();
   fill(0);
    ellipse(20,20,20,20);}
  



}













/* This was a code for for "bouncing" shapes in the screen. There was three different
colored shapes two rectangle and an ellipse. As they bounced along the screen
they left behind a drawn texture folowing their course. The texture is in the form of the 
three different shapes.
 
 
 stroke(255);
fill(0);
   rect(xPos,yPos,50,50);
fill(150);
    rect(xPos,yPos,30,30);
fill(255);
  ellipse(xPos,yPos,10,10);
 
  xPos += speedX; //movement
  yPos += speedY;
  if (xPos>width){
    speedX *= -1;
  }
  if (yPos>height){
    speedY *= -1;
  }
  if(xPos < 0){
  speedX *= -1;
  }
  if(yPos < 0){
  speedY *= -1;
  }*/  


