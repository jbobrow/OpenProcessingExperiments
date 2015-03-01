
int scale = 40;
int gameState = 0;
String[] answers1 = 
{ 
  "A. Baloney", "B. Bull", "C. Sauce", "D. Farsi"
};
String[] answers2 = 
{ 
  "A. Aligator", "B. Bear", "C. Cow", "D. I'm just gonna sleep in"
};
Questions[] question = new Questions[2];

String[] inputQuestions = { 
  "This is ______ shit", "What type of day is it today?"
};


void setup() {
  size(600, 400);
  question[0] = new Questions(inputQuestions[0], 'b', answers1);
  question[1] = new Questions(inputQuestions[1], 'd', answers2);
}

void draw() {
  if (gameState == 0) splash();
  else if (gameState <= question.length) question[gameState-1].display();
  else endScreen();
}


void splash() {
  background(55);
  textAlign(CENTER);
  fill(0, 255, 255);
  text("PRESS SPACEBAR TO BEGIN!", width/2, height/2);
  if (keyPressed) gameState ++;
}

void endScreen() {
  background(55);
  textAlign(CENTER);
  fill(0, 255, 255);
  text("YOU WIN!!!", width/2, height/2);
}

class Questions {
  String question;
  char correctAns;
  String[] response;
  float[] responseWidth;
  int textHeight = 20;
  float questionWidth;
  int offset = textHeight/2;
  float rectHeight = 3*textHeight/2;
  String screenState = "displayQuestionScreen";
  Questions(String _question, char _correctAns, String[] _response) {
    question = _question;
    correctAns = _correctAns;
    response = _response;
    responseWidth = new float[response.length];
    questionWidth = 2*textWidth(question);
    for (int i=0; i<response.length; i++) {
      responseWidth[i] = 2*textWidth(response[i]);
    }
  }

  void display() {
    background(0);
    textSize(20);
    textAlign(CENTER);
    rectMode(CENTER);
    if (screenState == "displayQuestionScreen") displayQuestionScreen();
    else if (screenState == "displayCorrectScreen") displayCorrectScreen();
    else if (screenState == "displayWrongScreen") displayWrongScreen();
  }

  void displayQuestionScreen() {
    fill(20, 0, 50);
    rect(width/2, height/5 - offset, questionWidth, rectHeight);
    rect(width/4, height/3 - offset, responseWidth[0], rectHeight);
    rect(3*width/4, height/3 - offset, responseWidth[1], rectHeight);
    rect(width/4, 2*height/3 - offset, responseWidth[2], rectHeight);
    rect(3*width/4, 2*height/3 - offset, responseWidth[3], rectHeight );
    fill(255, 0, 0);
    text(question, width/2, height/5); 
    text(response[0], width/4, height/3); 
    text(response[1], 3*width/4, height/3);
    text(response[2], width/4, 2*height/3);
    text(response[3], 3*width/4, 2*height/3);
    if (keyPressed) {
      if (key == correctAns) screenState = "displayCorrectScreen";
      else if (key != ' ') screenState = "displayWrongScreen";
    }
  }

  void displayCorrectScreen() {
    fill(255, 0, 0);
    textAlign(CENTER);
    text("CORRECT!", width/2, height/2);

    if (keyPressed && key == ' ') {
      screenState = "displayQuestionScreen";
      gameState++;
    }
  }

  void displayWrongScreen() {
    fill(255, 0, 0);
    textAlign(CENTER);
    text("WRONG, LOSER!", width/2, height/2);

    if (keyPressed && key == ' ') {
      screenState = "displayQuestionScreen";
      gameState = 0;
    }
  }
}



