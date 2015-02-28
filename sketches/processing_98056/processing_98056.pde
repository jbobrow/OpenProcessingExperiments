
boolean answered = false;
String[][] questions;
char[] letters; //current letters that the player has
char[] answer; //the answer to the question
int num;
boolean displayQ;
String printAnswer = "";
int[] asked = new int[5];
int qNum = 0; //question number
boolean levelDone = false; //set to true when all five questions are completed
int timeFinished;

boolean[] levelComplete = new boolean[6];

int numQuestions = 5; //number of questions that will be asked

void Level(int levelNum)
{
  playGame();
  String q[] = loadStrings("Level" + levelNum + ".txt");
  questions = new String[q.length][2];

  //gets the questions from text file and stores them
  for (int i = 0; i < q.length; i++)
  {
    String[] sep = split(q[i], '\t');
    if (sep.length == 2)
    {
      questions[i][0] = sep[0];
      questions[i][1] = sep[1];
    }
    else
    {
      println("Line " + i + " has " + sep.length + " String(s) isntead of 2!");
    }
  }

  //randomly generates a question
  if ((answered || displayQ) && (qNum < numQuestions))
  {
    num = (int)random(questions.length);
    for (int i = 0; i < numQuestions; i++)
    {
      while (num == asked[i])
      {
        num = (int)random(questions.length);
      }
    }
    asked[qNum] = num;
    answer = new char[questions[num][1].length()];
    letters = new char[questions[num][1].length()];
    qNum++;

    //assembles the answer and prepares underscores for player's answers
    printAnswer = "";
    for (int r = 0; r < questions[num][1].length(); r++)
    {
      answer[r] = questions[num][1].charAt(r);
      println(answer[r]);
      printAnswer += "_";
    }
    displayQ = false;
    answered = false;
  }
  
  //display the question and player's answer so far
  textFont(font);
  textSize(50);
  fill(0, 102, 153);
  textAlign(CENTER);
  text(printAnswer, (int)(width/2 - scrollAmount), height - 110);
  textSize(22);
  textAlign(LEFT);
  text(questions[num][0], (int)(50 - scrollAmount), height-100, width - 100, 700);

  if (complete(letters))
  {
    answered = true;
    player.lives++;
  }
  //marks that the player has won this level
  if (answered && qNum == numQuestions)
  {
    levelDone = true;
    levelComplete[levelNum] = true;
    timeFinished = millis();
    showCongrats = true;
    playerAlive = false;
    //manageHighScores();
    qNum = 0;
  }
  
  //draws the score, number of lives remaining, and questions remaining in upper left hand corner
  fill(0, 102, 153);
  textSize(40);
  text(score, (int)(-scrollAmount + 5), 40);
  textSize(22);
  text(player.lives, (int)(-scrollAmount + 5), 70);
  image(smallEnter, (int)(-scrollAmount + 25), 50);
  text((numQuestions - qNum), (int)(-scrollAmount + 5), 100);
  image(question, (int)(-scrollAmount + 28), 80);
}

//checks to see if the array of characters is completely filled or not
boolean complete(char[] cr)
{
  for (int a = 0; a < cr.length; a++)
  {
    if (cr[a] == '\0')
    {
      return false;
    }
  }
  return true;
}


