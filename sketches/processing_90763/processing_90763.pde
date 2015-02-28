
PFont myChosenFont;  

String userInput = "", pass = "word";  

boolean matched = false;  

int i=0;   

void setup()  

{  

  size(400, 400);  

  myChosenFont = loadFont("Perpetua-BoldItalic-48.vlw");  

  textFont(myChosenFont, 15);  

}  

   

void draw()  

{  
  if(keyPressed)
  userInput();
  
  if(!matched)
  {
    background(0); 
    
    text("Keep tying until password matches", width/3, 20);  

    text("Enter text here: " + userInput, 0, height/2 - 20);  

    text("Does the input match? True or false: " + matched, 0, height/2 + 20);  
  }
 

}  

void userInput()
{
  if(matched)
  {
    if(i>255)
    i=0;
    fill(i++);
    background(255);
    rectMode(CENTER);
    rect(width/2,height/2,100,100);
    ellipse(width/2,height/2,100,100);
    line(width/2-50,height/2,width/2+50,height/2);
  }
}

void keyPressed()  

{  

  if (key != CODED)  

    userInput += key.toString();  

  if(userInput.equalsIgnoreCase(pass))  

    matched = true;  

} 

