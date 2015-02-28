
void}PFont myChosenFont;  

   

String userInput = "", pass = "word";  

boolean matched = false;  


   

void setup()  

{  

  size(400, 400);  

  myChosenFont = loadFont("ArialNarrow-Bold-48.vlw");  

  textFont(myChosenFont, 15);  

}  

   

void draw()  

{  

  background(0);  

  text("Keep tying until password matches", width/3, 20);  

  text("Enter text here: " + userInput, 0, height/2 - 20);  

  text("Does the input match? True or false: " + matched, 0, height/2 + 20);  
  
  SillyShape();

}  

   

void keyPressed()  

{  

/* you do not need to say key.toString() in the processing application. You can just say:  

    userInput += key;  

  However, when uploading to openprocessing, you will need to use toString()  

    */ 

  if (key != CODED)  

  // userInput += key;  
    userInput += key.toString(); 

  if(userInput.equalsIgnoreCase(pass))  

    matched = true;  
}


void SillyShape ()
{
  if(matched == true)
  {
    float r= random(1,255);
    float g= random(1,255);
    float b= random(1,255);
    stroke(r,g,b);
    fill(r, g, b);
    rect(10, 10, 50, 80);
     stroke(r,g,b);
    fill(r, g, b);
    triangle(150, 20, 180, 60, 130, 60);
     stroke(r,g,b);
    fill(r, g, b);
    ellipse(200, 200, 150, 150);
   
    
    
  }
}
