

//Use the arrow keys to change the speed of your character
//As you press arrow keys your character will speed up or slow down

Mover orb; //orb is Your character
Mover[] them = new Mover[100];//number of enemies
Mover[] those = new Mover[100];//special enemies
float a=2;//changes "agility" of your orb
int x=0;//DO NOT CHANGE (changes starting speed of You)
int y=0;//DO NOT CHANGE (changes starting speed of You)
color colorful=255;
int highscore;
int l = 16;//changes size of You
int w = l;
boolean stuff=false;
int numberThose;
int numberThem;
boolean lost = false;
boolean start = false;
int purple;
int score;
float s = .1;
int Num = 15; // number of enemies
String message;
int chooser;
float spin;
int speed;
boolean initiate = false;
boolean checkHighscore = false;
Button normalButton;
Button insaneButton;
Button secretButton;
Button returnButton;
Button restartButton;


void setup() 
{
  colorMode(HSB);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  size(1000, 600);//size of screen
  frameRate(60);
  orb = new Mover(0, 0, width/2, height/2);
  normalButton = new Button(width/2-150, height/2+25, 200, 50, 255, "Normal");
  insaneButton = new Button(width/2+150, height /2 +25, 200, 50, 255, "Murder");
  returnButton = new Button(width/2, height/2+175, 450, 50, 255, "Return to Main Menu");
  restartButton = new Button(width/2, height/2+250, 200, 50, 255, "Restart");
  secretButton = new Button(width/2, height/2+115, 250, 50, 255, "Not a Secret Button");
  words();
  if (loadStrings("score.txt") == null)
  {
    String[] noscore = {
      str(0), str(0), str(0)
      };
      saveStrings("score.txt", noscore);
  }
}

void words()
{
  int messages = 13;
  chooser =int(random(messages));
  //  chooser=11;
  if (chooser == 1)
  {
    message = "now with more colour";
  }
  else if (chooser == 2)
  {
    message = "not on steam";
  }
  else if (chooser == 3)
  {
    message = "has nougat centre";
  }
  else if (chooser == 4)
  {
    message = "labour intensive";
  }
  else if (chooser == 5)
  {
    message = "now melk free";
  }
  else if (chooser == 6)
  {
    message = "dont over analyse";
  }
  else if (chooser == 7)
  {
    message ="use evasive manoeuvres";
  }
  else if (chooser == 8)
  {
    message = "50% daily fibre";
  }
  else if (chooser == 9)
  {
    message = "dont overanalyse";
  }
  else if (chooser == 10)
  {
    message = "new look same great taste";
  }
  else if (chooser == 12)
  {
    message = "what is lyfe";
  }
  else if (chooser == 11)
  {
    int reject = int(random(round(100/messages)));
    //    int reject = 1;
    if (reject <= 1) {
      message = "initiate operation yellow lamb";
      initiate=true;
    }
    else {
      message = "musical theatre sucks";
    }
  }
}

void normalMode()
{
  numberThose=1;

  numberThem=Num;
  speed=5;
  s=.1;
  a=2;
  for (int i = 0; i< numberThem; i++)
  {
    them[i] = new Mover((random(-speed, speed)), (random(-speed, speed)), (random(width)), 0);
  }
  for (int i = 0; i< numberThose; i++)
  {
    those[i] = new Mover((random(0, 0)), (random(0, 0)), (random(width)), 0);
  }
}

