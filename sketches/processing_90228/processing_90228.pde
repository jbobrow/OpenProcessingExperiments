
String userInput = "", pass = "word";  
boolean matched = false;  
float r,g,b;
void setup()  

{  

  size(400, 400);  
}  

void draw()  
{  
background (0);
 text("Enter text here: " + userInput, 0, height/2 - 20);  
text("Does the input match? True or false: " + matched, 0, height/2 + 20);


if (userInput.equalsIgnoreCase (pass))
{drawgoodshapes();}
}
void keyPressed()  
{  
if (key != CODED)  
userInput +=key;
if(userInput.equalsIgnoreCase(pass))
matched=true;
} 
void drawgoodshapes()
{if (matched ==true)
 
r=random(255);
g=random (255);
 b=random (255);
  fill (r,g,b);
triangle (20,10,0,40,40,40);
rect (120,120,50,50);
ellipse (80,80,20,20);
}
