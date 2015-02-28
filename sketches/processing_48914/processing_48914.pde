
void setup() 
{
  size(800, 800);
  background(0);
  smooth();
  noStroke();
  frameRate(5);
}

void draw() 
{
  //begin reseting background
  noStroke();
  fill(0);
  rect(0, 0, width, height);
  //end reseting background

  //begin ground
  noStroke();
  fill(255);
  quad(0, 375, 300, 375, 300, 800, 0, 800); //Cliff

  noStroke();
  fill(255);
  quad(0, 600, 800, 600, 800, 800, 0, 800); //Ground under cliff
  //end ground

  //begin Words
  noStroke();
  textSize(32);
  fill(255, 0, 0);
  text("Happy Holidays!", 100, 700);
  //end words

  //begin Body of snowman
  noStroke();
  fill(255);

  noStroke();
  ellipse(200, 53, 75, 75); //head of snowman

  noStroke();
  ellipse(200, 150, 125, 125); //torso

  noStroke();
  ellipse(200, 295, 175, 175); //bottom part
  //End body of snowman

  //begin face of snowman
  noStroke();
  fill(0);
  ellipse(216, 45, 8, 8); 

  noStroke();
  fill(0);
  ellipse(184, 45, 8, 8); 
  fill(255, 111, 0); //orange
  triangle(205, 53, 195, 53, 200, 83); //carrot nose
  //end face of snowman

  //begin tree
  noStroke();
  fill(67, 39, 9); //brown
  quad(500, 550, 550, 550, 550, 600, 500, 600); //tree trunk

  noStroke();
  fill(50, 100, 20); // green
  triangle(425, 550, 625, 550, 520, 200); //tree 
  //end tree
  
  //start moon
  noStroke();
  fill(255);
  ellipse(600, 100, 100, 100);
  
  noStroke();
  fill(0);
  ellipse(580, 100, 100, 100);
  //end moon
  
  // Snow - Borrowed from T-Stape's christmas tree
  stroke(255, 255, 255);
  strokeWeight(3);

  for (int i = 0; i < 10; i = i+1)
  {
    for (int j=0; j<10; j=j+1)
    {
      point(random(width), random(height));
    }
  }
}

//begin rick - photo from "http://www.contactmusic.com/videoimages/sbmg/rick-astley-never-gonna-give-you-up.jpg"
void keyPressed()
{
  if (key == 'r')
  {
    image( loadImage("rick-astley-never-gonna-give-you-up.png"), mouseX, mouseY);
  }
}
//end roll


