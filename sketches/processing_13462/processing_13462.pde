


int z = constrain(0,0,100);


void setup()
{
  size(350,175);
  smooth();
  cursor(HAND);
  //eyeball whites
  ellipse(100,100,100,100);
  ellipse(225,100,100,100);
  //eyeball colors
  fill(255,0,255);
  ellipse(100,100,50,50);
  ellipse(225,100,50,50);
  //eyeball pupils
  fill(0);
  ellipse(100,100,25,25);
  ellipse(225,100,25,25);
}

void draw()
{
  //tired eye sequence

  float sec=millis()/1000.0;
  if (sec>15.0)
  {
    z++;
    //eye lines
    stroke(255,0,0,z);
    draw1();
    draw2();
  }
  else
  {
  }
}
void mousePressed()
{
  if(mouseButton == LEFT)
  {
    fill(0);
    ellipse(100,100,35,35);
    ellipse(225,100,35,35);
  }
  else if (mouseButton == RIGHT)
  {
    //eyeball colors
    fill(255,0,255);
    ellipse(100,100,50,50);
    ellipse(225,100,50,50);
    //eyeball pupils
    fill(0);
    ellipse(100,100,25,25);
    ellipse(225,100,25,25);
  }
  else
  {
  }
}

void keyPressed()
{
  if (key == 'l')
  {
    fill(255,255,0,10);  
    //eyeball whites
    ellipse(100,100,100,100);
    ellipse(225,100,100,100);
    //eyeball colors
    fill(255,0,255);
    ellipse(100,100,50,50);
    ellipse(225,100,50,50);
    //eyeball pupils
    fill(0);
    ellipse(100,100,25,25);
    ellipse(225,100,25,25);
  }
  else if ((key == ENTER) || (key == RETURN))
  {
    fill(255,255,255);  
    //eyeball whites
    ellipse(100,100,100,100);
    ellipse(225,100,100,100);
    //eyeball colors
    fill(255,0,255);
    ellipse(100,100,50,50);
    ellipse(225,100,50,50);
    //eyeball pupils
    fill(0);
    ellipse(100,100,25,25);
    ellipse(225,100,25,25);
  }
  else if (key == 'p')
  {
    fill(255,182,193,10);  
    //eyeball whites
    ellipse(100,100,100,100);
    ellipse(225,100,100,100);
    //eyeball colors
    fill(255,0,255);
    ellipse(100,100,50,50);
    ellipse(225,100,50,50);
    //eyeball pupils
    fill(0);
    ellipse(100,100,25,25);
    ellipse(225,100,25,25);
  }
  else if (key == 'x')
  {
    fill(0);
    beginShape();
    curveVertex(50,100);
    curveVertex(75,30);
    curveVertex(100,50);
    curveVertex(125,80);
    curveVertex(150,100);
    endShape();
  }
}
  //tired eyes right

  void draw2()
  {
    translate(-125,13);
    for(int i=0;i<=15;i++)
    {
      strokeWeight(2);
      noFill();

      rotate(0.4);
      beginShape();
      vertex(50,0);
      vertex(45,10);
      vertex(30,0);
      vertex(20,12);
      endShape();
    }
  }
  //tired eyes right
  void draw1()
  {
    translate(225,100);
    for(int i=0;i<=15;i++)
    {
      strokeWeight(2);
      noFill();

      rotate(0.4);
      beginShape();
      vertex(50,0);
      vertex(45,10);
      vertex(30,0);
      vertex(20,12);
      endShape();
    }
  }


