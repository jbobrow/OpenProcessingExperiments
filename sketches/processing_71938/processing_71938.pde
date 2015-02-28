
float mX, mY;
float d, dE;
float wd = 0;
float ht = 0;
int timedown, timeup;
boolean m;

void setup()
{
  size ( 400, 400);
  background (255);
  smooth();
}

void draw()
{

  initiateBackground();
  crazy(mouseX, mouseY, 100);
  ellipses();
  drawFace(mouseX, mouseY, 100);
}

void initiateBackground()
{
  background(255);
}


void ellipses()
{
  stroke(random(255));
  fill(random(255), random(255), random(255), random(50, 100));
  ellipse(mouseX, mouseY, wd, ht);
  if (m)
  {
    wd = (timeup - timedown)/10;
    ht = (timeup - timedown)/10;
    m = false;
  }
}



void keyPressed()
{
  timedown = millis();
}

void keyReleased()
{
  timeup = millis();
  m = true;
}





void crazy(float tX, float tY, float dH)
{
  //    if (key == 'c')
  if (mouseX < (2*width/3) && mouseX > (width/3))
    if (mouseY < (2*height/3) && (mouseY > (height/3)))
    {
      stroke(255, 0, 0);
      fill( random(0, 255), random(0, 255), random(0, 255));
      triangle (tX, tY, 0, (height/2), 0, 0);
      fill( random(0, 255), random(0, 255), random(0, 255));
      triangle (tX, tY, 0, 0, (width/2), 0);
      fill( random(0, 255), random(0, 255), random(0, 255));
      triangle (tX, tY, (width/2), 0, width, 0);
      fill( random(0, 255), random(0, 255), random(0, 255));
      triangle (tX, tY, width, 0, width, (height/2));
      fill( random(0, 255), random(0, 255), random(0, 255));
      triangle (tX, tY, width, (height/2), width, height);
      fill( random(0, 255), random(0, 255), random(0, 255));
      triangle (tX, tY, width, height, (width/2), height);
      fill( random(0, 255), random(0, 255), random(0, 255));
      triangle (tX, tY, (width/2), height, 0, height);
      fill( random(0, 255), random(0, 255), random(0, 255));
      triangle (tX, tY, 0, height, 0, (height/2));

      noFill();
      ellipse (tX, tY, dH*1.5, dH*1.5);
      ellipse (tX, tY, dH*2, dH*2);
      ellipse (tX, tY, dH*2.5, dH*2.5);
      ellipse (tX, tY, dH*3, dH*3);
      ellipse (tX, tY, dH*3.5, dH*3.5);
      ellipse (tX, tY, dH*4, dH*4);
      ellipse (tX, tY, dH*4.5, dH*4.5);
      ellipse (tX, tY, dH*5, dH*5);
      ellipse (tX, tY, dH*5.5, dH*5.5);
      ellipse (tX, tY, dH*6, dH*6);
    }
}


void drawFace(float mX, float mY, float dH)
{
  stroke(0);
  rectMode(CENTER); 
  dE = .3 * dH;
  noFill();
  //head
  ellipse ( mX, mY, dH, dH);
  //eye1
  ellipse ( mX - (dH/5), mY - (dH/5), dE, dE);
  //eye2
  ellipse ( mX + (dH/5), mY - (dH/5), dE, dE);

  //pupil positions

  fill(0);

  //top left
  if (mouseX < (width/3) && mouseY < (height/3))
  {
    ellipse ( mX - ((dH/5) - 5), mY - ((dH/5) - 5), dE/4, dE/4);
    ellipse ( mX + ((dH/5) + 5), mY - ((dH/5) - 5), dE/4, dE/4);
  }

  //top middle
  if (mouseX < (2*width/3) && mouseX > (width/3))
    if (mouseY < (2*height/3) && mouseY < (height/3))
    {
      ellipse ( mX - ((dH/5)), mY - ((dH/5) - 5), dE/4, dE/4);
      ellipse ( mX + ((dH/5)), mY - ((dH/5) - 5), dE/4, dE/4);
    }

  //top right
  if (mouseX < (3*width/3) && mouseX > (2*width/3))
    if (mouseY < (height/3))
    {
      ellipse ( mX - ((dH/5) + 5), mY - ((dH/5) - 5), dE/4, dE/4);
      ellipse ( mX + ((dH/5) - 5), mY - ((dH/5) - 5), dE/4, dE/4);
    }

  //middle left
  if (mouseX < (width/3))
    if (mouseY < (2*height/3) && (mouseY > (height/3)))
    {
      ellipse ( mX - ((dH/5) - 5), mY - ((dH/5)), dE/4, dE/4);
      ellipse ( mX + ((dH/5) + 5), mY - ((dH/5)), dE/4, dE/4);
    }

  //center
  if (mouseX < (2*width/3) && mouseX > (width/3))
    if (mouseY < (2*height/3) && (mouseY > (height/3)))
    {
      ellipse ( mX - ((dH/5)), mY - ((dH/5)), dE/2, dE/2);
      ellipse ( mX + ((dH/5)), mY - ((dH/5)), dE/2, dE/2);
    }


  //middle right
  if (mouseX < (3*width/3) && mouseX > (2*width/3))
    if (mouseY < (2*height/3) && (mouseY > (height/3)))
    {
      ellipse ( mX - ((dH/5) + 5), mY - ((dH/5)), dE/4, dE/4);
      ellipse ( mX + ((dH/5) - 5), mY - ((dH/5)), dE/4, dE/4);
    }

  //bottom left
  if (mouseX < (width/3))
    if (mouseY < (3*height/3) && (mouseY > (2*height/3)))
    {
      ellipse ( mX - ((dH/5) - 5), mY - ((dH/5) + 5), dE/4, dE/4);
      ellipse ( mX + ((dH/5) + 5), mY - ((dH/5) + 5), dE/4, dE/4);
    }  

  //bottom middle
  if (mouseX < (2*width/3) && (mouseX > (width/3)))
    if (mouseY < (3*height/3) && (mouseY > (2*height/3)))
    {
      ellipse ( mX - ((dH/5)), mY - ((dH/5) + 5), dE/4, dE/4);
      ellipse ( mX + ((dH/5)), mY - ((dH/5) + 5), dE/4, dE/4);
    } 

  //bottom right
  if (mouseX < (3*width/3) && (mouseX > (2*width/3)))
    if (mouseY < (3*height/3) && (mouseY > (2*height/3)))
    {
      ellipse ( mX - ((dH/5) + 5), mY - ((dH/5) + 5), dE/4, dE/4);
      ellipse ( mX + ((dH/5) - 5), mY - ((dH/5) + 5), dE/4, dE/4);
    }
}


