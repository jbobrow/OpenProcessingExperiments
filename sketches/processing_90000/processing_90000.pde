
PFont Font1;
 
String myInput = "", pass = "word";
boolean matched = false;
 
void setup()
{
   background(255); 
  size(800, 800);
  Font1 = loadFont("BerlinSansFB-Bold-48.vlw");
  textFont(Font1, 30);
}
 
void draw()
{
  fill(10);
  text("Keep tying until password matches", width/5, 80);
  text("Enter text here: " + myInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  if(myInput.equalsIgnoreCase(pass))
  {
    matched = true;
    float x,y,diam;
    float r,g,b,a;
    x=random(800);
    y=random(800);
    diam=random(200);
    r=random(255);
    g=random(255);
    b=random(255);
    a=random(255);
    noStroke();
    fill(r,g,b,a);
    ellipse(x,y,diam,diam);
  } 
}
 
void keyPressed()
{
  if (key != CODED)
    myInput += key.toString();
  if(myInput.equalsIgnoreCase(pass))
    matched = true;
}
