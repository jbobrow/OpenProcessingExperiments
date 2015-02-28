
//-----------------------------------var dump---------------------------------VVVVVVVVVVVVV
//-----------------------------------var dump---------------------------------VVVVVVVVVVVVV
//-----------------------------------var dump---------------------------------VVVVVVVVVVVVV
String[] names = { 
  " Will", "Brenner", "Waylon", "Isabella", "Tasha", "Gage", 
  "Forsythe", "Lin", "Greyfield", "Penny", "Tabitha", "Caulder", "Neomy"
};
String[] goString = new String[names.length]; //assist go button with picking random names from buttons.

int size = 50; //button size
Button[] button = new Button[names.length];

GoButton go = new GoButton();

//-----------------------------------void Set up---------------------------------SSSSSSSSS
//-----------------------------------void Set up---------------------------------SSSSSSSSS
//-----------------------------------void Set up---------------------------------SSSSSSSSS
void setup()
{ 
  size(500, 500);
  frameRate(30);

  background(255); //white

  rectMode(CENTER);
  noStroke();

  for (int i = 0; i < button.length; i++) //assigning button values
  {
    button[i] = new Button(names[i], (size/2 + 250/10) + (250/5 + size)*i, 80);
    if (i > 4)
    {
      button[i] = new Button(names[i], (size/2 + 250/10) - (250/5 + size)*5 + (250/5 + size)*i, 180);
    }
    if (i > 9)
    {
      button[i] = new Button(names[i], (size/2 + 350/4) - (350/4 + size)*10 + (350/4 + size)*i, 280);
    }
  }
}

//-----------------------------------void draw---------------------------------DDDDDDDDDDD
//-----------------------------------void draw---------------------------------DDDDDDDDDDD
//-----------------------------------void draw---------------------------------DDDDDDDDDDD

void draw()
{
  background(255); //white

  for (int i = 0; i < button.length; i++) //drawing buttons
  {
    button[i].display();
    button[i].mousePressed();
  }

  go.display(); //drawing go button
}

class Button //circle buttons
{
  float xpos, ypos; //circle position
  boolean selected = true; //circle selected by default (turned ON)

  String name; //CO name
  float dist; //used to click button

  int clickTimer; //keeps button from x2 clicking
  int clickTimerAssist; //^

  color green = color(0, 255, 0);
  color red = color(255, 0, 0);

  Button(String tempString, float xposTemp, float yposTemp)
  {
    name = tempString;
    xpos = xposTemp;
    ypos = yposTemp;
  }

  void display()
  {
    if (selected == true) //on color
    {
      fill(green);
    } 
    else if (selected == false) //off color
    {
      fill(red);
    }

    ellipse(xpos, ypos, size, size); //actual button

    textAlign(CENTER); //displaying names
    textSize(24);
    text(name, xpos, ypos - size/1.5);
  }

  void mousePressed() 
  {
    dist = dist(xpos, ypos, mouseX, mouseY); //distance calculation for button click

    if (dist < size/2 && mousePressed && clickTimer < 1)
    {
      selected = !selected;
      clickTimer++;
    }
    else if (clickTimer > 0) //delaying button press
    {
      clickTimerAssist++;
    }
    if (clickTimerAssist > 2 && clickTimer != 0) //delaying button press
    {
      clickTimer = 0;
      clickTimerAssist = 0;
    }
  }
}

class GoButton
{
  int rectPosX = 250;
  int rectPosY = 400;
  int rectHori = 110;
  int rectVert = 60;

  color goColor = color(206, 81, 81);

  void display()
  {
    fill(goColor);
    rect(rectPosX, rectPosY, rectHori, rectVert, 20, 20, 20, 20);

    fill(0);
    textSize(30);
    text("GO!", rectPosX, rectPosY + 10);

    if (key == 'g' || ( mouseX > rectPosX - rectHori/2 && mouseX < rectPosX + rectHori/2
      && mouseY > rectPosY - rectVert/2 && mouseY < rectPosY + rectVert/2 && mousePressed) )
    {
      for (int i = 0; i < button.length; i++)
      {
        if (button[i].selected == true)
        {
          goString[i] = button[i].name;
          println(goString[(int)random(goString.length)]);
        }
      }
    }
  }
}


