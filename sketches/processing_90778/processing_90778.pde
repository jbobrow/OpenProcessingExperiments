
PFont myChosenFont;  


String userInput = "", pass = "PLAY\n";   

float x=0,y=0;  
boolean play=false;
boolean wrong=false;
float speedX=3;
float speedY=6;
 

void setup()  

{  

  size(400, 400);  

  myChosenFont = loadFont("AngsanaUPC-BoldItalic-48.vlw");  

  textFont(myChosenFont, 25);  
  x=random(width);
  y=random(height);


}  

   

void draw()  

{  
  
    
  if(!play){ 
  background(125);
  stroke(255);
  text("Keep tying until password matches", width/3, 20);  
  text("Enter text here: " + userInput, 0, height/2 - 20);  
  if(wrong) text("wrong input", 0, height/2 + 20); 
  //print("ddf");
 //  
}
else drawShapes();

}

void keyPressed()  

{  
/* you do not need to say key.toString() in the processing application. You can just say:  

    userInput += key;  

  However, when uploading to openprocessing, you will need to use toString()  

    */ 
// play=false;
 if(!play)
   userInput(); 
else 
  play=false;
}

void userInput()
{
 //matched=false;
 
 if (key != CODED) 
    userInput += key.toString();  
  if(keyCode==ENTER)
  if(userInput.equalsIgnoreCase(pass))  
   {
    userInput="";
    drawShapes();  
    play=true;
    
  } 
  else {wrong=true; userInput="";
 
    }}
 
void drawShapes()
{
  background(255);
  float r=random(255);
  float g=random(255);
  float b=random(255);
  rectMode(CENTER);
  fill(r,g,b);  
  rect(x,y,50,50);
  fill(255,0,0);
  noStroke();
  rect(x+20,y,10,50);
  rect(x,y+20,50,10);
  fill(0);
  ellipse(x,y,10,10);
  x=x+speedX;
  y=y+speedY; 
  if(x<0||x>width-20)speedX=-speedX;
  if(y<0||y>width-20)speedY=-speedY;
    
}
