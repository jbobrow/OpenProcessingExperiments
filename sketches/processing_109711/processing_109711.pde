
// HUI Wang Chuen 53077809
// 2013/2014 sem A
// SM2706 CMS 3
// Coding for interactivity
// Assignment 1
// Instructor: Dr. Miu-Ling LAM 

// Citation:
// Coding example for reference : wk2_execrise_01_2 , http://processing.org/reference/keyPressed_.html
// Coding example for reference : Daniel Shiffman, "Learning Processing" (California :Morgan Kaufmann Pub,1998),pp.85
// Coding example for reference : http://processing.org/reference/mousePressed_.html

float a,b,colorR, colorG, colorB, alpha;  // to set the value of these variables are not fixed.

int x,y = 0; // to set those integral value.
int z = 600;
int w = 0;




void setup () // to set the size of windows, colour of background, smoothness of stroke produced in this sketch and the speed of draw function.
{size (600,600) ; 
 background (0) ; 
 smooth();
 frameRate(20);


}
 
void draw () 
{
  colorR = random (255);   // to use random function in order to show up different colour under random selction in each frame.
  colorG = random (255);   // RGB mode
  colorB = random (255);
  alpha = random (255);

  

  stroke (colorR, colorG, colorB, alpha) ;   // line of the shaple
  fill (0); // color field of the shape
  ellipse (x,y,100,100);  // x,y as variables, which have set in the global part
   // if/else condition - on the viusal part,
   // I want the centre of ellipse to move into opposing direction after fully interacting
   // with another ellipse, therefore I set up the following condition:
   // first, the left circle keeps moving in a southeastern direction while satisfying the if-clause condition,
   // x+1 and y+1 means it will plus 1 in X and Y-coordinate each frame.
   // However, when the centre go to (300,300), it cannot keep moving in the same direction.
 
    
   if (x <= width /2 && y <= height /2) 
   {x = x+1  ;
    y = y+1  ; }  
    
   // Inversely, it start moving in southwestern direction.
   // x+1 and y+1 means the X-coordinate will decrease in 1 and Y-coordinate will increase in 1 each frame.
  
   else 
   {x = x-1  ;
    y = y+1  ; }

// The below part is a opposing logic of the above.

  stroke (colorR, colorG, colorB, alpha) ;
  fill (0);
  ellipse (z,w,100,100);
   if (z >= width /2 && w >= height /2)
   {z = z+1  ;
    w = w+1  ; }
   else 
    {z = z-1  ;
     w = w+1  ; }
     
     
     
   if (keyPressed == true) 
 // press key to do a special effect that erase the ellipse record, but the keypressed functon will execute
 // with the above function together, so we may see, even we release the key, the ellipse keep moving accordig to its rule. 
     {rect (0,0,700,700);
     fill (0);} 
       
        }
     
     

     

void mousePressed()

// this part actually has no much logical and rational concept and it is just an experimental try that 
// how to create aesthetics throughout different mouseReleased function
// Notice: as the keyPressed functon is belong to draw function so the ellipse and mousePressed live together,
// However, keyPressed function will totally erased the record of the below function as they are completely independent.
{
  fill (colorR, colorG, colorB, alpha) ;
  stroke (colorR, colorG, colorB, alpha) ;
  line (mouseX,300,150,mouseY );
  
  fill (colorR, colorG, colorB, alpha) ;
  stroke (colorR, colorG, colorB, alpha) ;
  line (300,mouseX,mouseX,150 );
  
  fill (colorR, colorG, colorB, alpha) ;
  stroke (colorR, colorG, colorB, alpha) ;
  line (mouseX,mouseY,150,150 );
  
  fill (colorR, colorG, colorB, alpha) ;
  stroke (colorR, colorG, colorB, alpha) ;
  line (300,300,mouseY,mouseY );
  }
