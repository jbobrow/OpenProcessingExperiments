


PImage img;

import java.awt.Rectangle;
Peer peer1;
Peer[] friends = new Peer[10];
int BOX_SIZE=10;
int lastSecondRecorded = 0;
int timeoffriendship = 0;
boolean gameState1 = true;
boolean gameState2 = false;
boolean gameState3 = false;
int points = 0;
int newpoints;
int secondReference1 = second()+2;
String gameoverText1 = "That pain insighted, that pain eviscerated.";
String gameoverText4 = "You can't be good enough, not in these past ";
String gameoverText5 = " seconds.";
String gameoverText6 = "Take one Luch to make this pain go away.";
int timeofCollision = 0;
boolean isHappy = false;
int secondReference2 = 0;
int secondReference3 = 0;
int selectedColor;
boolean isSad = false;
String suicideText1 = "You couldn't stop the ghosts from possessing you.";
String suicideText2 = "Those ghosts burned not you, but essentially you.";
String suicideText3 = "They're telling you to click the mouse.";


class Peer {
  int velX = int(random(1,2));
  int velY = int(random(1,2));
  Rectangle box =new Rectangle(int(random(width)),int(random(height)), 15,15);
  boolean player = false;
  int red = 210;
  int green = 210;
  int blue = 210;
  int transparency = 255;
  int playerhealth = 500;
  int yplayer = 130;
  int xplayer = 130;
  int lastClick = -2000;
  int MS_TIME_BETWEEN_CLICKS = 2000;
  int numberOfClicks = 0;
  boolean up, down, left, right;
  int addplayerhealth;
  int timer;

  void update() {
    fill(120,130,0);
         int newX = box.x += velX;
         int newY = box.y += velY;  
         if (newY > height) {
           newY = newY - 5; 
           velY = -velY;
         }
         if (newX > width) {
           newX = newX - 5;
           velX = -velX;
         }
         if (newY < 0) {
           newY = newY + 5;
           velY = -velY;
         }
         if (newX < 0) {
           newX = newX + 5;
           velX = -velX;          
         }
        if (startTime > 3000) {
          friends[0].red = 255;
          friends[0].green = 0;
          friends[0].blue = 0;
          isRed = true;
        }

     if (player) {
         for (int j = 0; j < friends.length; j++) {
        if (friends[j] != this && box.intersects(friends[j].box))  {
           friends[j].red = 0;
           friends[j].green = 0;
           friends[j].blue = 255;
           friends[j].transparency = 255;
           
           friends[0].red = 0;
           friends[0].green = 0;
           friends[0].blue = 255; 
           friends[0].transparency = friends[0].playerhealth + friends[0].addplayerhealth;
           isSad = true;
             
         } else if (k==v && startTime > 6000) {
         friends[0].red = 210;
          friends[0].green = 210;
          friends[0].blue = 210;
         } else {
             //friends[0].blue = selectedColor;
             //friends[0].red = selectedColor;
             //friends[0].green = selectedColor;
             friends[j].blue = selectedColor;
             friends[j].red = selectedColor;
             friends[j].green = selectedColor;
             isSad = false;
           }
      
           }
           if (k==v && startTime > 3000) {
               //isRed = true;
              friends[0].red = 255;
             friends[0].green= 0;
            friends[0].blue = 0; 
             }
           }
           if (key == CODED && keyPressed && friends[0].lastClick + friends[0].MS_TIME_BETWEEN_CLICKS < millis()) {
             friends[0].numberOfClicks++;
             friends[0].lastClick = millis();
           }
           friends[0].addplayerhealth = 10*(friends[0].numberOfClicks);
  }
  void paint() {
    fill(red,green,blue,transparency);
    rect((box.x),(box.y), box.width, box.height);
  }
}
int x = 3;
int y = 6;

