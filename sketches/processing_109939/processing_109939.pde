
//Define Color Palette
color[] rainyday = {
  #CCFFFF, #B9E8FF, #A7D1FF, #94B9FF, #82A2FF, #6F8BFF, #5D74FF, #4A5DFF, #3846FF, #252EFF, #1317FF, #0000FF
};
color[] palette = rainyday;
float counter = 0;
float time = 0;
int i, j, paletteCounter = 0;
float x, y;

//Create setup code block
void setup() {
  //maximum window size for this assignment
  size(900, 720);
  frameRate(15);
  background(#CCCCFF);
}

void draw() {/* this does the drawing once per frame */
  paletteCounter = 11;
  background(#CCCCFF); /* clear the screen with white */
  translate(width*0.5, height*0.5); /* translate all the drawing to the middle of the screen */
  noFill(); /*stop the computer filling in shapes*/
  time=time+0.01; /* update the value in the variable 'time'. This means that we add 1 to 'time' every frame */
  
  for (int i = 0;i < 12; i++) { /* this for loop organises the drawing. It will do the drawing 12 times (between 0 and 11)  */
    stroke(palette[paletteCounter]);
    fill(palette[paletteCounter]);
    rotate(time); 
    rect(i, i, i*5, i*5); // this is the actual drawing.
    paletteCounter--;
  }
  
  paletteCounter = 11;
  for (int i = 0;i < 12; i++) { // repeated again for the outer spinning rectangles
    stroke(palette[paletteCounter]);
    fill(palette[paletteCounter]);
    rotate(time); 
    rect(i+100, i+100, i*5, i*5); 
    paletteCounter--;
  }
  
  paletteCounter = 11;
  for (int i = 0;i < 12; i++) { 
    stroke(palette[paletteCounter]);
    fill(palette[paletteCounter]);
    rotate(-time); 
    rect(i+200, i+200, i*5, i*5); 
     
    paletteCounter--;
  }
}



