
PFont myFont;
int y = 0 , speedY = 1;

String userInput = "", pass = "word";
boolean matched = false;

void setup()
{
size(400, 400);
myFont = loadFont("Broadway-48.vlw");
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
background (0);
fill (255, 0, 0);
ellipse(y, width/2 - 20, 15, 15);
ellipse((height - y), width/2 + 20,15, 15);
y = y+ speedY;
if( y > height || y < 0)
speedY = speedY * -2;
}
}

void keyPressed()
{
if (key != CODED)
userInput += key.toString();
if(userInput.equalsIgnoreCase(pass))
matched = true;
}
