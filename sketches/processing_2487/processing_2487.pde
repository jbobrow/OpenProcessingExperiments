
//This is the setup wrapper. Anything in here happens once at the start of our program. 
boolean isDrawing = false; 
 
void setup() { 
   
  size(400,400); //set the size of the window. 
  background(255); //set the background colour 
  smooth();//turn on smoothing 
  stroke(10,2,200,100); 
  fill(255,140,0,0); 
   
   
}; 
 
//This is the draw wrapper. Anything in here happens once per frame. 
void draw() { 
  if (isDrawing) { 
   
  line(300,250, mouseX + random(10), mouseY +random(10)); 
 rect(250,250,mouseX + random (2), mouseY + random(2)); 
  } 
}; 
 
void mousePressed() { 
  isDrawing = !isDrawing; 
}; 


