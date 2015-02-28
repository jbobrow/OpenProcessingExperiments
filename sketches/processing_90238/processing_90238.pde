
float r,g,b;
PFont myChosenFont;   

String userInput = "", pass = "word";  

boolean matched = false;  

   

void setup()  

{  

  size(400, 400);  

  myChosenFont = loadFont("AgencyFB-Reg-48.vlw");  

  textFont(myChosenFont, 15);  

}  

void draw()  

{  

  background(0);  

  text("Keep tying until password matches", width/3, 20);  

  text("Enter text here: " + userInput, 0, height/2 - 20);  

  text("Does the input match? True or false: " + matched, 0, height/2 + 20);  
  if (matched==true);
  drawshapes();
  {
}  
}

 
void keyPressed()  
                                                                
{ 
  if (key !=CODED)
    userInput += key.toString();
  if(userInput.equals(pass))   
  
  matched = true;
  
}

void drawshapes()
{

{
background(0);
r = random(255);
g = random(255);
b = random(255);
fill(r,g,b);
ellipse(25,60,25,25);
rect(60,40,20,20);
triangle(50,150,100,50,150,150);
}
}
