
void setup()
{
  size (500, 500);
  background (255);
}

void draw()
{
  background(200);
  translate(width/2, height/2);

  int std = hour();
  int min = minute();
  int sec = second();

  for (int i=0; i<360; i+=30);
  {
    //Ziffernblatt (weiß, innen)
    pushMatrix();
    noStroke();
    fill (255, 255, 255);
    ellipse (0, 0, 400, 400);
    popMatrix ();
    
    //Sekundenzeiger
    pushMatrix();
    noStroke();
    fill(0);
    rotate(radians(6*second()-90));
    rect(0, 0, 180, 2, sec);
    popMatrix();

    //Minutenzeiger
    pushMatrix();
    noStroke();
    fill(0);
    rotate(radians(6*minute()-90));
    rect(0, 0, 160, 4, min);
    popMatrix();

    //Stundenzeiger
    pushMatrix();
    noStroke();
    rotate(radians(30*(hour()+minute()/60.0)-90));
    rect(0, 0, 120, 6, std);
    popMatrix();
  }
  
  //Quadrate außen
   for (int i=0; i<360; i+=30)
  {
    pushMatrix();
    rotate(radians(i));
    translate(0, 200);
    noStroke();
    fill(0);
    rect(0, 0, 10, 10);
    popMatrix();
  }
}

