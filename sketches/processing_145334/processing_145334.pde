


//Use the arrow keys to change the speed of your character
//As you press arrow keys your character will speed up or slow down

Mover orb; //orb is Your character
Mover[] them = new Mover[100];//number of enemies
Mover[] those = new Mover[100];//special enemies
float a=2;//changes "agility" of your orb
int x=0;//DO NOT CHANGE (changes starting speed of You)
int y=0;//DO NOT CHANGE (changes starting speed of You)
int c=100;//changes color of You
int l = 16;//changes size of You
int w = l;
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
float theta;
Button normalButton;
Button insaneButton;
Button returnButton;
Button restartButton;

void setup() 
{
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  size(1000, 600 );//size of screen
  frameRate(60);
  orb = new Mover(0, 0, width/2, height/2);
  normalButton = new Button(width/2-150, height/2+25, 200, 50, 255, "Normal");
  insaneButton = new Button(width/2+150, height /2 +25, 200, 50, 255, "Murder");
  returnButton = new Button(width/2, height/2+75, 350, 50, 255, "Return to Main Menu");
  restartButton = new Button(width/2, height/2+150, 200, 50, 255, "Restart");
  words();
}

void words()
{
  int messages = 12;
  chooser = int(random(messages));
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
  else if(chooser == 6)
  {
    message = "dont over analyse";
  }
  else if(chooser == 7)
  {
    message ="use evasive manoeuvres";
  }
  else if(chooser == 8)
  {
    message = "50% daily fibre";
  }
  else if(chooser == 9)
  {
    message = "dont overanalyse";
  }
  else if(chooser == 10)
  {
    message = "new look same great taste";
  }
  else if (chooser == 11)
  {
    int reject = int(random(round(100/messages)));
    if(reject <= 1){
    message = "you suck";
    }
    else {
      message = "musical theatre sucks";
    }
  }
}
//switch(chooser){
//  case 1:
//  
//  break;
//  case 2:
//  
//  break;
//  default:
//  
//  break;
//}
void easyMode()
{
  numberThem=10;
  numberThose=0;
  a=2;
  for (int i = 0; i< numberThem; i++)
  {
    them[i] = new Mover((random(-5, 5)), (random(-5, 5)), (random(width)), 0);
  }
  for (int i = 0; i< numberThose; i++)
  {
    those[i] = new Mover((random(0, 0)), (random(0, 0)), (random(width)), 0);
  }
  reset();
}
void normalMode()
{
  numberThose=1;
  numberThem=Num;
  s=.1;
  a=2;
  for (int i = 0; i< numberThem; i++)
  {
    them[i] = new Mover((random(-5, 5)), (random(-5, 5)), (random(width)), 0);
  }
  for (int i = 0; i< numberThose; i++)
  {
    those[i] = new Mover((random(0, 0)), (random(0, 0)), (random(width)), 0);
  }
}
void hardMode()
{
  numberThose=1;
  numberThem=Num;
  s=.2;
  a=2;
  for (int i = 0; i< numberThem; i++)
  {
    them[i] = new Mover((random(-5, 5)), (random(-5, 5)), (random(width)), 0);
  }
  for (int i = 0; i< numberThose; i++)
  {
    those[i] = new Mover((random(0, 0)), (random(0, 0)), (random(width)), 0);
  }
  reset();
}
void INSANITY()
{
  numberThose=1;
  numberThem=Num;
  s=.25;
  a=3;
  for (int i = 0; i< numberThem; i++)
  {
    them[i] = new Mover((random(-15, 15)), (random(-15, 15)), (random(width)), 0);
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
  if (key=='1')
  {
    easyMode();
    start=true;
  }
  if (key=='2')
  {
    normalMode();
    start=true;
  }
  if (key == '3')
  {
    hardMode();
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
  orb = new Mover(0, 0, width/2, height/2);
  lost = false;
  purple = millis()/1000;
  println(purple);
  for (int i = 0; i< numberThem; i++)
  {
    them[i] = new Mover((random(-5, 5)), (random(-5, 5)), (random(width)), 0);
  }
  for (int i = 0; i< numberThose; i++)
  {
    those[i] = new Mover((random(0, 0)), (random(0, 0)), (random(width)), 0);
  }
}
void draw() 
{
  if (lost)
  {
    orb.location.x=-1000000;
    orb.location.y=-1000000;
  }

  background(255);
  orb.update();
  orb.displayYou(l, w, c);
  if (lost)
  {
    textSize(32);
    fill(0);
    text("Game Over", width/2, height/2);
    restartButton.againClicked(restartButton.mouseover());
    returnButton.anotherClicked(returnButton.mouseover());
    returnButton.display();
    restartButton.display();
    textSize(40);
    text(score, width/2, (height/2-50));
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
    text("The Next Flappy Bird", width/2, height/2-100);
    textSize(24);
    normalButton.clicked(normalButton.mouseover());
    insaneButton.otherClicked(insaneButton.mouseover());
    normalButton.display();
    insaneButton.display();
    translate(800, 400);  // Translate to the center
    rotate(theta); // Rotate by theta  
    text(message, 0, 0);               
    theta += 0.02;
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
      reset();
      INSANITY();
      start=true;
      purple=millis()/1000;
    }
  }
  void anotherClicked(boolean within)
  {
    if (within == true && mousePressed == true)
    {
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
    fill(175);
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
  void displayYou(int w, int l, int tempC) 
  {

    c=tempC;
    stroke(0);
    fill(c);
    ellipse(location.x, location.y, w, l);
  }
}

