
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
  if(matched == true)
   PasswordResponse();  
}
 
void keyPressed()
{
/* you do not need to say key.toString() in the processing application. You can just say:
    userInput += key;
  However, when uploading to openprocessing, you will need to use toString()
    */
  if (key != CODED)
    userInput += key.toString(); // to display keys pressed as long as they are not coded keys.
  if(userInput.equalsIgnoreCase(pass))
    matched = true; //to display true if password is correct
    
    else if(keyCode == BACKSPACE) // if backspace is pressed all typed font is cleared 
    userInput = "";
}

void PasswordResponse()
{float r, g, b;
  r = random(1,255);
  g = random(1,255);
  b = random(1,255);

for(int i = 1; i <10; i++)
 {fill(r,g,b);
 ellipse(width/10*i,60,10,10);
 rect(i*9,80,10,10);
 ellipse(width/11*i,100,10,15);
 }
}
