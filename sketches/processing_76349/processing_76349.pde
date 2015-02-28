
PFont font1;
PFont font2;
PFont font3;
PFont font4;

char[] letters = new char[26];
char[] completed = new char[20];

int time;
int goal;
int index;

char tempCheck;
char check;

boolean testCheck;

void setup()
{
  font4 = loadFont("ArialNarrow-75.vlw");
  font3 = loadFont("ArialNarrow-64.vlw");
  font2 = loadFont("ArialNarrow-32.vlw");
  font1 = loadFont("ArialNarrow-16.vlw");

  size(800, 500);
  background(25);


  letters[0] = 'a';
  letters[1] = 'b';
  letters[2] = 'c';
  letters[3] = 'd';
  letters[4] = 'e';
  letters[5] = 'f';
  letters[6] = 'g';
  letters[7] = 'h';
  letters[8] = 'i';
  letters[9] = 'j';
  letters[10] = 'k';
  letters[11] = 'l';
  letters[12] = 'm';
  letters[13] = 'n';
  letters[14] = 'o';
  letters[15] = 'p';
  letters[16] = 'q';
  letters[17] = 'r';
  letters[18] = 's';
  letters[19] = 't';
  letters[20] = 'u';
  letters[21] = 'v';
  letters[22] = 'w';
  letters[23] = 'x';
  letters[24] = 'y';
  letters[25] = 'z';

  for (int i = 0; i < completed.length; i++)
  {
    completed[i] = ' ';
  }

  index = int(random(letters.length));
}

void draw()
{
  background(int(random(255)), int(random(255)), int(random(255)));
  
  fill (255);
  quad(0, 0, 150, 0, 150, 50, 0, 50); 
  quad(650, 0, 800, 0, 800, 50, 650, 50); 
 
  textFont(font1);
  fill(0);
  text ("Time Remaining: " + (10 - time), 10, 40);
  text ("Letters Remaining: " + (20 - goal), 660, 40);

  check = letters[index];

  fill (255);
  quad(250, 125, 550, 125, 550, 275, 250, 275);
  textFont(font3);
  fill(0);
  text (check, 385, 215);

  fill(255);
  for (int i=0; i < 11; i++)
  {
    quad(i*80, 340, (i+1)*80, 340, (i+1)*80, 420, i*80, 420);
  }

  for (int i=0; i < 11; i++)
  {
    quad(i*80, 420, (i+1)*80, 420, (i+1)*80, 500, i*80, 500);
  }

  if (time == 10)
  {
    time = 10;
  }
  else
  {
    time = millis()/1000;
  }


  if (time < 10)
  {

    if (test(check))
    {
      completed[goal] = check;
      goal ++;
      index = int(random(letters.length));
    }

    textFont(font2);
    fill(0);
    for (int i = 0; i < completed.length; i++)
    {
      if (i < 10)
      {  
        text(completed[i], (i*80) + 40, 385);
      }
      else
      {
        text(completed[i], ((i-10)*80 + 40), 465);
      }
    }
  }

  textFont (font4);
  if (completed[19] != ' ' || time == 10 && completed[19] != ' ')
  {
    fill (255);
    quad (100, 100, 700, 100, 700, 400, 100, 400);
    fill (0);
    text(" YOU'RE VICTORIOUS ", 100, 275);
  }
  if (time == 10 && completed[19] == ' ')
  {
    fill(255);
    quad (100, 100, 700, 100, 700, 400, 100, 400);
    fill (0);
    text(" YOU GET NOTHING ", 100, 275);
  }

}

boolean test (char check)
{
  tempCheck = check;
  testCheck = false;
  if (keyPressed)
  {
    if (key == tempCheck)
    {
      testCheck = true;
      return testCheck;
    }
    if (key != tempCheck)
    {
      return testCheck;
    }
  }
  return false;
}


