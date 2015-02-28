
PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;



float r,g,b;
int s=second();

void setup()
{
  size(400, 400);
  myChosenFont = loadFont("AgencyFB-Reg-48.vlw");
  textFont(myChosenFont, 15);
  frameRate(30);
}
 

void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  userInput();
  r = random(255);
g = random(255);
b = random(255);
}
 
void keyPressed()
{
  if (key != CODED)
    userInput += key;
    
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
}

 void userInput()
{
  if(userInput.equalsIgnoreCase(pass))
  {
  fill(r,g,b);
    ellipse(300,300,200,200);
    
    fill(r+100,g,b);
    ellipse(250,275,30,30);
    
    fill(r+100,g,b);
    ellipse(350,275,30,30);
    
    fill(r+100,g,b);
    rect(250,330,100,20);
    
    if (r>255)
    r=255;
  }
    
  
   
       
    
    
}
