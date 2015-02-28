
PImage img, mole, knife;
int activeMole, score, totalMoles;
Timer timer;
boolean game_over = false;

void setup( )
{
  size(900, 700);
  color(255);
  noCursor();
  img = loadImage ("BACKGROUND-DONE.png");
  knife = loadImage("knife_done.png");
  mole = loadImage("MOUSE_DONE.png");
  timer = new Timer ((int)random(4000)+1000);
  timer.start();
  activeMole = (int) random (5);
}

void draw()
{
  pushMatrix();
  scale(0.5);
  image(img,-25,0);
  popMatrix();
  drawText();
  drawActiveMole();
  
if (mousePressed)
   image(knife,mouseX,mouseY,140,140);
  else
   image(knife,mouseX,mouseY,80,80);
   
if (timer.isFinished()) {
    println("timer finished");
    if (activeMole == -1 && !game_over) {
      activeMole = (int)random(5);
 }  
   else {
      activeMole = -1;
     if (!game_over) totalMoles++;
    }
    timer.start();
  }
}

void mouseClicked()
{
  if(isMoleBeingClickedOn() & game_over == false) {
    score++;
    totalMoles++;
    activeMole = -1;
  }
}

boolean isMoleBeingClickedOn()
{
  print(activeMole);
  pushMatrix();
  fill(#F70C0C);
  ellipse(mouseX, mouseY, 50, 50);
  popMatrix();
   
 if (activeMole == 4 && mouseX > 363 && mouseX < 463 && mouseY > 404 && mouseY < 504) return true;
 else if (activeMole == 3 && mouseX > 99 && mouseX < 249 && mouseY > 362 && mouseY < 512) return true;
 else if (activeMole == 2 && mouseX > 243 && mouseX < 393 && mouseY > 472 && mouseY < 622) return true;

 else if (activeMole == 0 && mouseX > 639 && mouseX < 839 && mouseY > 599 && mouseY < 799) return true;
 else if (activeMole == 1 && mouseX > 821 && mouseX < 900 && mouseY > 439 && mouseY < 539) return true;
 
 return false;
 }


void drawActiveMole()
{ 
  switch(activeMole)
  {
    case 0: image(mole,639,599,200,200);break;
    case 1: image(mole,821,439,100,100);break;
    case 2: image(mole,243,472,150,150);break;
    case 3: image(mole,99,362,150,150);break;
    case 4: image(mole,363,404,100,100);break;
  }
}

void drawText ()
{
  fill(255);
  textSize(48);
  text ("Score:" + score, 100,100,-30);
  text ("Total Mice:"+ totalMoles,100,150,-30);
  if (totalMoles>= 8)
  {
    if(score>=6)
    text("You win!",400,160,-30);
    else
    text("You lost:(",400,160,-30);
    game_over = true;
  }
}
  
  
class Timer {
  
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
   
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
   
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
  }
   
  // The function isFinished() returns true if 5,000 ms have passed.
  // The work of the timer is farmed out to this method.
  boolean isFinished() {
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}




