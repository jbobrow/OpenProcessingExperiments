
//global variables

float v = 0; //Assigns value to v, which determines number of key presses. 
int blot = 0; //blot determines number of dots and change of color from black to yellow to black. 


void setup () {
  size (500, 200); 
  background (255); 
  smooth (); 
  PFont let = loadFont ("Garamond-20.vlw"); 
  textFont (let); 
  textSize (20); 

}

void draw () {
  fill (0); 
  
  //First key press
  if (v==1) {
      background (255); //Sets background to white.
      text ("Times may be bad.", 10, 100); //Shows the text
  } //end
  
  //Second keypress
  else if (v==2) {
      background (255); 
      text ("But God is still good.", 300, 100); 
  } //end 
  
  //Third key press
  else if (v==3) {
      background (255);   
      text ("Says the bus' dashboard sticker.", 100, 100); 
  } //end 

  //Fourth key press. *Animation sequence*
  else if (v==4) {
       
       //Resets background to white and ensures that black dots will stay in place. 
       if (blot == 0) {  
       background (255);
       blot ++;
       } 
      
      //*Animation Sequence begins*
      
      //Fill with black dots.
      if (blot <= 1000 && blot != 0) {
      frameRate (1-70); 
      float r = random (120); 
      float x = random (500); 
      float y = random (300);
      noStroke (); 
      fill (random (100), random(225)); 
      ellipse (x, y, r, r);
      blot ++; 
      }
      
      //Fill with yellow dots. 
      else if (blot >= 1001 && blot < 1500) {
      frameRate (1-70); 
      float r = random (120); 
      float x = random (500); 
      float y = random (300);
      noStroke (); 
      fill (255, 255, 0, random(225)); 
      ellipse (x, y, r, r);
      blot ++;
      }
  
     //Fill with black dots 
     else if (blot >= 1500) {
     frameRate (1-70); 
     float r = random (120); 
     float x = random (500); 
     float y = random (300);
     noStroke (); 
     fill (random (100), random(225)); 
     ellipse (x, y, r, r);
     blot ++;
     }
  
  } //*Animation Sequence ends*

  //Fifth key press   
  else if (v==5) {
       v = 1; //Reset's the value of v. 
       blot = 0;  
  } //end

} //draw() ends. 


void keyPressed(){
  if (key == 'u') {
   v = v+1;
 }

} //keyPressed() ends. 