void INSANITY()
{
  numberThose=1;

  numberThem=Num;
  speed=10;
  a=3;
  s=.25;
  for (int i = 0; i< numberThem; i++)
  {
    them[i] = new Mover((random(-speed, speed)), (random(-speed, speed)), (random(width)), 0);
  }
  for (int i = 0; i< numberThose; i++)
  {
    those[i] = new Mover((random(0, 0)), (random(0, 0)), (random(width)), 0);
  }
}
void keyPressed()
{
  if (key == 'r')
  {
    reset();
  }

  if (key=='2')
  {
    normalMode();
    start=true;
  }

  if (key =='m')
  {
    start=false;
    lost=false;
    reset();
  }
  if (key =='4')
  {
    INSANITY();
    start=true;
  }
  else if (key == CODED)

    if (keyCode == DOWN)
    {
      orb.velocity.y = orb.velocity.y+a;
    }
    else if (keyCode == UP)
    {
      orb.velocity.y = orb.velocity.y-a;
    }
    else if (keyCode == LEFT)
    {
      orb.velocity.x = orb.velocity.x-a;
    }
    else if (keyCode == RIGHT)
    {
      orb.velocity.x = orb.velocity.x+a;
    }
}
void reset()
{
  background(255);
  orb = new Mover(0, 0, width/2, height/2);
  lost = false;
  checkHighscore=false;
  purple = millis()/1000;
 =
  for (int i = 0; i< numberThem; i++)
  {
    them[i] = new Mover((random(-speed, speed)), (random(-speed, speed)), (random(width)), 0);
  }
  for (int i = 0; i< numberThose; i++)
  {
    those[i] = new Mover((random(0, 0)), (random(0, 0)), (random(width)), 0);
  }
}
void draw() 
{
  if (stuff)
  {
    colorful= color(round((millis()%(255*3))/3), 255, 255);
  }
  else
  {
    colorful=255;
  }
  if (lost)
  {
    orb.location.x=-1000000;
    orb.location.y=-1000000;
  }
  background(colorful);
  orb.update();
  orb.displayYou(l, w);
  if (lost && !checkHighscore)
  {
    highscore=highscoreSystem();
    checkHighscore=true;
  }
  if (lost && checkHighscore)
  {
    textSize(40);
    fill(0);
    text("Game Over", width/2, height/2-100);
    restartButton.againClicked(restartButton.mouseover());
    returnButton.anotherClicked(returnButton.mouseover());
    returnButton.display();
    restartButton.display();
    textSize(32);
    text("Your Score:", width/2, height/2+50);
    text(score, width/2, height/2+100);
    fill (255, 0, 0);
    rectMode(CENTER);
    noFill();
    rect(width/2, height/2, 250, 275);
    text("Highscore:", width/2, height/2-50);
    text(highscore, width/2, height/2);
    fill(0);
  }
  else
  {
    fill(0);
    textSize(32);
    text(score, width/2, 50);
    score=((millis()/1000)-purple);
  }

  if (start)
  {
    for (int i = 0; i< numberThem; i++)
    {
      them[i].displayThem();
      them[i].update();
    }
    for (int i = 0; i< numberThose; i++)
    {
      those[i].displayThem();
      those[i].update();
    }

    if (orb.location.x > width) 
    {
      lost = true;
    } 
    if (orb.location.x < 0) 
    {
      lost = true;
    }

    if (orb.location.y > height) 
    {
      lost = true;
    } 
    if (orb.location.y < 0) 
    {
      lost = true;
    }

    for (int i = 0; i< numberThem; i++)
    {
      orb.getDistance(them[i]);

      if (orb.getDistance(them[i])<16)
      {

        lost = true;
      }
    }
    for (int i = 0; i< numberThose; i++)
    {
      orb.getDistance(those[i]);

      if (orb.getDistance(those[i])<16)
      {

        lost = true;
      }
    }
  }
  else
  {
    background(255);
    fill(0);
    textSize(48);
    text("Balls", width/2, height/2-100);
    textSize(24);
    normalButton.clicked(normalButton.mouseover());
    insaneButton.otherClicked(insaneButton.mouseover());
    normalButton.display();
    insaneButton.display();
    if (initiate == true)
    {
      secretButton.newClicked(secretButton.mouseover());
      secretButton.display();
    }
    translate(800, 400);  // Translate to the center
    rotate(spin); // Rotate by spin  
    text(message, 0, 0);               
    spin += 0.02;
  }
}
int highscoreSystem()
{
  String Scores[] = loadStrings("score.txt");

  int result=0;
  if (speed == 5)
  {
    result = int(Scores[0]);
    if (score>int(Scores[0]))
    {
      Scores[0] = str(score);
      saveStrings("score.txt", Scores);
      result = int(Scores[0]);
      println("speed is 5" + result);
    }
  }
  else if (speed == 10)
  {
    result = int(Scores[1]);
    if (score>int(Scores[1]))
    {
      Scores[1] = str(score);
      saveStrings("score.txt", Scores);
      result = int(Scores[1]);
      println("speed is 10" + result);
    }
  }
  else if (speed==100)
  {
    result = int(Scores[2]);
    if (score>int(Scores[2]))
    {
      println(score + "," + int(Scores[2]));
      Scores[2] = str(score);
      saveStrings("score.txt", Scores);
      result =  int(Scores[2]);
      println("speed is not 10 or 5" + result);
    }
  }
  return result;
}


