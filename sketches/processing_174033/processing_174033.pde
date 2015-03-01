
int klickwert = mouseX;
int klickwert2 = mouseY-160;
int klickwert3 = 2;

boolean f = false;
boolean f1 =false;
void setup()
{
  size(500, 500);
  smooth();
  fill(10, 200, 20);
}
void draw()
{
  background(100, 20, 20);
  ellipse(mouseX, mouseY, klickwert, klickwert2);

  //Docht1
  fill(255, 255, 153);
  rect(width/2-150, 280, 5, 40);

  //FlammeKerze1
  pushMatrix();
  translate(width/2-150, 250);
  for (int i=0; i<360; i+=5)
  {
    fill(204, 153, 0);
    ellipseMode(CENTER);
    rotate(radians(i));
    float verschieden=sin(millis()/70.0+i)*5;
    ellipse(5, 5, 10, i/10.0+verschieden);
  }
  popMatrix();

  //Kerze1
  fill(255, 0, 0);
  rect(width/2-150, 400, 60, 240);
  //spiegelung
  fill(204, 204, 204);
  rect(width/2-150-20, 400, 10, 230);


  //Docht2
  fill(255, 255, 153);
  rect(width/2+100, 280, 5, 40);


  //Kerze2
  fill(255, 0, 0);
  rect(width/2+100, 400, 60, 240);
  //spiegelung
  fill(204, 204, 204);
  rect(width/2+100-20, 400, 10, 230);

  //Streichholz
  rectMode(CENTER);
  fill(204, 153, 0);
  noStroke();
  //rotate(0.2*PI);
  fill(204, 153, 102);
  rect(mouseX, mouseY-20, 7, 120);
  fill(153, 0, 0);
  //zuenden wenn über Docht
  { 
    if (mouseX>87 && mouseX<117 && mouseY>315 && mouseY<347)
    {
      f = true;

      pushMatrix();
      translate(mouseX, mouseY-80);
      for (int i=0; i<360; i+=5)
      {
        fill(204, 153, 0);
        ellipseMode(CENTER);
        rotate(radians(i));
        float verschieden=sin(millis()/70.0+i)*5;
        ellipse(5, 5, 10, i/10.0+verschieden);
      }
      popMatrix();
    } else if (f == true) {
      pushMatrix();
      translate(mouseX, mouseY-80);
      for (int i=0; i<360; i+=5)
      {
        fill(204, 153, 0);
        ellipseMode(CENTER);
        rotate(radians(i));
        float verschieden=sin(millis()/70.0+i)*5;
        ellipse(4, 4, 8, i/10.0+verschieden);
      }
      popMatrix();
    } else
    { 
      ellipse(mouseX, mouseY-80, 12, 18);

      println(mouseX, mouseY);
    }
    //FlammeKerze2
    {
      if (mouseX>337 && mouseX<367 && mouseY>315 && mouseY<347 && f1==false && f==true)
      {
        f1 = true;
        pushMatrix();
        translate(width/2+100, 250);
        for (int i=0; i<360; i+=5)
        {
          fill(204, 153, 0);
          ellipseMode(CENTER);
          rotate(radians(i));
          float verschieden=sin(millis()/70.0+i)*5;
          ellipse(5, 5, 10, i/10.0+verschieden);
        }
        popMatrix();
      } else if (f1==true)
      {
        pushMatrix();
        translate(width/2+100, 250);
        for (int i=0; i<360; i+=5)
        {
          fill(random(190, 204), 153, 0);
          ellipseMode(CENTER);
          rotate(radians(i));
          float verschieden=sin(millis()/70.0+i)*5;
          ellipse(5, 5, 10, i/10.0+verschieden);
        }
        popMatrix();
      }
    }
  }
}//drawEnde

