
//Board Game Randomizer
String[] arrayString;
int[] minimum = new int[100];
int[] maximum = new int[100];
int numberPlayers = 0;
int[] choices = {9000};
String winner= " ";
String[] combineStart = new String[2]; 
String combine;

void setup()
{
  size(600, 200);
  smooth();
  arrayString = loadStrings("boardgames.txt");
  for (int i = 0; i < arrayString.length; i = i + 1)
  {
    String[] info = split(arrayString[i], '_');
    arrayString[i] = info[0];
    minimum[i] = int(info[1]);
    maximum[i] = int(info[2]);
  }
}

void draw()
{
  background(255);
  textSize(50);
  fill(50);
  textAlign(CENTER);
  if (winner != " ")
  {
    text(winner, 30, 30, 540, 140);
  }
  else
  {
    combineStart[0] = "Number of Players:";
    combineStart[1] = str(numberPlayers);
    combine = join(combineStart, " "); 
    text(combine, 30, 30, 540, 140);
  }
}

void keyTyped() 
{
  if (int(key) - 48 >= 0 && int(key) - 48 <= 9)
  {
    if (numberPlayers == 0)
    {
      winner= " ";
      numberPlayers = int(key) - 48;
    } 
    else 
    {
      numberPlayers = numberPlayers*10 + int(key) - 48;
    }
  }
  else if (key == ' ' && numberPlayers != 0)
  {
    for (int i = 0; i < arrayString.length; i = i + 1)
    {
      if(minimum[i] <= numberPlayers && maximum[i] >= numberPlayers)
      {
        if (choices[0] == 9000)
        {
          choices[0] = i;
        }
        else
        {
        choices = append(choices, i); 
        }
      }
    }
    if (choices[0] == 9000)
    {
      winner = "Split into groups, way to many people...";
    }
    else
    {
      int index = int(random(choices.length));
      winner = arrayString[choices[index]];
    }
    println(winner);
    numberPlayers = 0;
    int z = choices.length;
    for (int i = 1; i < z; i = i + 1)
    {
      choices = shorten(choices);
    }
    choices[0] = 9000;
  }
}