void notAnEasterEgg() 
{

  numberThose=0;
  numberThem=10;
  speed=100;
  a=2;
  s=.1;
  for (int i = 0; i< numberThem; i++)
  {
    them[i] = new Mover((random(-speed, speed)), (random(-speed, speed)), (random(width)), 0);
  }
  for (int i = 0; i< numberThose; i++)
  {
    those[i] = new Mover((random(0, 0)), (random(0, 0)), (random(width)), 0);
  }
}
class Button
{
  int centerX;
  int centerY;
  int Width;
  int Length;
  int colors;
  int colors1;
  int colorsAlternate1 = color(200);
  int colorsAlternate2 = color(100);
  int time = 0;
  String name;
  boolean depressed = false;

  Button(int tempCenterX, int tempCenterY, int tempWidth, int tempLength, int tempColors, String tempName)
  {
    colors = colors1 = tempColors;
    centerX = tempCenterX;
    centerY = tempCenterY;
    Width = tempWidth;
    Length = tempLength;
    name = tempName;
  }

  void display()
  {
    fill(colors);
    stroke(0);
    rect(centerX, centerY, Width, Length);


    fill(0);
    text(name, centerX, centerY);
  }
  boolean mouseover()
  {
    int withinX = constrain(mouseX, centerX-(Width/2)-1, centerX+(Width/2)+1);
    int withinY = constrain(mouseY, centerY-(Length/2)-1, centerY+(Length/2)+1);
    if (withinX > centerX-(Width/2)-1 && withinX < centerX+(Width/2)+1 && withinY > centerY-(Length/2)-1 && withinY < centerY+(Length/2)+1)
    {
      colors = colorsAlternate1;
      return true;
    }
    else
    {
      colors = colors1;
      return false;
    }
  }
  void clicked(boolean within)
  {
    if (within == true && mousePressed == true)
    {
      stuff=false;

      reset();
      normalMode();
      start=true;
      purple=millis()/1000;
    }
  }
  void otherClicked(boolean within)
  {
    if (within == true && mousePressed == true)
    {
      stuff=false;

      reset();
      INSANITY();
      start=true;
      purple=millis()/1000;
    }
  }
  void newClicked(boolean within)
  {
    if (within == true && mousePressed == true)
    {
      reset();
      notAnEasterEgg();
      start=true;
      purple=millis()/1000;
      stuff = true;
      println("secret stuff");
    }
  }
  void anotherClicked(boolean within)
  {
    if (within == true && mousePressed == true)
    {
      stuff=false;
      start=false;
      lost=false;
      words();
    }
  }
  void againClicked(boolean within)
  {

    if (within == true && mousePressed == true)
    {
      println("reset button");
      reset();
    }
  }
}
class Mover 
{


  PVector location;
  PVector velocity;

  Mover(float x, float y, float a, float b) 
  {


    location = new PVector(a, b);
    velocity = new PVector(x, y);
  }


  float getDistance( Mover other)
  {
    float d = dist(location.x, location.y, other.location.x, other.location.y);
    return d;
  }

  void update() 
  {

    location.add(velocity);
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  }


  void displayThem() 
  {
    fill(150);
    ellipse(location.x, location.y, 16, 16);
    for (int i = 0; i< numberThose; i++)
    {
      if (those[i].location.x>orb.location.x)
      {
        those[i].location.x=those[i].location.x-s;
      }
      else 
      {
        those[i].location.x= those[i].location.x+s;
      }
      if (those[i].location.y>orb.location.y)
      {
        those[i].location.y =those[i].location.y - s;
      }
      else
      {
        those[i].location.y=those[i].location.y+s;
      }
    }
  }
  void displayYou(int w, int l) 
  {
    stroke(0);
    fill(0);
    ellipse(location.x, location.y, w, l);
  }
}

