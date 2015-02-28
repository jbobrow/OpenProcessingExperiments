
//This sketch draws lines with variable tickness and color
//in a simmetric way (horizontal simmetry only).
//Keyboard commands the erasing of window and saving of images

//Larger strokeWeight
int sW = 24;

void setup()
{
  size(800,600);
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  colorMode(HSB);
  pmouseX = width/2;
  pmouseY = height/2;
  smooth();
}

//Whenever mouse is clicked and drawn a line is drawn
//with variable thickness and color
void draw()
{
  if (mousePressed)
  {
    //if (mouseX > width/2) mouseX = width/2;
    mouseX = constrain(mouseX,sW,width/2);
    mouseY = constrain(mouseY,sW,height-sW);
    line(pmouseX,pmouseY,mouseX,mouseY);
    line(width-pmouseX,pmouseY,width-mouseX,mouseY);
    strokeWeight(random(2,sW)); 
    stroke(random(mouseX),random(mouseY),random(1,200));
  }
}

//DELETE or BACKSPACE cancel screen
//s or S save screen in "images" directory with a random number in name
void keyReleased()
{
  switch(key)
  {
    case DELETE:
      background(360);
      break;
    case BACKSPACE:
      background(255);
      break;
    case 's':
      saveFrame("images/simmetry"+floor(random(1,100))+".png");
      break;
    case 'S':
      saveFrame("images/simmetry"+floor(random(1,100))+".png");
      break;
  }
}


