
PFont myChosenFont;  

int x =0;
int speedX = 1;
   

String userInput = "", pass = "word";  

boolean matched = false;  

   

void setup()  

{  

  size(400, 400);  
  


  myChosenFont = loadFont("LucidaBright-Italic-48.vlw");  

  textFont(myChosenFont, 15);  

}  

   

void draw()  

{  

  background(0);  

  text("Keep tying until password matches", width/3, 20);  

  text("Enter text here: " + userInput, 0, height/2 - 20);  

  text("Does the input match? True or false: " + matched, 0, height/2 + 20);  
 
  
}  

void drawEllipse(int x)
{
     noFill();
     stroke(255);
     ellipse(x,50,20,20);
     x = x + speedX;
     if(x <width || x > width)
     speedX = speedX * -1;   
}   
void drawTriangle(int x)
{
  noFill();
  stroke(255);
  triangle(x,300, x+20, 250, x +40, 300);
  x = x + speedX;
     if(x <width || x > width)
     speedX = speedX * -1; 
}
void drawRectangle(int x)
{
  fill(255,255,0);
  noStroke();
  rect(x , 250, x +50, 250, x +50, 300, x,300);
  x = x + speedX;
     if(x <width || x > width)
     speedX = speedX * -1;   
}
  
  
void keyPressed()  

{  

/* you do not need to say key.toString() in the processing application. You can just say:  

    userInput += key;  

  However, when uploading to openprocessing, you will need to use toString()  

    */ 

  if (key != CODED)  

    userInput += key.toString() 
    
  if(userInput.equalsIgnoreCase(pass))  

    matched = true;  
    drawEllipse(200);
  drawTriangle(300);
  drawRectangle(100);
}
