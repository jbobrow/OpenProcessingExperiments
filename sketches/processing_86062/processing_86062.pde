
PImage MainBackground;
PImage background1;
PImage background2;
PImage background3;
PImage alice;
PImage cheshirecat;
PImage bluerose;

float aliceX;
float aliceY;

float cheshirecatX;
float cheshirecatY;

boolean title = true;

int counter=0;


void setup()
{
  size(530, 512);
  background(255);
  smooth();

  MainBackground = loadImage("the wonderland crew.jpg");
  background1 = loadImage("background1.jpg");
  background2 = loadImage("background2.jpg");
  background3 = loadImage("Shrooms.jpg");

  alice = loadImage("Alice2.png");
  cheshirecat = loadImage("Cheshirecat2.png");
  bluerose = loadImage("bluerose.png");

  aliceX = random(width-25);
  aliceY = random(height-50);

  cheshirecatX = random(width-50);
  cheshirecatY = random(height-37);
}


void draw()
{
  if (title==true)
  {
    image(MainBackground, 0, 0, 530, 512);
    fill(255, 8, 144);
    textSize(36);
    textAlign(CENTER);
    text("Let's Play!\nPress spacebar to continue.", width/2, height/2);
  }
  if (title==false)
  { 
    cursor(bluerose,24,24);
    
    if (counter<10)
    {
      image(background1, 0, 0);
    }

    if (counter>=10 && counter<20)
    {
      image(background2, 0, 0, 530, 512);
    }

    if (counter>=20 && counter<30)
    {
      image(background3, 0, 0, 530, 512);
    }
    image(alice, aliceX, aliceY, 25, 50);
    image(cheshirecat, cheshirecatX, cheshirecatY, 50, 37);
  
    if(counter>=30)
    {
      background(255);
      textAlign(CENTER);
      textSize(36);
      fill(random(255),random(255),random(255));
      text("You Win! \n Press Z Key to Restart", width/2,height/2);
    }
  }
}

void mousePressed()
{
  if (mouseX>=aliceX && mouseX<=aliceX+25 && mouseY>=aliceY && mouseY<=aliceY+50)
  {
    aliceX=random(width-25);
    aliceY=random(height-50);
    counter++;
  }

  if (mouseX>=cheshirecatX && mouseX<=cheshirecatX+50 && mouseY>=cheshirecatY && mouseY<=cheshirecatY+37)
  {
    cheshirecatX=random(width-50);
    cheshirecatY=random(height-37);
    counter++;
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    title = false;
  }
  
  if(key == 'z')
  {
    title = true;
  }
}


