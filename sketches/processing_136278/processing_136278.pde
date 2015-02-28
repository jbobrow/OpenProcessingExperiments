
 float _randomBallSize[] = { 
  200, 300
};
float []red = {
  255, 125, 30
};
float []grn = {
  17, 152, 15
};
float []blu = {
  255, 0, 175
};

float _headWidth = 200;
float _headHeight = 200;




void setup()
{   
  size(500, 500);
  noStroke(); 
  frameRate(5);
  background(210);
}


void draw()
{    
  fill(255);
 fill(red[(int)random(3)], grn[(int)random(3)], blu[(int)random(3)]);
  ellipse(width/2, height/2, 150, 150);
  fill(red[(int)random(0)], grn[(int)random(1)], blu[(int)random(2)]);
  ellipse(width/2, height/2, 75, 75);
}


void keyPressed()
{

  ellipse(255, 255, 300, 300);

 


  _headWidth  = random(_randomBallSize[0], _randomBallSize[1]);
  _headHeight = random(_randomBallSize[0], _randomBallSize[1]);
}


void makeFace()
{
  fill(255);
} 


