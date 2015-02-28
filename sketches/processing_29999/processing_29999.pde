
PFont f;
String number = "";
String c = "Correct! Nice job<3";
String i = "Incorrect! Click R to try again :)";
public void setup()
{
  size(500, 150);
  f = createFont("Times New Roman", 16, true);
  background(255);
  fill(255);
  rect(0, 60, 500, 100);
}

public void draw()
{
  fill(0);
  textFont(f, 20);
  text("Can you remember my number?", 125, 25);
  textFont(f, 16);
  text("Click ENTER to check if you are correct", 125, 50);
  text(number, 210, 90);


  if (key == ENTER && number.length()==7)
  {
    if (number.equals("2905720") )
    {
      textFont(f, 18);
      text(c, 170, 120);
    }
    else
    {
      textFont(f, 18);
      text(i, 135, 120);
    }
  }
}

public void keyTyped()
{
  if ( (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0') && number.length()<=6)
  {
    number+=key;
  }

  if (key == 'r')
  {
    number = "";
    fill(255);
    rect(0, 60, 500, 100);
  }
}

