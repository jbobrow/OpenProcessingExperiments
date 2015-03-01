
void setup()
{
  size (500, 500);
}

void draw()
{
  background(161, 234, 230);

  if (mousePressed == true)
  {  
    translate(0, height);

    for (int i=0; i<width; i+=2)
    {
      pushMatrix();
      stroke(42, 216, 42);
      float ver = sin(millis()/5000.0+i)*10;
      line(i, 0, i+ver, -50);
      popMatrix();
    }

    //blume lila
    translate(150, -250);
    rectMode(CENTER);

    for (int i=0; i<360; i+=20)
    {

      pushMatrix();
      rotate(PI/-2);
      textSize(75);
      text("Blume", -250, 25);
      //line(0, 250, 0, 0);
      popMatrix();

      pushMatrix();
      stroke(188, 70, 240);
      fill(188, 70, 240);
      rotate(radians(i));

      float radius = 75+sin(millis()/100.0+i)*10;


      textSize(15); 
      ellipse(radius, 0, 10, 10); 
      text("Blume", -radius, 0);
      //line(0, 0, radius, 0);


      popMatrix();
    }

    //blume pink
    translate(220, -50);
    rectMode(CENTER);

    for (int i=0; i<360; i+=20)
    {

      pushMatrix();

      rotate(PI/-2);
      textSize(90);
      text("Blume", -300, 25);
      // line(0, 300, 0, 0);
      popMatrix();

      pushMatrix();
      stroke(240, 148, 223);
      fill(240, 148, 223);
      rotate(radians(i));

      float radius = 75+sin(millis()/100.0+i)*10;
      ellipse(radius, 0, 10, 10);  

      textSize(15); 
      ellipse(radius, 0, 10, 10); 
      text("Blume", -radius, 0);
      // line(0, 0, radius, 0);


      popMatrix();
    }
  } else
  {
    background(161, 234, 230);
    translate(0, height);

    for (int i=0; i<width; i+=2)
    {

      pushMatrix();
      stroke(42, 216, 42);
      float ver = sin(millis()/5000.0+i)*10;
      line(i, 0, i+ver, -50);
      popMatrix();
    }
  }
}

