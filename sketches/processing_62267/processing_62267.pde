
//Sketch by Ellee Banaszak
//A small tribute to the Beatles
// Be sure to press the 6,1,2,3,4,5 keys successivly

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
}



void draw()
{
  if (key=='6')
  {
  background (255,255,255);
  fill(0, 0, 0);
  textSize (30);
  textAlign (CENTER);
  text ("You say Goodbye, \nbut I say...", width/2, height/2);
  }



  if (key=='1')
  {
    background (250, 23, 121);
    fill (25, 224, 46);
    textSize (100);
    text("Hello", width/2, height/2);
    textAlign (CENTER);
  }

  if (key=='2')
  {
    background (7, 234, 206);
    fill (222, 20, 195);
    textSize (100);
    text("Hello", width/2, height/2);
    textAlign (CENTER);
  }

  if (key=='3')
  {
    background (255, 243, 3);
    fill (255, 142, 3);
    textSize (100);
    text("Hello", width/2, height/2);
    textAlign (CENTER);
  }

  if (key=='4')
  {
    background(255, 255, 255);
    text("I don't know why \nyou say Goodbye \nI say", width/2, height/2);
    textAlign (CENTER);
    textSize (30);
  }

  if (key=='5')
  {

    fill (255, 255, 255, 25);
    rect (0, 0, width, height);
    fill (random (255), random (255), random (255), 145);
    textSize (100);
    text("Hello", mouseX, mouseY);
  }
}


