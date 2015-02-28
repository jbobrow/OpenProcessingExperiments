

PFont myFont;// variable for font
 
String userInput = "", password = "word"; // variable to store user input and defined password
boolean matched = false;

// variables for animation
float posx = 0;
   float posy = 0;
   float speedx = 1;
   float speedy = 2;

 
void setup()
// setup the the inital window, background color and font type
{
  size(400, 400);
    background(255);
      myFont = loadFont("Skia-Regular_Light-Extended-15.vlw");
        textFont(myFont, 15);
          smooth();
}   
      void draw()
      
      //functions for password entry window and animation

      {
        passtext();
         if(matched == true)
              animate();
      }
      
      void passtext()
      {
       text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Matching Input?: " + matched, 0, height/2 + 20);
  fill(0);
      
   

  
           if(posx < 0 || posx > width) speedx = -speedx;
          
      }



void keyPressed()
{
// user input... void animate will not execute unless until user input is matched "true" to variable password
   
     background(255);

   fill(2);
    if (key != CODED)
     userInput += key.toString();
       if(userInput.equalsIgnoreCase(password))
       matched = true;
       
       
          if(matched == true){} 
   
  }
   
   void animate()
   
   //  draws the shapes and controls their velocity due to variable values defined and the if and else statements that alter those values with relation to the height and width
   {
            background(0); 
            
 if(posy > height)
  
    speedy = -speedy;
          else speedy += 1;
 
    
       
     posx += speedx;
       posy += speedy;
     
     
 
        fill(255);
          ellipse(posx, posy, 50, 50);
            fill(20, 100, 150);
              rect(posx * 2, posy, 20, 30);
              fill(0, 255, 0);
              triangle(posx * 1.5, 20, posy * 2, 40, posx * 1.5, 50); 
  
    
  }
