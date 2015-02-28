
float velocity, x;
PFont Font;

String userInput = "", pass = "password";
boolean matched = false;

void setup()
{
  rectMode(CENTER);
  size (500,500);
  velocity = 1;
  x = height/2;
  Font = loadFont("Playbill-48.vlw");
  textFont (Font,15);
  
}

void draw()
{

text("Keep tying until password matches", width/3, 20);
text("Enter text here: " + userInput, 0, height/2 - 20);
text("Does the input match? True or false: " + matched, 0, height/2 + 20);
}

void userInput()
      {
        background(0);
        fill (random(255));
        ellipse(x,250, 100, 100);
        fill (random(255));
        rect(x,250,100,50);
        fill (random(255));
        rect(x,250,25,25);
        x = x + velocity;
        if (x > width || x < 0)
        {
          velocity = velocity * -1;
        }
      }


 void keyPressed()
 {
  if (key != CODED)
  userInput += key;
  if (userInput.equalsIgnoreCase (pass))
  {
  matched = true;
  
    userInput();
  
  
  
  }
   }
