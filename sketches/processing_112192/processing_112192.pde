
//Creators: (Group 14) Alexander, Tristan, Ryan and Rachael
//27.09.13
// AC21010.1 submission

//Set background size and colour
void setup()
{
  noStroke();
  smooth(); 
  size(600,600);
  background(78,195, 245);
}
 
void draw()
{
  //Call the functions required to draw Kirby
  drawClouds(); 
  drawFeet();
  drawArms();
  drawBody();
  drawFace();
  drawGrass();
  
  noLoop(); //Stop execution to reduce resource usage and prevent overlapping Kirbys
}
 
void drawClouds() //Creates 5 clouds with a random shape in a random location
{
  fill(255, 255, 255, 180);
  
  for(int i = 0; i < 5; i++) 
  {
    ellipse(random(500), random(600), 200 - random(50), 100 - random(50));
  }
}
 
void drawFeet()
{
  fill(217, 15, 82); 
  
  //Left foot
  rotate(radians(60));
  ellipse(460, 80, 120, 180);
  rotate(radians(300));
  
  //Right foot
  rotate(radians(130));
  ellipse(50, -600, 120, 180);
  rotate(radians(230));
}

void drawArms()
{
  //Left Arm
  fill(235, 157, 200);
  rotate(radians(140));
  ellipse(0, -265, 120, 180);
  rotate(radians(220));
  
  //Right arm
  rotate(radians(60));
  ellipse(430,  -270, 120, 180);
  rotate(radians(300));
}

void drawBody()
{
  //Code for Kirby's body
  strokeWeight(0);
  ellipse(300,300,300,300);
}

void drawFace()
{
  //Returns pen to black
  fill(0);
  ellipse(265, 250, 35, 100); //Left eye
  ellipse(330, 250, 35, 100); //Right eye
  
  fill(255); //Turns pen to white
  
  //White of the eyes
  ellipse(265, 220, 20, 32);
  ellipse(330, 220, 20, 32);
  
  //Cheeks
  fill(219, 77, 155, 150);
  strokeWeight(0); //Removes outline
  ellipse(210, 320, 50, 25); //Left Cheek
  ellipse(385, 320, 50, 25); //Right Cheek
  
  //Mouth
  fill(117, 1, 36); 
  arc(300, 335, 60, 60, -0.75, PI+QUARTER_PI, CHORD); 
  
  //Tongue
  fill(217, 15, 82); 
  arc(300, 340, 45, 45, -0.75, PI+QUARTER_PI, CHORD);
}

void drawGrass()
{
  //Grass
  fill(35, 232, 61);
  ellipse(300, 1000, 1000, 1000);
}
