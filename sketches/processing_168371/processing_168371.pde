
void setup ()
{
  size (700,700);
  background (255);
  smooth();
  ellipseMode(CENTER);
  
  
//kleine
noStroke();
fill(0);

ellipse(175,350,50,50);
ellipse(525,350,50,50);
ellipse(350,175,50,50);
ellipse(350,525,50,50);
ellipse(225,225,50,50);
ellipse(475,225,50,50);
ellipse(475,475,50,50);
ellipse(225,475,50,50);

}

void draw()
{
  
  pushMatrix();


  strokeWeight (10);
  stroke (255);
  noFill();
  
 
  
ellipse(175,350,50,50);
ellipse(525,350,50,50);
ellipse(350,175,50,50);
ellipse(350,525,50,50);
ellipse(225,225,50,50);
ellipse(475,225,50,50);
ellipse(475,475,50,50);
ellipse(225,475,50,50);
  
  popMatrix();
  
  pushMatrix();
  
    strokeWeight (20);
  stroke (0,0,0,3);
  noFill();
  
  ellipse(175,350,75,75);
ellipse(525,350,75,75);
ellipse(350,175,75,75);
ellipse(350,525,75,75);
ellipse(225,225,75,75);
ellipse(475,225,75,75);
ellipse(475,475,75,75);
ellipse(225,475,75,75);

popMatrix();

pushMatrix();
 strokeWeight (10);
  stroke (255);
  noFill();
  
ellipse(175,350,100,100);
ellipse(525,350,100,100);
ellipse(350,175,100,100);
ellipse(350,525,100,100);
ellipse(225,225,100,100);
ellipse(475,225,100,100);
ellipse(475,475,100,100);
ellipse(225,475,100,100);
  
popMatrix();
  
  
  pushMatrix();
 strokeWeight (20);
  stroke (0,0,0,3);
  noFill();
  
ellipse(175,350,125,125);
ellipse(525,350,125,125);
ellipse(350,175,125,125);
ellipse(350,525,125,125);
ellipse(225,225,125,125);
ellipse(475,225,125,125);
ellipse(475,475,125,125);
ellipse(225,475,125,125);
  
popMatrix();

  
  pushMatrix();
 strokeWeight (10);
  stroke (255);
  noFill();
  
ellipse(175,350,150,150);
ellipse(525,350,150,150);
ellipse(350,175,150,150);
ellipse(350,525,150,150);
ellipse(225,225,150,150);
ellipse(475,225,150,150);
ellipse(475,475,150,150);
ellipse(225,475,150,150);
  
popMatrix();
  
    pushMatrix();
 strokeWeight (20);
  stroke (0,0,0,3);
  noFill();
  
ellipse(175,350,175,175);
ellipse(525,350,175,175);
ellipse(350,175,175,175);
ellipse(350,525,175,175);
ellipse(225,225,175,175);
ellipse(475,225,175,175);
ellipse(475,475,175,175);
ellipse(225,475,175,175);
  
popMatrix();
  
  strokeWeight(100);
  stroke(255);
  noFill();
  ellipse(350,350,450,450);
  
}
