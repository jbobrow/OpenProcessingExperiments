
/*
Code by Daniel Fernandes
Circle pattern with switchable colors

----------------------
Click to switch colors
----------------------
*/

//Defines size of the circle
float circleSize = 80;

//Define colors (first value for the background, second value from the circle)
int colorValue, colorValue2;
boolean colorSwitch;

void setup(){
  //Size of the sketch
  size(640,480);
  
  //Needed to start the sketch with this color for the circle, or it would start completely black :P
  colorValue2 = 255;
  
}

//Draw some stuff
void draw(){
  
  //Define the background color
  background(colorValue);
  
  //Call the pattern function
  drawPattern();
  
}

//The function which draws the pattern
void drawPattern(){
  
  //Used to jump a line after a full line of circles
  int lineJumper = -1;
  
  //
  int auxJumper = 0;
  
  //Here's the for loop! =D
  for (int i = 0; i < 48; i+=1){
    
    //This structure makes the pattern jump a line after eight circles
    if (i%8 == 0){
    
      lineJumper+=2;
      auxJumper = 0;
     
    } else{
     
        auxJumper++;  
    
      }
    
    //Debugging the jump line
    print(i + "   " + lineJumper + "\n");
    
    //Draw no strokes on the circle
    noStroke();
     
    //Finally, draws the circle 
    ellipse(auxJumper * circleSize + circleSize/2, circleSize/2 * lineJumper, circleSize, circleSize);
    fill(colorValue2);
     
  }  //End of the for loop
    
}

//Switch the colors between black and white 
void mouseReleased (){
  
  if(colorSwitch){
    
     colorValue = 0;
     colorValue2 = 255;
     colorSwitch = false;
     
  } else {
    
      colorValue = 255;
      colorValue2 = 0;
      colorSwitch = true;
     
    }

}





