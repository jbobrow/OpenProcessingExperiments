
PFont mainFont; // created a place to put font

String input = "", pass = "humbug";
boolean correct = false;  // checks input text


void setup()
{
  background(180, 85, 100);

  size (600, 600);
  mainFont = loadFont("HelveticaNeue-Bold-48.vlw"); //chosen font from "tools"
  textFont( mainFont, 25); //assigned font to text and sized it.
}

void draw ()
{
  frameRate(15);   //slowed frame rate so CoRRect() function looks better(ellipses draw less rapidly!!
  userInput();     //Also, user input writes more slowely
  coRRect();
}
void userInput()  //this gives initial screen with hint and shows input
{
  background(180, 85, 100);
  text ("Whats the pass word? ", width/4, 20);
  text ("Enter Password: " + input, width/4, 80);
  text ("Hint.....that humming really bugs me!! ", width/4, 120);


  if (keyPressed)
  {
    // background (180, 85, 100);
    if (key != CODED)
      input += key.toString();
  }
}

//Then if input correct this function initialises
void coRRect() //function for correct answer...is that enough animated shapes??
{
  if (input.equals(pass))
  {
    for (int i = 0; i< 10; i ++)
    {
      //These are random shapes and colours
      fill(random(255), random(255), random(255));
      ellipse (i * 80, height*3/4 +random (120), random(100), random(60));
      ellipse (i * 80, height*3/4 - random (80), random(50), random(50));
      ellipse (i * 80, height*3/4 + random(150), random(70), random(50));
    }
    //here is smilely face with message
    ellipse(width/2, height/2, 100, 100);
    line (width/2 -10, height/2 - 25, width/2 - 30, height/2 - 25);
    line (width/2 +10, height/2 - 25, width/2 + 30, height/2 - 25);
    text ("YOU GOT IT RIGHT!", width/3, height/3);
    arc (width/2, height/2, 80, 80, 0, PI);
  }
}
