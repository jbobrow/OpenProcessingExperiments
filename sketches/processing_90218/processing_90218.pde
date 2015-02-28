
PFont myChosenFont;


String userInput = "", pass = "word";
boolean matched = false;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("Tahoma-15.vlw");
  textFont(myChosenFont, 15);
  
}
 
void draw()
{
  background(0);
  fill(255);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  if(userInput.equalsIgnoreCase(pass))//check if password is true
  shapes();//calls the function
}
 
void keyPressed()
{
  if (key != CODED)
    userInput += key.toString();
  if(userInput.equalsIgnoreCase(pass))
      matched = true;
}
void shapes()
{
  frameRate (8);
float r = random(255);//fill
float g = random(255);//fill
float b = random(255);//fill
float a = random(255);//fill
float x = random(400);//position shape 1
float y = random(400);//position shape 1
float q = random(400);//position shape 2
float w = random(400);//position shape 2
float e = random(400);//position shape 3
float u = random(400);//position shape 3
float t = random(60,120);//size of shape 3
float i = random(60,80);//size of shape 3
background(255);
fill(r,g,b);
rect(x,y,60,60);
fill(r,g,a);
ellipse(q,w,80,80);
fill(r,a,b);
rect(e,u,t,i);    
}
