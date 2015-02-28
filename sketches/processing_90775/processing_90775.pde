
PFont myChosenFont;  
int speed=1;
int x=0;
int y=0;
   

String userInput = "", pass = "word";  

boolean matched = false;  

   

void setup()  

{  

  size(400, 400);  

  myChosenFont = loadFont("a.vlw");  

  textFont(myChosenFont, 15);  

}  

   

void draw()  

{  

  background(0);  

  text("Keep tying until password matches", width/3, 20);  

  text("Enter text here: " + userInput, 0, height/2 - 20);  

  text("Does the input match? True or false: " + matched, 0, height/2 + 20);  
 // frameRate(20);
  if(matched)
  {
    background(255,255,255);
    if(x+20<=width&&y+20<=height&&x>=0&&y>=0)
    {
      speed=speed*1;
    }
    else
    speed*=-1;
    x+=speed;
    y+=speed;
    fill(random(255),random(255),random(255));
    rect(x,y,20,20);
    fill(random(255),random(255),random(255));
    rect(x+5,y,10,20);
    fill(0,0,255);
    ellipse(x/8,y/8,2,2);
    ellipse(x/4,y/4,4,4);
    ellipse(x/2,y/2,6,6);
    line(0,0,x,y);
    int m=width-x-20;
    int n=height-y-20;
    line(x+20,y+20,width,height);
    ellipse((x+40)+m*0.625,(y+40)+n*0.625,4,4);
    ellipse((x+40)+m*0.75,(y+40)+m*0.75,2,2);
    ellipse((x+20)+m/2,(y+20)+m/2,6,6);
  } 
}  
void keyPressed()  
{
  userInput();
}
void userInput()
{
    if(key!=CODED&&key;!=BACKSPACE)
    userInput+=key.toString();
    else if(key==BACKSPACE)
    {
      userInput=userInput.substring(0,userInput.length()-1);
    }
    if(userInput.equals(pass))
      matched=true;
      else matched=false;      
}
