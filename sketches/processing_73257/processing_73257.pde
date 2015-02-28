

void setup()

{

  size(1000, 400);
  noFill();
  smooth();
  background(255);
  
  frameRate(30);

}

void draw()

{
  
  background(255);
  
  strokeWeight(random(5, 15));
  stroke(random(0, 255), random(0, 255), random(0, 255));
  
  beginShape();
  
  ellipse(490, 200, 20, 20);
  
  vertex (400 , 350);
  vertex (440 , 310);
  vertex (400 , 250);
  vertex (480 , 120);
  vertex (600 , 250);
  vertex (540 , 250);
  vertex (595 , 290);
  vertex (500 , 310);
  vertex (535 , 350);
  
  endShape();
  
}


