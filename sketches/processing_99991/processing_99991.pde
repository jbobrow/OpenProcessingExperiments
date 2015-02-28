
import ddf.minim.*;

AudioPlayer player;
Minim minim;
Arrow[] show = new Arrow[5];
String[] Direction = { "UP", "DOWN", "LEFT", "RIGHT"};
String[] stored = new String[5];
int rounds, score, press, startTime;
int limitedTime = 6;
boolean change = true;
boolean roundEnd = true; 
boolean start = false;  
boolean over = false;
PImage background1, background2, up, down, left, right;


void setup() {
  size(1004, 684);
  background1 = loadImage("back1.jpg");
  background2 = loadImage("back2.jpg");
  up = loadImage("up1.png");
  down = loadImage("down1.png");
  left = loadImage("left1.png");
  right = loadImage("right1.png"); 
  minim = new Minim(this);
  player = minim.loadFile("Board Game Island.mp3");
}

void draw() {
  
  //game over
  if(rounds > 10) {
    start = false;
    over = true;
    minim.stop();
    gameover();
  }
  
  //game starts
  else if(rounds == 0 && start == false && roundEnd == true) {
    player.play();
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
    
    if(rounds == 3) {
      limitedTime = 5;
    }
    else if(rounds == 5) {
      limitedTime = 4;
    }
    else if(rounds == 7) {
      limitedTime = 3;
    }
    else if(rounds == 9) {
      limitedTime = 2;
    }
    
    fill(255,249,234);
    rect((int)width/1.7, (int)height/1.21, 250, 60);
    textSize(50);
    fill(85,52,52);
    text("time ", (int)width/1.58, (int)height/1.12);
    text(limitedTime - (second() - startTime), (int)width/1.3, (int)height/1.12);
    
    if(press == 5) {
       roundEnd = true;
    }    
    
    if(second() - startTime >= limitedTime) { 
      roundEnd = true;
    }
  }
 
 
  else if(start == true && rounds <= 10 && roundEnd == true) {
    if(rounds == 10) {
      rounds++;
    } else {
      nextRound();
    }
  }
}



void mousePressed() {
  //click to go to next round
  if(start == true && rounds > 0 && rounds < 11 && roundEnd == true) {
    if(mouseX > (int)width/3 && mouseX < (int)width/3 + 400 && mouseY > (int)height/3.6 && mouseY < (int)height/3.6 + 150) {
      roundEnd = false;
      change = true;
      rounds++;
    }
  } 
  //click to start the game
  else if(rounds == 0 && start == false && roundEnd == true) {
    rounds++;
    start = true;
    roundEnd = false;
  } 
}


void keyPressed() {
  
  if(press < 5 && roundEnd == false && start == true) {
    if (keyCode == UP) {
      stored[press] = "UP";
      cover();
      if(show[press].getChoice() == stored[press]) {
             score = score + 10;
      }
      press++;
    } else if (keyCode == DOWN) {
      stored[press] = "DOWN";
      cover();
      if(show[press].getChoice() == stored[press]) {
             score = score + 10;
      }
      press++;
    } else if(keyCode == LEFT) {
      stored[press] = "LEFT";
      cover();
      if(show[press].getChoice() == stored[press]) {
             score = score + 10;
      }
      press++;
    }else if(keyCode == RIGHT) {
      stored[press] = "RIGHT";
      cover();
      if(show[press].getChoice() == stored[press]) {
             score = score + 10;
      }
      press++;
    }    
  }  
}

//create Arrow objects and display it  
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
  
void cover(){
  if(press == 0) {
    if (show[0].getChoice() != stored[0]) {
      fill(255,0,0);
      rect((int)width * 0.3, (int)height * 0.44, 72, 72, 7, 2);
    } else {
      fill(4,203,15);
      rect((int)width * 0.3, (int)height * 0.44, 72, 72, 7, 2);
    }
  } else if(press == 1) {
    if (show[1].getChoice() != stored[1]) {
      fill(255,0,0);
      rect((int)width * 0.4, (int)height * 0.44, 72, 72, 7, 2);
    } else {
      fill(4,203,15);
      rect((int)width * 0.4, (int)height * 0.44, 72, 72, 7, 2);
    }
  }else if(press == 2) {
    if (show[2].getChoice() != stored[2]) {
      fill(255,0,0);
      rect((int)width * 0.5, (int)height * 0.44, 72, 72, 7, 2);
    } else {
      fill(4,203,15);
      rect((int)width * 0.5, (int)height * 0.44, 72, 72, 7, 2);
    }
  } else if(press == 3) {
    if (show[3].getChoice() != stored[3]) {
      fill(255,0,0);
      rect((int)width * 0.6, (int)height * 0.44, 72, 72, 7, 2);
    } else {
      fill(4,203,15);
      rect((int)width * 0.6, (int)height * 0.44, 72, 72, 7, 2);
    }
  }else if(press == 4) {
    if (show[4].getChoice() != stored[4]) {
      fill(255,0,0);
      rect((int)width * 0.7, (int)height * 0.44, 72, 72, 7, 2);
    } else {
      fill(4,203,15);
      rect((int)width * 0.7, (int)height * 0.44, 72, 72, 7, 2);
    }
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
  press = 0;
  background(0);
  
  fill(100);
  rect((int)width/3, (int)height/3.6, 400, 150);
  fill(250);
  rect((int)width/2.8, (int)height/3.3, 350, 115);
  
  textSize(38);
  fill(0);
  text("Click here to enter ", width/2.78, height/2.55);
  text("Next Round", width/2.38, height/2.20);
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
    

