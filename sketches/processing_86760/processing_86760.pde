
// © Julia Shen
// yuans @ andrew.cmu.edu

// variables
float x, y, wd, ht;


void setup( )
{
  
  size(400, 400 );
  x = width;
  y = height;
  wd = width * .5;
  ht = height * .5;

  frameRate(10);
  
  background(47, 30, 66);
  noStroke();
  smooth();

}

void draw( )
{
  
  fill(random(200), random(255), random(255), 15);
  noStroke();
  ellipse(mouseX, mouseY, wd, ht);
  

   if (mousePressed == true) {
    stroke(255);
    strokeWeight(1);
    line(x * .5, y * .5, mouseX, mouseY);  }
    


}




