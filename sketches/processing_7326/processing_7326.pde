
//
// Keith O'Hara <kohara@bard.edu>
// Feb 2010 example
// CMSC 117

void setup()
{
 smooth();
 size(300, 300);
}

void draw()
{
  //head
  //rect(50, 75, 150, 200);
  quad(50, 75, 200, 75, 240, 275, 10, 275);

  // left eye
  ellipse((50 + 125) / 2, 130, 25, 50);
  
    // right eye
  ellipse((200 + 125) / 2, 130, 25, 50);

  // left pupil - moves with the mouse
  // compute how far the mouse is from the center line and 
  // move the pupil in that direction
  ellipse((mouseX - 125) / 15 + (50 + 125) / 2, 
          (mouseY - 125) / 15 + 130, 5, 5);
  
  //right pupil - moves with the mouse
  ellipse((mouseX - 125) / 15 + (200 + 125) / 2, 
          (mouseY - 125) / 15 + 130, 5, 5);

  //nose
  bezier(125, 150, 
         205, 140, 
         205, 185,  
         125, 180);

  // eyebrows
  strokeWeight(3);
  line(80, 90, 110, 110);
  line(150, 110, 180, 90);
  
  // mouth
  fill(128);
  stroke(128);
  ellipse(145, (75+150), 50, 25);
  fill(255);
}

