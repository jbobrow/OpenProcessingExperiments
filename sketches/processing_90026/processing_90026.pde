
PFont myChosenFont;  
String userInput = "", pass = "Smile";  
float r, g, b;

void setup()  
{  
  size(400, 400);  
  myChosenFont = loadFont("BrushScriptMT-48.vlw");  
  textFont(myChosenFont, 30); 
}  

void draw()  
{  
  userInput();
  background(0);   
  text("Go Ahead And " + userInput, 105, height/2 - 20);    
} 

void userInput()
{
  r = random(0,255);
  g = random(0,255);
  b = random(0,255);
  background(r, g, b);
  fill(255,255,0);
  ellipse(width/2, height/2, 400,400);
  ellipse(125,100,50,50);
  ellipse(275,100,50,50);
  triangle(200,190,180,220,220,220);
  rect(110,250,20,20);
  rect(130,280,20,20);
  rect(160,300,20,20);
  rect(190,310,20,20);
  rect(220,300,20,20);
  rect(250,280,20,20);
  rect(270,250,20,20);
}

void keyPressed()  
{  
  if (key != CODED)  
    userInput += key;  
  if(userInput.equalsIgnoreCase(pass)) 
  {
    userInput ();
  }
    
}
