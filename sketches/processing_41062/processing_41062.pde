
PImage profile;
//first number is the application used, second is the day it was used on mon-sun
int [][] logList = new int [8][7];
int [][] loc = new int [9][12];
PImage bin;
PFont helvet;






void setup()
{
  size(360, 520);
  profile = loadImage("profile.jpg");
  bin = loadImage("binaryCode.jpg");
  helvet = createFont("Helvet", 12);
  String getLines[] = loadStrings ("logs.txt");
  

  int appCounter = -1;

  //organize the logList array with the data from the text file
  for (int i=0; i<getLines.length; i++)
  {

    String []wordSplit = split(getLines [i], ' ');
    String [] excl = match(wordSplit[0], "!");
    if (excl != null)
    {
      appCounter++;
      //println("Application " + appCounter);
    }

    else
    {
      println("Word Split " + wordSplit.length);
      for (int j =0; j<wordSplit.length; j++)
      {

        logList[appCounter][j] = int(wordSplit[j]);
        //println(logList[appCounter][j]);
      }
    }
  }

  for (int i=0; i<9; i++)
  {
    for (int j=0; j<12; j++)
    {
      loc[i][j]= -1;
    }
  }

  //stores the data for the binary square locations;
  for (int i=0; i<8; i++)
  {
    for (int j=0; j<7; j++)
    {

      for (int k=0; k<logList[i][j]; k++)
      {
        int x = round(random(0, 8));
        int y = round(random(0, 11));
        println("app " + i);
        println("day " + j);
        println("number " + k);
        if (loc[x][y] == -1) {
          println("unique");
          loc[x][y] = i;
        }

        else {
          println("dead");
          k--;
        }
      }
    }
  }
}

void draw()
{
  background(0);
  int counter = 0;
  image(profile, 0, 0);
  for (int i = 0; i<9; i++)
  {
    for (int j=0; j<12; j++) 
    {
      if (loc[i][j] != -1) 
      {
        image(bin, i*40, j*40);
      }
    }
  }
  for (int i = 0; i<9; i++) 
  {
    for (int j = 0;j<12; j++) 
    {
      if (loc[i][j] != -1)
      {
        if (mouseX >= i*40 && mouseX <=i*40+40) 
        {
          if (mouseY >= j*40 && mouseY <=j*40+40) 
          {
            rect(i*40, j*40, 40, 40);
            println(loc[i][j]);
            
            for(int k = 0; k<9; k++)
            {
              for(int m = 0; m<12; m++){
                if(loc[i][j] == loc[k][m])
                {
                fill(255, 0, 0);
                rect(k*40, m*40, 40, 40);
                counter++;
                }
              }
            }
            
            if(loc[i][j] == 0){
              fill(255);
              textFont(helvet);
              text("Phone Calls for a total of " + counter + " hours", 10, 510);
            }
            
            else if(loc[i][j] == 1){
              fill(255);
              textFont(helvet);
              text("Messaging for a total of " + counter + " hours", 10, 510);
            }
            
            else if(loc[i][j] == 2){
              fill(255);
              textFont(helvet);
              text("Camera Usage for a total of " + counter + " hours", 10, 510);
            }
            
            else if(loc[i][j] == 3){
              fill(255);
              textFont(helvet);
              text("Emailing for a total of " + counter + " hours", 10, 510);
            }
            
            if(loc[i][j] == 4){
              fill(255);
              textFont(helvet);
              text("Using the calendar for a total of " + counter + " hours", 10, 510);
            }
            
            if(loc[i][j] == 5){
              fill(255);
              textFont(helvet);
              text("On facebook for a total of " + counter + " hours", 10, 510);
            }
            
            if(loc[i][j] == 6){
              fill(255);
              textFont(helvet);
              text("On Web browser for a total of " + counter + " hours", 10, 510);
            }
            
            if(loc[i][j] == 7){
              fill(255);
              textFont(helvet);
              text("Using the gps for a total of " + counter + " hours", 10, 510);
            }
            
          }
        }
      }
    }
  }
}


