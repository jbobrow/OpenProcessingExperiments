
// Homework 7
// copyright Christina Lee September 2011 Pittsburgh, PA 15289

float x, y, horizontal, vertical, faceWidth, faceHeight;
PImage face; //naming the image

void setup()
{
  size(500, 500);
  x = width/2; //x position of face
  y = height/2; //y position of face
  faceWidth = 132; //face width
  faceHeight = 200; //face height
  face = loadImage("face.png"); //loading face
  imageMode(CENTER);
}

void draw()
{
  horizontal = map(mouseX, 0, width, 0, 4); //horizontal speed of face
  vertical = map(mouseY, 0, height, 0, 4); //vertica, speed of face
  smooth();
  setting(); //background
  drawFace(); //positioning and sizing face
  moveFace(); //animating the face
  Reset(); //reset keypressed function
}

void setting()
{ 
  fill(random(255), random(255), random(255), 100);
  rect(0, 0, width, height);
}

void drawFace()
{ 
  image(face, x, y, faceWidth, faceHeight);
}

void moveFace()
{ 
  x = x + horizontal; //animating the face horizontally
  y = y + vertical; //animating the face vertically
  if (x > width+faceWidth/2) //as the face moves right...
  { 
    x = -faceWidth/2; //the face wraps back to the left
  }

  if (x < -faceWidth/2) //as the face moves left...
  { 
    x = width + faceWidth/2; //the face wraps back to the right
  }

  if (y > height + faceHeight/2) //as the face moves up...
  { 
    y = -faceHeight/2; //the face wraps back to the bottom
  }

  if (y < -faceHeight/2) //as the face moves down...
  { 
    y = height + faceHeight/2; //the face wraps back to the top
  }
}

void Reset ()
{ 
  if (keyPressed) {
    if (key == 'r') //if the r key is pressed...
    { 
      x = width/2; //the position of the face goes to the center
      y = height/2;
    }
  }
}


