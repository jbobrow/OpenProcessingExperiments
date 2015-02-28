
void setup () {
  size(300, 300);
  noFill();
  colorMode (HSB, 100);
}
void draw(){
  

  for (int yPos = 0; yPos < height/5; yPos++) {// declares the y position as 0, if the y position is less then frame height/5 then add 1 to y position
    for(int xPos = 0; xPos <width/5; xPos++){// declares the  xposition as 0, if the d position is less then frame width/5 then add 1 to x position
        //for (int hHue=0; hHue < width/5; hHue++) { // doesnt work
            //for (int sHue=0; sHue < height/5; sHue++) { / // doesnt work
          stroke (mouseX, mouseY, 100); //adds a stroke with the variable hue
          ellipse(xPos * width/5, yPos * height/5, mouseX, mouseY); //draws an ellipse depending on x and y coordinates -- looks like a changing pattern
            }
          } 
       // }
      //}
    }



