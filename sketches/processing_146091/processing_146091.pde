
int startX = 780;
int startY = 658;
int offset = 145;

void setup()
{
  size(1280, 1280);
  smooth();
}


void draw()
{
  background(255);
  scale(0.74);

  int increment = constrain(mouseX/4, 2, width);
  int radius = increment/2;

  //println(frameRate);

  //Outlines
  strokeWeight(2);
  stroke(141, 153, 139, mouseY*3);

  //weiß
  fill(239, 239, 239);

  //Umrandung
  rect(2, 2, 1276, 1276);
  rect(offset, offset, 990, 990);


  stroke(41, 53, 39, mouseY/3);
  line(250, startY, 1045, 658);

  //transparent
  fill(239, 239, 239, 0);

  //Kreise
  ellipse(395, startY, radius, radius);
  ellipse(startX, startY, radius*4, radius*4);
  ellipse(startX, startY, radius*2, radius*2);
  ellipse(startX + radius*2, startY, radius*2, radius*2);

  //Pattern
  for (int i = increment; i < (width-increment); i = i + (width/increment)*5)
  {
    for (int j = increment; j < (height-increment); j = j + (height/increment)*5)
    {
      int maxPos = width - offset - increment;
      int minPos = offset + increment;

      if (startX+i/2 <= maxPos-increment && startY+j/2 <= maxPos)
        ellipse(startX+i/2+increment, startY+j/2, width/i, width/i);

      if (startX-i/2 >= minPos+increment && startY - j/2 >= minPos)
        ellipse(startX-i/2-increment, startY-j/2, width/i, width/i);
    }
  }
}


void keyPressed()
{
  saveFrame("test#######.png");
}

