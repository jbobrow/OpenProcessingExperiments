
void setup()
{
  size(500, 350);
  background(100);
}

int x=0;

void draw()
{
  
  
  background(100);
  //sky
  fill(50, 50, 255);
  noStroke();
  rect(0,0, 500, 275);
  
  // silly mountains
  strokeWeight(1);
  stroke(0);
  fill(#A07D6C);
    triangle(100,275, 200,135, 430,275);
  triangle(20,275, 100,175, 300,275);

  
  
  //ground
  stroke(0);
  strokeWeight(5);
  line(0, 275, 500, 275);
  


  
  x= mouseX;
  smooth();
  noStroke();
  fill(255, 0, 0);
  rect(100+x, 190, 150, 60);
  noStroke();
  arc(250+x, 250, 150, 120, PI+HALF_PI, TWO_PI);

//wheels
  fill(0, 0, 0);
  stroke(1);
  strokeWeight(10);
  ellipse(100+x, 250, 50, 50);
  ellipse(300+x, 250, 50, 50);



}