void setup() {
  size(500,400);
  lastSecondRecorded = second();
  secondReference3 = second();
  secondReference2 = second() - 2;
  
  for (int i = 0; i < friends.length; i++) {
    friends[i] = new Peer(); 
  }
  friends[0].player = true;
  noStroke();
}
int startTime;
boolean isRed = false;
int i = 0;
int k; 
int v; 

void draw() {
  
  background(255);
  k = int(random(51));
  v = int(random(50));
  startTime = millis();
  

  if (isSad == true && friends[0].red == 255) {
    gameState3 = true;
  }
  
  if (millis() - friends[0].timer > 2000) {
        selectedColor=210;
        friends[0].timer = millis();
      }
      if (millis() - friends[1].timer > 2000) {
        selectedColor=210;
        friends[1].timer = millis();
      }
      if (millis() - friends[2].timer > 2000) {
        selectedColor=210;
        friends[2].timer = millis();
      }
      if (millis() - friends[3].timer > 2000) {
        selectedColor=210;
        friends[3].timer = millis();
      }
      if (millis() - friends[4].timer > 2000) {
        selectedColor=210;
        friends[4].timer = millis();
      }

  if (friends[0].transparency == 0) {
   gameState2 = true;   
  }

if (gameState1 == true) {
  for (int i = 0; i < friends.length; i++) {
    friends[i].update();
    friends[i].paint(); 
  }
  if (lastSecondRecorded != millis())
  {
   lastSecondRecorded = millis();
   friends[0].transparency -= 1;
  }
    if (friends[0].up == true) {
      friends[0].yplayer--;
    }
    if (friends[0].down == true) {
      friends[0].yplayer++;
    }
    if (friends[0].left == true) {
     friends[0].xplayer--;
    } 
    if (friends[0].right == true) {
     friends[0].xplayer++;
    }

  friends[0].box.y = friends[0].yplayer;
  friends[0].box.x = friends[0].xplayer; 
}

if (friends[0].transparency == 0) {
 gameState2 = true;
 gameState1 = false;
}

if (gameState3 == true) {
  fill(100,120,170);
  noStroke();
  rect(0,0,width,height);
  fill(255,0,0);
  noStroke();
  textAlign(CENTER);
  text(suicideText1,250,180);
  text(suicideText2,250,200);
  text(suicideText3,250,220);
}
if ((gameState3 == true) && (mousePressed == true)) {
     setup();
     gameState3 = false;
     gameState2 = false;
     gameState1 = true;
     points = 0;
     newpoints = 0;
}

  
if (gameState2 == true && gameState3 == false) {
  fill(200,120,100);
  noStroke();
  rect(0,0,width,height);
  fill(0,0,255);
  noStroke();
  text(gameoverText1,270,200);
  textAlign(CENTER);
  textAlign(CENTER);
  text((gameoverText4+newpoints+gameoverText5),250,220);
  //text(gameoverText3,260,220);
  text(gameoverText6,260,240);
}

if ((gameState2 == true) && (mousePressed == true)) {
     setup();
     gameState3 = false;
     gameState2 = false;
     gameState1 = true;
     points = 0;
     newpoints = 0;
}

  if (secondReference3 != second() && gameState1 == true)
  {
   secondReference3 = second();
   newpoints = points++;
   println(newpoints);
  }
  
      } //end of draw
      
      
      
  void keyPressed() {
    if (keyCode == UP) {
      friends[0].up = true;
    }
    if (keyCode == DOWN) {
      friends[0].down = true;
    }
    if (keyCode == LEFT) {
      friends[0].left = true;
    }
    if (keyCode == RIGHT) {
      friends[0].right = true;
    }
  }
     
      void keyReleased() {
    if (keyCode == UP) {
      friends[0].up = false;
    }
    if (keyCode == DOWN) {
      friends[0].down = false;
    }
    if (keyCode == LEFT) {
      friends[0].left = false;
    }
    if (keyCode == RIGHT) {
      friends[0].right = false;
    }
  }


