
void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  background(255);
  
  //Sekundenkreis
  translate(width/2, height/2);
  
  for (int i=0; i<360; i+=20)
  {
    pushMatrix();
    rotate( radians(i) );
    translate(0, second());
    noStroke();
    fill(178, 34, 34, 20);
    ellipse(0, 0, 150, 150);
    popMatrix();
  }
  
  //Minutenkreis;
  
  for (int i=0; i<360; i+=100)
  {
    pushMatrix();
    rotate( radians(i) );
    translate(0, minute());
    stroke(200, 200, 200);
    //fill(255, 140, 0, 20);
    noFill();
    ellipse(0, 0, 200, 200);
    popMatrix();
  }
  
    //Stundenkreis
  
  for (int i=0; i<360; i+=23-hour)
  {
    pushMatrix();
    rotate( radians(i) );
    translate(0, hour());
    stroke(50, 50, 50);
    //fill(255, 215, 0, 20);
    noFill();
    ellipse(0, 0, 500, 500);
    popMatrix();
  }
}

