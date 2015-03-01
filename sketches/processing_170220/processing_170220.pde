
//---------------------------------------------------------------------------------------------------------------------------------------- 
// ------------------------------    Program Name : RGBWords   ---------------------------------------------------------------------------
/* 
      As part of this work and depending on the course that we follow, 
      I wanted to represent the virtual world in which we live. 
      This is from several instructions that we find in programming languages 
      and the three RGB colors commonly call that this world was created. 
            Red, Green and blue
              
      Let's not forget the human spirit without which nothing would have been possible

*/
//
//--------------------------------------------------------------------------------------------------------------------------------------------- 


//--------------------------------------------------------------------------------------------------------------------------------------------- 
//------------------------------------------------------------------  Variables  -------------------------------------------------------------- 
//---------------------------------------------------------------------------------------------------------------------------------------------

//                       White    Red       Green    Blue
color [] palette  =     {#FFFAFA, #F74D4D, #657AFA, #08C14A};

// list of instructions
String [] ProWord  = {"Push", "Pop", "Switch", "MousePressed", "KeyReleased", "Random", "Case", "Fill", "Stroke", "If", "Then", "Else", "&&", "||"};

float PWord = 0;
float x = 0;
float y = 0;

//--------------------------------------------------------------------------------------------------------------------------------------------- 
//------------------------------------------------------------------  Section Setup  ---------------------------------------------------------- 
//---------------------------------------------------------------------------------------------------------------------------------------------

void setup() {
 
  // Screen Format
  size(1280,720);
  
  // White background
  background(palette[0]); 
  smooth();
  stroke(0); // Black
  strokeWeight(2);
  
//-----------------------------------------------------------
//------------------  Screen Introduction  
//------------------------------------------------------------
  line (0, 200,  width,  200);
  
  // Color random
  fill(palette[int(random(1, 3))]);
  ellipse (500, 200, 300, 300);
  
  // Message for instruction
  
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text(" When ready press Delete and CLICK ",width / 2, 200);
  textSize(20);
  textAlign(RIGHT);
  text(" Press 'S' to save the screen in PNG ",width - 300, 350);
  text(" Press '1' or '2' or '3' to change Color Line and strokeWeight ",width - 300, 400);
  fill(0);
  textSize(10);
  
  
  } // End Void

//--------------------------------------------------------------------------------------------------------------------------------------------- 
//------------------------------------------------------------------  Section Draw  ----------------------------------------------------------- 
//---------------------------------------------------------------------------------------------------------------------------------------------
float i = 10;

void draw()        {  // Draw

     if(mousePressed) {  // mousePressed
               
         if (i % 2 == 0) { 
       
             // Draw horizontal line 
             
             x = random(20, height - 20);
             y = random(20, width - 20);
             line (20, x, width - 20, x);
         
             // Draw ellipse (random color) in random position at the edge of the line
             
            
             
             fill(palette[int(random(1, 4))]);
             ellipse (y, x, 70, 40);
             
             // The form instruction
             
             fill(0);
             text(ProWord[int(random(0, 11))],y + 10, x);
             
      } else { 
        
             // Draw vertical line 
             
             x = random(20, height - 20);
             y = random(20, width - 20);
             line (y, 20, y, height - 20);
         
             // Draw rectangle (random color) in random position at the edge of the line
             
             fill(palette[int(random(1, 4))]);
             rect (y, x, 40, 70);
             
             // The form instruction
             
             fill(0);
             text(ProWord[int(random(12, 14))],y + 20, x + 40);
      } 
      
       i = i +1;   
    
  } // End mousePreseed
  
 } // End draw

//--------------------------------------------------------------------------------------------------------------------------------------------- 
//------------------------------------------------------------------  KeyReleased  ------------------------------------------------------------ 
//---------------------------------------------------------------------------------------------------------------------------------------------

void keyReleased(){
  
  
  // New sketch
  if (key == DELETE || key == BACKSPACE) background(255);
 
  
  // Save the picture
  if (key=='s' || key=='S') saveFrame("RGBWORDS.png");


  // Key 1, 2, 3 to change the stroke and the strokeweight
  switch(key)  {
    
    case '1' :
    
      stroke(palette[1]);
      strokeWeight(1);
      break;
      
    case '2':
    
      stroke(palette[2]);
      strokeWeight(2);
      break;
      
    case '3':
    
       stroke(palette[3]);
       strokeWeight(3);
      break;
    
  } //End Switch
  
} // End Keyreleased

