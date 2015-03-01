
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

  //Kerze1
  pushMatrix();
  translate(width/2, height/2);
  rotate(-PI/2);
  fill(255, 0, 0);
  textSize(100);
  text("KERZE", -260, -105);
  popMatrix();

  //Docht1
  pushMatrix();
  translate(width/2, height/2);
  rotate(-PI/2);
  fill(255, 255, 153);
  textSize(15);
  text("Docht", 28, -137);
  popMatrix();

  //FlammeKerze1
  pushMatrix();
  translate(width/2-140, 190);
  for (int i=0; i<360; i+=5)
  {
    fill(204, 153, 0);
    rotate(radians(i));
    float verschieden=sin(millis()/70.0+i)*2;
    textSize( i/30.0+verschieden);
    text("Flamme", 10, 7);
  }
  popMatrix();


  //Kerze2
  pushMatrix();
  translate(width/2+100, height/2);
  rotate(-PI/2);
  fill(255, 0, 0);
  textSize(100);
  text("KERZE", -260, 38);
  popMatrix();

  //Docht2
  pushMatrix();
  translate(width/2+100, 280);
  rotate(-PI/2);
  fill(255, 255, 153);
  textSize(15);
  text("Docht", 58, 5);
  popMatrix();




  //Streichholz
  pushMatrix();
  translate(mouseX-253, mouseY-230);
  pushMatrix();
  fill(204, 153, 102);
  noStroke();
  translate(width/2, 280);



  rotate(-PI/2);

  textSize(10);
  text("StreichholzStreichholz", 10, 10);
  popMatrix();
  popMatrix();

  //Anzünden wenn über Docht
  { 
    if (mouseX>87 && mouseX<117 && mouseY>270 && mouseY<290)
    {
      f = true;

      pushMatrix();
      translate(mouseX, mouseY-80);
      for (int i=0; i<360; i+=5)
      {
        fill(204, 153, 0);
        rotate(radians(i));
        float verschieden=sin(millis()/70.0+i)*2;
        textSize( i/30.0+verschieden);
        text("Flamme", 2, 2);
      }
      popMatrix();
    } else if (f == true) {
      pushMatrix();
      translate(mouseX+3, mouseY-82);
      for (int i=0; i<360; i+=5)
      {
        fill(204, 153, 0);
        rotate(radians(i));
        float verschieden=sin(millis()/70.0+i)*2;
        textSize( i/40.0+verschieden);
        text("Flamme", 2, 2);
      }
      popMatrix();
    } else
    { 
      fill(160, 0, 0);     
      pushMatrix();
      translate(mouseX-1, mouseY-60);
      pushMatrix();
      translate(0, 0);
      rotate(-PI/2);
      textSize(15);
      text("Kopf", 10, 10);
      popMatrix();
      popMatrix();
    }
    //FlammeKerze2
    {
      //über Docht2
      if (mouseX>337 && mouseX<367 && mouseY>270 && mouseY<290 && f1==false && f==true)
      {
        f1 = true;
        pushMatrix();
        translate(width/2+100, 190);
        for (int i=0; i<360; i+=5)
        {
          fill(204, 153, 0);
          rotate(radians(i));
          float verschieden=sin(millis()/70.0+i)*2;
          textSize( i/30.0+verschieden);
          text("Flamme", 2, 2);
        }
        popMatrix();
      } else if (f1==true)
      {
        pushMatrix();
        translate(width/2+100, 190);
        for (int i=0; i<360; i+=5)
        {
          fill(204, 153, 0);
          rotate(radians(i));
          float verschieden=sin(millis()/70.0+i)*2;
          textSize( i/30.0+verschieden);
          text("Flamme", 7, 7);
        }
        popMatrix();
      }
    }
  }
  println(mouseX, mouseY);
}//drawEnde

