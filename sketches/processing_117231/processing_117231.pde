
//////////      ///////////                    ///////////////////
///////////     ////////////                    ///////////////////
////////////    ////// //////                    //////
/////////////   //////  /////////////      /////////////
////// ///////  //////   /////////////      ////////////////////
//////  /////// ///////////////////////      ////////////////////
//////   ///////////////////////////////      /////////////
//////    ////////////     //////////////      /////////////
//////     ///////////      //////////////      /////////////////////////
//////      //////////       //////////////      /////////////////////////

PFont font;
int countChocula = 0 , endCount = 0;
int textCount = -15;
int circleX, circleY;
int circleSize = 53;
color circleColor, baseColor, circleHighlight;
color currentColor;
boolean circleOver = false;
boolean overRect1 = false;
boolean overRect2 = false;
boolean overRect3 = false;
boolean overRandoRect = true;
boolean partyMode = false;
int difficulty;
int speed;
boolean playerWin = false;
boolean cpuWin = false;
boolean gameStart = false;
int rect1Fill = 240, rect2Fill = 240, rect3Fill = 240;
boolean hard = false, medium = false, easy = false;
RaceBall player;
RaceBall cpu;

void setup()
{
  font = createFont("Arial", 16, true);
  size(200, 200);
  smooth();
  circleColor = color(0, 0, 230);
  circleHighlight = color(0, 0, 255);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = width/4;
  circleY = height * 3/4;
  ellipseMode(CENTER);
  player = new RaceBall(120, 190);
  cpu = new RaceBall(170, 190);
}

void draw()
{
  countChocula++;
  update(mouseX, mouseY);
  background(currentColor);  

  fill(57, 255, 20);
  rect(5, 5, 15, 15);

  if (circleOver) {
    fill(circleHighlight);
  } 
  else {
    fill(circleColor);
  }
  stroke(0);
  if (hard && countChocula == 0 && !playerWin && !cpuWin) {
    circleX = (int)random(40)+ 40;
    circleY = (int)random(120)+ 40;
  }
  ellipse(circleX, circleY, circleSize, circleSize);
  if (!playerWin && !cpuWin && gameStart && countChocula > 8 && countChocula % speed == 0) {
    cpu.setIncrement(1);
    cpu.increment();
  }
  cpu.draw();
  player.draw();

  if (player.getY() <= 0) {
    textCount++;
    textFont(font, 40);
    fill(0, 0, 250);
    text("YOU", width/4 - textCount, height/2 - 10);
    fill(0, 0, 250);
    text("WIN", width/4 + textCount, height/2 +25);
    playerWin = true;
  }
  if (cpu.getY() <= 0) {
    textCount++;
    textFont(font, 40);
    fill(250, 0, 0);
    text("YOU", width/4 - textCount, height/2 - 10);
    fill(250, 0, 0);
    text("LOSE", width/4 + textCount, height/2 +25);
    cpuWin = true;
  }
  if (overRect1) {
    rect1Fill = 210;
  } 
  else {
    rect1Fill = 240;
  }  
  if (overRect2) {
    rect2Fill = 210;
  } 
  else {
    rect2Fill = 240;
  }  
  if (overRect3) {
    rect3Fill = 210;
  } 
  else {
    rect3Fill = 240;
  }
  if (!gameStart) {
    fill(rect1Fill);
    rect(5, 40, 55, 55);
    fill(rect2Fill);
    rect(72, 40, 55, 55);
    fill(rect3Fill);
    rect(140, 40, 55, 55);
    textFont(font, 13);
    fill(0);
    text("Easy", 18, 70);
    text("Hard[!]", 150, 70);
    text("Medium", 77, 70);
  }
  
  if (playerWin || cpuWin) {
    endCount++;
  }
  if (endCount == 250) {
    exit();
  }
}

void update(int x, int y)
{
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
  } 
  else {
    circleOver = false;
  }

  if (overRect(5, 40, 55, 55)) {
    overRect1 = true;
  } 
  else {
    overRect1 = false;
  }

  if (overRect(72, 40, 55, 55)) {
    overRect2 = true;
  } 
  else {
    overRect2 = false;
  }

  if (overRect(140, 40, 55, 55)) {
    overRect3 = true;
  } 
  else {
    overRect3 = false;
  }

  if (overRect(5, 5, 15, 15)) {
    overRandoRect = true;
  } 
  else {
    overRandoRect = false;
  }
}
void mousePressed()
{
  if (circleOver && !cpuWin && gameStart & !playerWin) {
    player.setIncrement(2);
    player.increment();
    if (partyMode) {
      currentColor = color((int)random(255), (int)random(255), (int)random(255));
    }
  }
  if (!circleOver && !overRandoRect && hard) {
    player.setIncrement(-2);
    player.increment();
  }

  if (overRandoRect && !partyMode) {
    partyMode = true;
  }  else if (overRandoRect && partyMode) {
    partyMode = false;
  }

  if (overRect1 && !gameStart) {
    gameStart = true;
    easy = true;
    medium = false;
    hard = false;
    speed = 10;
  }
  if (overRect2 && !gameStart) {
    gameStart = true;
    easy = false;
    medium = true;
    hard = false;
    speed = 7;
  }
  if (overRect3 && !gameStart) {
    gameStart = true;
    easy = false;
    medium = false;
    hard = true;
    speed = 7;
  }
}

boolean overCircle(int x, int y, int diameter) 
{
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } 
  else {
    return false;
  }
}

boolean overRect(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}

public class RaceBall {
  int ballX, ballY, increment;

  public RaceBall (int x, int y) {
    ballX = x;
    ballY = y;
  }
  public void setIncrement(int x) {
    increment = x;
  }
  public void increment() {
    ballY -= increment;
  }

  public void draw() {
    fill(240, 0, 0);
    ellipse(ballX, ballY, 20, 20);
  }

  public int getY() {
    return ballY;
  }
}



