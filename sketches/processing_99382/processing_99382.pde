
Arrow[] show = new Arrow[5];
String[] Direction = { "UP", "DOWN", "LEFT", "RIGHT"};
String[] stored = new String[5];
int rounds, score, press, startTime;
int limitedTime = 5;
boolean change = true;
boolean roundEnd = true; 
boolean start = false;  
PImage background1, background2, up, down, left, right;


void setup() {
  size(1004, 684);
  background1 = loadImage("back1.jpg");
  background2 = loadImage("back2.jpg");
  up = loadImage("up1.png");
  down = loadImage("down1.png");
  left = loadImage("left1.png");
  right = loadImage("right1.png");
}

void draw() {
  
  //game over
  if(rounds > 10) {
    start = false;
    gameover();
  }
  
  //game starts
  else if(rounds == 0 && start == false && roundEnd == true) {
    background(background1);
    textSize(100);
    fill(250);
    text("LET'S DANCE", width/5, height/4);
    textSize(40);
    fill(0);
    text("Click to START :D", width/3, height/3);
  } 
  
  
  else if(start == true && rounds <= 10 && roundEnd == false) {
    if(change == true) {
      startTime = second();
      background(background2);
      getRound();
      showArrow();
      change = false;
    }
    
    if(second() - startTime < limitedTime) {
      if(press == 5) {
         for(int i = 0; i < stored.length; i++) {
           if(show[i].getChoice() == stored[i]) {
             score = score + 5;
           }
         }
         roundEnd = true;
      }
    } else if(second() - startTime >= limitedTime) { 
      roundEnd = true;
    } 
  }
 
  else if(start == true && rounds <= 10 && roundEnd == true) {
    nextRound();
  }
  
}



void mousePressed() {
  //click to go to next round
  if(start == true && rounds > 0 && rounds < 11 && roundEnd == true) {
    roundEnd = false;
    change = true;
    rounds++;
  } 
  //click to start the game
  else if(rounds == 0 && start == false && roundEnd == true) {
    rounds++;
    start = true;
    roundEnd = false;
  }
}


void keyPressed() {
  
    if(press < 5) {
      if (keyCode == UP) {
        stored[press] = "UP";
        press++;
      } else if (keyCode == DOWN) {
        stored[press] = "UDOWN";
        press++;
      } else if(keyCode == LEFT) {
        stored[press] = "LEFT";
        press++;
      }else if(keyCode == RIGHT) {
        stored[press] = "RIGHT";
        press++;
      }    
    } 
}

//creat Arrow objects and display it  
void showArrow() {
  for(int i = 0; i < show.length; i++) {
    show[i] = new Arrow();
  }
  double x = 0.3;
  for(int i = 0; i < show.length; i++) {
    if(show[i].getChoice() == "UP") {
      image(up, (int)(width * x), (int)(height * 0.44));
    } else if(show[i].getChoice() == "DOWN") {
      image(down, (int)(width * x), (int)(height * 0.44));
    } else if(show[i].getChoice() == "LEFT") {
      image(left, (int)(width * x), (int)(height * 0.44));     
    } else if(show[i].getChoice() == "RIGHT"){
      image(right, (int)(width * x), (int)(height * 0.44));
    }
    x = x + 0.1;
  }
}
  
void getRound() {
  textSize(50);
  fill(0);
  text("Round " + rounds, (int)width/2.5, (int)height/5.6);
}

void getScore() {
  textSize(40);
  fill(250);
  text("Score :  " + score, (int)width/1.5, (int)height/1.3);
}

void nextRound() {
  background(0);
  textSize(40);
  fill(250);
  text("Click to go to next round", width/4, height/3);
  press = 0;
  getScore();
}

void gameover() {
  background(0);
  textSize(120);
  fill(250);
  text("Game Over !", width/6, height/4);
  textSize(90);
  fill(250);
  text("Your score is " + score, width/6, (int)height/1.5);
}
    
    
public class Arrow {
  String choice;
  
  public Arrow() {
    choice = Direction[(int)(Math.random() * 4)];
  }
  
  String getChoice() {
    return choice;
  }
}
    

