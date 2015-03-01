
//PONG
//By: Chance Byers

//Updates

//Got rid of some messy code that was glitching the game.
//Moved the points to a different position and named the AI Donuty.

//News

//I will be adding levels and a start menu in the future. The menu will have two gamemodes you can choose from. The first one will regular and the second one will be impossible.



int xspeed = 5;
int yspeed = 5;
int rectSpeed = 5;
int x = 50;
int y = 50;
int by = 10;
int by2 = 100;
int sc1 = 0;
int sc2 = 0;
boolean won = false;
boolean lost = false;
int rectSpeedDefault = 5;
int ballSpeedDefault = 6;

void setup()
{
  size(700, 600);
  background(0, 0, 0);
  //noCursor();
}

void draw()
{
  //if (!won && !lost) {
  //if(sc1 >= 5){
  //rectSpeedDefault = 5; 
  // }
  //if (!won && !lost) {
  //if(sc1 >= 5) {
  //ballSpeedDefault =6;
  //rectSpeedDefault = 7;
  // }
  background(0);
  textSize(20);
  fill(255);
  text(sc1, 120, 580);
  text(sc2, 450, 580);
  text("Player:", 56, 580);
  text("Donuty:", 380, 580);
  noStroke();
  x = x + xspeed;
  y = y + yspeed;
  by2 = by2 + rectSpeed;
  ellipse(x, y, 20, 20);
  rect( 10, by, 10, 80);
  rect( 680, by2, 10, 80);
  if (x > 700)
  {
    x = 80;
    y = 150;
    sc1 = sc1+1;
  }
  if (x < 10)
  {
    x = 625;
    y = 350;
    sc2 = sc2+1;
  }
  if (y > 600)
  {
    yspeed = -ballSpeedDefault;
  }
  if (y < 10)
  {
    yspeed = ballSpeedDefault;
  }
  if (y > by && y < by+80 && x < 20) {
    xspeed = ballSpeedDefault;
  }
  if (y > by2 && y < by2+80 && x > 660) {
    xspeed = -ballSpeedDefault;
  }

  if (by2 > y-30)
  {
    rectSpeed = -rectSpeedDefault;
  }
  if (by2<y-30)
  {
    rectSpeed = rectSpeedDefault;
  }
  if (by > 530)
  {
    by = by - 10;
  }
  if (by < 2)
  {
    by = by + 10;
  }
  if (sc1 >= 10) {
    won = true;
  }
  if (sc2>=10) {
    lost = true;
  }
  if (keyPressed)
  {
    if (keyCode == UP) {

      by = by - 5;
    }
    else if (keyCode == DOWN) {
      by = by + 5;
    }
  }


else if (won) {
  textSize(20);
  fill(0, 254, 0);
  text("You won! Congratulations! Now restart. (Press R to restart)", 50, 300);
}
else if (lost) {
  textSize(20);
  fill(254, 0, 0);
  text("You lost! Congratulations! Now restart. (Press R to restart)", 50, 300);
}
}

void keyPressed() {
  if ((won || lost) && (key == 'r'||key=='R') ) {
    sc1 = 0;
    sc2 = 0;
    won = false;
    lost = false;
    x = 350;
    y = 300;
  }
}

