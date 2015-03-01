
void setup() {
  size(400,300);
  fill(255);
  smooth();
}

//This sets up the sketch's size and background color

void draw() {
  background(200);
  ellipse(mouseX,mouseY,20,20);
  if (mousePressed) {
    if (mouseButton == RIGHT) {
      fill(0,0,255);
      noStroke();
      ellipse(pmouseX,pmouseY,20,20);
      
/*
This sets up the beginning part of the sketch, where an ellipse
will follow the cursor around the screen (it also provides a primary
effect of color when the indicated button on the mouse is clicked)
*/

    }else{
         rect(30,30,50,50);
         rect(30,80,50,50);
         rect(30,130,50,50);
         rect(30,180,50,50);
         rect(80,100,50,50);
         
         rect(120,30,50,50);
         rect(120,80,50,50);
         rect(120,130,50,50);
         rect(120,180,50,50);
         
         rect(200,30,50,50);
         rect(200,180,50,50);
         rect(250,30,50,50);
         rect(250,80,50,50);
         rect(250,130,50,50);
         rect(250,180,50,50);
         rect(300,30,50,50);
         rect(300,180,50,50);
         
/*
This list adds the little greeting that can be seen when clicking         
*/
    }
}
    
       if (mouseButton == LEFT) {
        fill(80,18,32);
        noStroke();
        ellipse(mouseX,mouseY,20,20);
        
      }
}

/*
This final piece sets up the last addition of color when the second
mouse button is clicked, adding a bit pf a strobe effect if both
buttons are clicked in rapid succession!
*/


