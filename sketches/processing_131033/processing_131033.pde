
boolean mouseclicked = false; 
int ellipseX, ellipseY;


void setup() // sets up the size and background colour of the window.
{
   size(640, 480);
   background(255);
 
}

void draw()
{
for (int i = 10; i > 0; i-= 3) //this creates a loop which will create little circles within the ellipse created.
 {

 fill(random(255), 0, random(255), 50); //sets the fill colour, however the last one changes the transparency.
 ellipse(mouseX, mouseY, i*20, i*20);


 if(mouseclicked == true) { //if mouse is clicked then three ellipses will overlap the ellipse created from the loop.
 fill(random(255), 0, random(255), 50);
 ellipse(ellipseX, ellipseY, 200, 200);
 fill(255);
 ellipse(ellipseX, ellipseY, 150, 150);
 fill(255, 200, 255);
 ellipse(ellipseX, ellipseY, 50, 50);
 
 }
 }
}


void mousePressed(MouseEvent e){ //sets the mouse event to e so the next code means that e is click count equal to one. By doing this, it will change the mouseclicked from true to false, changing the mouseX and mouseY and creating the ellipse shown before. 
if (e.getClickCount()==1){
  mouseclicked = true;
  ellipseX = mouseX;
  ellipseY = mouseY;
}
}

void keyPressed()
{
  if(key == 'c'){ //is the key c (for clear) is pressed the background will be white again to give a clear screen.
    background(255);
  }
}



