
/* Assignment No. 4
   
In this Assignmet I wanted to have an canvas filled with colorfull ellipses randomly changing its color, size and position in an endless loop.
The ellipses should have pastell colors with a little bit of transparency and the ability to drag the created ellipses while holding the left mouse button.  

Mouse Input:
************
Holding left mouse button:    creating the ellipses with random size, color and position
Dragging left mouse button:   moving the created ellipses

Keyboard Input:
***************
If the key 's' or 'S' is pressed a screenshot will be saved
If delete or backspace is pressed the canvas will be cleared

Link to the documentation: 

*/


//array with the chosen color palette
color[] palette = {#D9839D, #7F5B8C, #10152A, #519ABF, #D9CBC8, #D95933, #4FA6A0, #491919, #89BF65}; //color palette saved in an array

//initializing the necessary variables for the noise-function
float eoff1 = 0.0; 
float eoff2 = 0.0; 
float eoff3 = 0.0; 


void setup() {
  size(800,800);    //canvas size
  background(#10152A);  //background color for the canvas after the sketch has been started waiting for user input
  noStroke();       //no strokes for the ellipses
  frameRate(15);    //15 fps, so it shouldn't run that fast
}


void draw() {
  //assign the counter steps for the noise-function
  eoff1 = eoff1 + .01; 
  eoff2 = eoff2 + .06;
  eoff3 = eoff3 + .09;
  
  //initializing, calculating and assigning the noise-values 
  float e1 = noise(eoff1)*width/6;
  float e2 = noise(eoff2)*width/9;
  float e3 = noise(eoff3)*width/6;
   
  //starting creating the ellipses and the ability to move the ellipses while dragging the mouse
  if(mousePressed==true) { 
    background(#10152A);

    for(float i=0; i<5000; i+=100) {
       fill(palette[int(random(palette.length))],90); //random fill color for the ellipses chosen from the obove color pallette
       ellipse(random(mouseX),random(mouseY),e1,e1);  //random x and y position depending of the mouse position
       fill(palette[int(random(palette.length))],90); 
       ellipse(random(mouseX),random(mouseY),e2,e2);
       fill(palette[int(random(palette.length))],90); 
       ellipse(random(mouseX),random(mouseY),e3,e3);
    } 
  } 
}


void keyPressed() {
  
  if(key=='s' || key=='S') {
    saveFrame("screenshot-######.png"); //if the key 's' or 'S' is pressed a screenshot will be saved
    println("Screenshot saved");
  }
  
  if(key==DELETE || key==BACKSPACE) {  //if delete or backspace is pressed the canvas will be cleared
    background(#10152A);
    println("canvas cleared");
  }
}
  
  
  
  
  
  


    









