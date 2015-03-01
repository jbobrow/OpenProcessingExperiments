

PImage ferrari_photo;

int gameState = 0;
int currentQuestion = 0;

int START_SCREEN = 0;
int GAME_QUESTION = 1;
int CORRECT_ANSWER = 2;
int WRONG_ANSWER = 3;
int WIN_SCREEN = 4;

Question[] questions = new Question[4];

void setup(){
  
  size(800,600);
  
  ferrari_photo = loadImage("ferrari_250-gt.jpg");
  
String[] answers0 =
{"A. Chevy Camaro", "B. AMC Javelin", "C. Ford Mustang", "D. Dodge Challenger"};
questions[0] = new Question("What was the original pony car?",'C',answers0);

String[] answers1 = {"A. Impala", "B. Bel-Air", "C. Nomad", "D. Silverado"};
questions[1] = new Question("What car is described by the nickname, a '57 Chevy",'B',answers1);

String[] answers2 = {"A. MGb", "B. Austin Healey 3000", "C. Alfa Romeo Giulietta Spider", "D. AC Ace"};
questions[2] = new Question("What European roadster did Carrol Shelby modify to create the first Shelby Cobra?",'D',answers2);

String[] answers3 = {"A. Mercedes Gullwing", "B. Lamborghini Miura", "C. Ferrari California", "D. Porsche 911"};
  questions[3] = new Question("The first supercar of all time is generally considered to be...",'A',answers3);
}

void draw(){
  background(0);
  if(gameState == START_SCREEN){
    drawSplashScreen();
  }
    else if(gameState == GAME_QUESTION){
      questions [currentQuestion].display();
    }
      else if (gameState == CORRECT_ANSWER){
        drawCorrectScreen();
      }
      else if(gameState == WRONG_ANSWER){
        drawWrongAnswerScreen();
      }
      else if (gameState == WIN_SCREEN){
        drawWinScreen();
      }
    }
    
    
  void keyPressed(){
    if(gameState == START_SCREEN){
     gameState = 1;
    }
    else if(gameState == GAME_QUESTION){
      if (questions[currentQuestion].isCorrectAnswer(key)){
        currentQuestion++;
        if(currentQuestion > questions.length-1){
          gameState = WIN_SCREEN;
        } else {
          gameState = CORRECT_ANSWER;
        }
      } else {
        gameState = WRONG_ANSWER;
      }
    }
    else if(gameState == CORRECT_ANSWER){
      gameState = GAME_QUESTION;
    }
    else if(gameState == WRONG_ANSWER || gameState == WIN_SCREEN){
      currentQuestion = 0;
      gameState = START_SCREEN;
    }
  }
  
void drawSplashScreen(){
  ferrari_photo.resize(800,600);
  image(ferrari_photo,0,0);
  textAlign(CENTER);
  textSize(40);
  fill(255);
  text("WHO WANTS TO BE A MILLIONAIRE!!!", width/2,100);
}

void drawCorrectScreen(){
  textAlign(CENTER);
  fill(50);
  ellipse(width/2,height/2-10,400,150);
  fill(255,255,0);
  text("CORRECT",width/2,height/2);
}

void drawWrongAnswerScreen(){
  textAlign(CENTER);
  fill(50);
  ellipse(width/2,height/2-10,400,150);
  fill(255,255,0);
  text("WRONG \n press space to try again",width/2,height/2);
}

void drawWinScreen(){
  textAlign(CENTER);
  fill(50);
  ellipse(width/2,height/2-10,400,150);
  fill(255,255,0);
  text("YOU WIN \n press space to try again",width/2,height/2);
}


class Question{

String question;
char correctAnswer;
String[] answers;

Question(String nquestion, char ncorrectAnswer, String[] nanswers){
  question = nquestion;
  correctAnswer = ncorrectAnswer;
  answers = nanswers;
}

void display(){
  rectMode(CENTER);
  textAlign(CENTER);
  stroke(255);
  textSize(15);
  noFill();
  //Question
  rect(400,100,600,80);
  text(question,400,100);
  //answer 0
  rect(200,300,250,80);
  text(answers[0],600,300);
  //answer 1
  rect(600,300,250,80);
  text(answers[1],200,300);
  //answer 2
  rect(200,450,250,80);
  text(answers[2],200,450);
  //answer 3
  rect(600,450,250,80);
  text(answers[3],600,450);
}

boolean isCorrectAnswer (char answer){
  if(answer == correctAnswer) return true;
  else return false;
}
}


