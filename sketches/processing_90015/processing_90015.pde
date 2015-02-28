
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}
PFont myChosenFont;  

boolean randomColour = false;
int r=0, g=0, b=0;

String userInput = "", pass = "word";  


boolean matched = false;  

   

void setup()  

{  

  size(400, 400);  

  myChosenFont = loadFont("AngsanaNew-BoldItalic-48.vlw");  

  textFont(myChosenFont, 25);  

}  

   

void draw()  

{  

  background(0);  

  text("Keep tying until password matches", width/3, 20);  

  text("Enter text here: " + userInput, 0, height/2 - 20);  

  text("Does the input match? True or false: " + matched, 0, height/2 + 20);  
 
} 
  
  
      

 

void keyPressed()  

{  

  if (key != CODED)  

    userInput += key;  

  if(userInput.equalsIgnoreCase(pass))  

    matched = true; 
    userInput();

 

    
  
} 

void userInput()
{
 
    {
      r= (int) random(255);
      g= (int) random(255);
      b= (int) random(255);
    }
    fill(r,g,b);
    rect(300,300,40,40);
    triangle(100,310,30,350,60,350);
    ellipse(200,320,30,30);
}
    

  
 
void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
