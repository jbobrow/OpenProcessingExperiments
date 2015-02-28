
/*
Jenny Hsu
 Creative Computing Section B
 Week 2 Assignment
 13 February 2014
 */

// Declare variables and assign values
int x = 20; 
int y = 140;
int z = 300;

float a = random(100);
float b = random(230);
float c = random(70);

void setup() 
{
  size(600, 600);
  background(255, 255, 255);
  smooth();
}

void draw()
{
  //If mouse is pressed, a rec gradient fill from light to dark will occur
  if (mousePressed) {
    rect(0, 0, 600, 600);
    noStroke();
    fill(a, b, c, 20);
    
  }else{
    
    //Otherwise, ellipse with gradient fill will occur at center 
    noStroke();
    fill(c, b, a, 10);
    ellipse(300, 300, a*8, a*8);
    
  }
}



