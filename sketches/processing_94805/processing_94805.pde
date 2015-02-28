
void setup(){
  size(1000,600); //size of screen
  background(0); //black background color
  noStroke(); //gets rid of lines around shape
  fill(255); //text color white
  text("Press C to Clear. Draw by clicking mouse", 0,15); //displays text at 0,15
}

void draw(){
  if (mousePressed == true){ //if mouse is clicked than...
    Star(); //draw a star shape
  }
  if (keyPressed){ //if key is pressed...
    if (key == 'c'){ //if pressed key is c...
      background(0); //redraw background color black(clear screen)
      fill(255); //text color white
      text("Press C to Clear. Draw by clicking mouse",0,15); //displays text at 0,15
    }
  }
  
 
}

void Star(){ //Star funcion
 translate(mouseX+20,mouseY+20); //Changes x and y depending on where mouse is
 fill(random(255), random(255), random(255)); //fill in the star with a random color
 beginShape(); //start the new star to be drawn
 vertex(-20,-70); //top point
 vertex(-6,-40); //point in middle of top and right
 vertex(27,-35); //right point
 vertex(3,-13); //point in middle of right and bottom right
 vertex(9,20); //bottom right point
 vertex(-20,5); //point in middle of bottom right and bottom left
 vertex(-49,20); //bottom left point
 vertex(-43,-13); //point in middle of bottom left and left
 vertex(-67,-35); //left point
 vertex(-34,-40); //point in middle of left and top 
 endShape(CLOSE); //end of the star
  
}



