
void setup()
{
  size(500, 500);
  background(0);
  smooth();
  noStroke();
}

void draw()
{
  background(0);

  translate(width/2, height/2);


  fill(150, 150, 150);
  ellipse(0, 0, 375, 375);
  fill(255, 255, 255);
  ellipse(0, 0, 355, 355);

  rotate(radians(15));

  for (int i=0; i<360; i+=30)
  {


    pushMatrix();

    rotate(radians(i) );
    translate(115, 115);
    fill(100, 150, 255);
    ellipse(0, 0, 15, 15);

    popMatrix();


    pushMatrix();

    rotate(radians(i) );
    translate(25, sin(millis()/3000.0)*25);
    //ellipse(0, 0, 10, 10);
    fill(100, 150, 255);
    arc(0, 0, 25, 25, 0, PI+QUARTER_PI, PI);

    popMatrix();

    pushMatrix();

    rotate(radians(i) );
    translate(200, sin(millis()/3000.0)*200);
    fill(100, 150, 255);
    ellipse(0, 0, 10, 10);

    popMatrix();
  }
  
    pushMatrix();
    
    float sec= map(second(), 0, 60, 0, 360);
    rotate(radians(180+sec));
    fill(0, 0, 75);
    triangle(0, 0, 0, 50, 40, 160);

    popMatrix();
    
    pushMatrix();
    
    float min= map(minute(), 0, 60, 0, 360);
    rotate(radians(180+min));
     fill(100, 100, 200);
    triangle(0, 0, 0, 40, 40, 125);
    
    popMatrix();
    
    pushMatrix();
    
    float h= map(hour(), 0, 12, 0, 360);
    rotate(radians(180+h));
     fill(0, 0, 45);
    triangle(0, 0, 0, 30, 30, 100);
    
    popMatrix();
 
}

