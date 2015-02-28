
PFont myFont;
int x = 0 , speedX = 1;

String userInput = "", pass = "cyan";
boolean matched = false;

void setup()
{
size(400, 400);
myFont = loadFont("CenturyGothic-48.vlw");
textFont(myFont, 10);
}

void draw()
{
background(0);
text("Keep typing until password matches", width/3.5, 30);
text("Enter text here: " + userInput, 10, height/2 - 20);
text("Does the input match? True or false: " + matched, 10, height/2 + 20);
if(userInput.equalsIgnoreCase(pass))
{
background (255);
fill (90, 218, 255);
ellipse(x, height/2 - 20, 10, 10);
rect((width - x), height/2 + 20,10, 10);
x = x+ speedX;
if( x > width || x < 0)
speedX = speedX * -1;
}
}

void keyPressed()
{
if (key != CODED)
userInput += key.toString();
if(userInput.equalsIgnoreCase(pass))
matched = true;
}
