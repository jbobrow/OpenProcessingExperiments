
//on keyboard press it resests the background as well as shape be displayed and filter
int shapeCounter;
int randomWidth;
int randomHeight;
int bullsEye;



void setup()
{
  size(800, 500);
  noStroke();
  randomWidth = int(random(0, width));
  randomHeight = int(random(0, height));
  bullsEye = 30;
  shapeCounter = int(random(1, 4));
  if (shapeCounter == 3)
  {
    background(0);
  }
  else
  {
    background(random(0, 255), random(0, 255), random(0, 255));
  }

  println("This program will make a paticular shape appear randomly accross the screen.");
  println("It will begin with a random background color and shape. However, you may control which shape appears.");
  println("Pressing B: Will cause the screen to Blur");
  println("Pressing S: Will cause the program to begin adding another shape at random");
  println("Pressing P: Will Posterize(Darken) whatever is currently on the screen");
  println("Pressing G: Will cause a grey filter to be applied to whatever is on the screen");
  println("Pressing 1: Random Round Bullseyes will be added");
  println("Pressing 2: Random squares will be added");
  println("Pressing 3: Will Change the Background to Black and stars will be added");
  println("Pressing 4: Random Tie-dye Squares will be added");
  println("Pressing 5: Random Circles will be added");
  println("Pressing 6: Stops shapes from being added");
}


void draw()
{
  smooth();
  float a = random(1, 100);
  float b = random(1, 500);
  ;

  if (keyPressed ) {

    if (key == ' ')
    {
      background(random(0, 255), random(0, 255), random(0, 255));
    }
    else if ( key == 'b' || key == 'B')
    {
      filter(BLUR, random(0, 10));
    }
    else if ( key == 's' || key == 'S')
    {
      shapeCounter = int(random(1, 5));
    }
    else if (key == 'p' || key == 'P')
    {
      filter(POSTERIZE, 255);
    }
    else if (key == 'g' || key == 'G')
    {
      filter(GRAY);
    }
    else if (key == '1')
    {
      shapeCounter = 2;
    }
    else if (key == '2')
    {
      shapeCounter = 1;
    }
    else if (key == '3')
    {
      shapeCounter = 3;
      background(0);
    }
    else if (key == '4')
    {
      shapeCounter = 4;
    }
    else if (key == '5')
    {
      shapeCounter = 5;
    }
    else if (key == '6')
    {
      shapeCounter = 6;
    }
  }
  else
  {
    if (shapeCounter == 1)
    {
      if (bullsEye == 30)
      {
        randomWidth = int(random(0, width));
        randomHeight = int(random(0, height));
        bullsEye = 0;
      }
      else
      {
        fill(random(0, 255), random(0, 255), random(0, 255));
        ellipse(randomWidth, randomHeight, a, a);
        bullsEye = bullsEye + 1;
      }
    }

    if (shapeCounter == 2)
    {
      fill(random(0, 255), random(0, 255), random(0, 255));
      rect(random(0, width), random(0, height), a, a);
    }

    if (shapeCounter == 3)
    {
      fill(random(200, 255), random(200, 255), 0);
      ellipse(randomWidth, randomHeight, 1, 1);
      quad(randomWidth + 1, randomHeight, randomWidth, randomHeight + 1, randomWidth - 1, randomHeight, randomWidth, randomHeight - 1);    
      randomWidth = int(random(0, width));
      randomHeight = int(random(0, height));
      //triangle(random(0, width), random(0, height), random(0, width), random(0, height), random(0, width), random(0, height));
    }

    if (shapeCounter == 4)
    {
      if (bullsEye == 30)
      {
        randomWidth = int(random(0, width));
        randomHeight = int(random(0, height));
        bullsEye = 0;
      }
      else
      {
        fill(random(0, 255), random(0, 255), random(0, 255));
        rect(randomWidth, randomHeight, a, a);
        bullsEye = bullsEye + 1;
      }
    }
    if (shapeCounter == 5)
    {
      fill(random(0, 255), random(0, 255), random(0, 255));
      ellipse(random(0, width), random(0, height), a, a);
    }
    if (shapeCounter == 6)
    {
      println("Shape Production has stopped!");
    }
  }
}



