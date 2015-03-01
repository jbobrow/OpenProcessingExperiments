
PFont font = createFont ("Courier", 18);
int fontSize = 18;
String [] str = new String[7];
int activeID  = 0;
int counter = 0;
int zeichnungsCounter = 0;

String comment = " // i ist " + counter + ", Bedingung ist " + (counter < 10 ? true : false);
boolean falseLoop = false;
boolean doLoop = true;

int speed = 20;

void setup ()
{
  size (900, 200);
  smooth();

  frameRate (30);

  textFont (font, fontSize);
  textAlign (LEFT);

  setContentArray();
}

void draw ()
{
  background (#57385c);
  noStroke();
  fill (#A75265);
  rect (0, 0, height, height);

  int maxCount = 0;

  noFill();
  stroke (255);
  int j = 0;
  while (j < 10 && j < zeichnungsCounter)
  {
    float d = 10 + j * 15;
    ellipse(100, height/2, d, d);
    j++;
  }


noStroke();
  for (int i = 0; i < str.length; i++) {

    if (i == activeID) {
      fill (#ffedbc);
      rect (height+15, fontSize*2 +i*fontSize*1.3+5, width, -fontSize-5);
      fill (#A75265);
    } else {
      fill (255);
    }
    text (str[i], height+20, fontSize*2 +i*fontSize*1.3);

    if (i == 1) {
      text (comment, height+20 + textWidth(str[i]), fontSize*2 +i*fontSize*1.3);
    }

    if (i == 4 && activeID >= 4)
    {
      String opertion = " // i = " + (counter-1) + " + 1, i ist jetzt " + (counter); 
      text (opertion, height+20 + textWidth(str[i]), fontSize*2 +i*fontSize*1.3);
    }
  }
  if (doLoop) autoupdate();
}

void autoupdate ()
{

  if ((frameCount % speed) == 0) {
    update ();
  }
}

void update ()
{
  activeID++;
  if (activeID == 4) {
    counter++;
  }
  if (activeID == 3) zeichnungsCounter++;

  if (activeID > 5 && counter < 10) 
  {
    activeID = 1;
    comment = " // i ist " + counter + ", Bedingung ist " + (counter < 10 ? true : false);
  } else if (!falseLoop && activeID > 5 && counter >= 10) {
    activeID = 1;
    comment = " // i ist " + counter + ", Bedingung ist " + (counter < 10 ? true : false);
    falseLoop = true;
  } else if (falseLoop) {
    activeID = str.length-1;
  }
}

void mousePressed ()
{
  activeID = counter = 0;
  comment = " // i ist " + counter + ", Bedingung ist " + (counter < 10 ? true : false);
  falseLoop = false;
  zeichnungsCounter = 0;
  if (!doLoop) redraw();
}


void setContentArray ()
{
  str [0] = "int i = 0;";
  str [1] = "while(i < 10) {";
  str [2] = "  float d = 10 + i * 15;";
  str [3] = "  ellipse(width/2, height/2, d, d);";
  str [4] = "  i = i + 1;";
  str [5] = "}";
  str [6] = "// Mit Schleife fertig, Weiterer Code wird ausgefuehrt";
}

void keyPressed ()
{
  if (key == 'l') 
  {
    doLoop = !doLoop;
    if (doLoop) loop();
    else noLoop();
  }
  if (key == '+' && !doLoop) {
    update();
    redraw();
  }
}

