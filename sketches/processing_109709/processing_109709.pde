
//14/09/2013 
//MOK Ka Yee Amanda 
//SID 52622241 

void setup(){
  size(500,500);   //Set window size
  smooth();        //Smooth the lines
  background(0);   //Set the black background
  
}


int value = 0;

void draw() {
  fill(value);
  rect(400, 400, 55, 55); //the left top rect
  rect(40, 40, 55, 55);   //the right rect
  rect(40, 400, 55, 55);  //the left rect
  rect(400, 40, 55, 55);  //the right top rect

}

void mouseMoved() {       // Move the mouse to change its value
  value = value + 10;
  if (value > 500) {
    value = 0;
  }
  
  noStroke();
  float w; 
  float r;
  float g;
  float b;
  float a;
  w=random(50);
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
   
   
  rect(pmouseX,pmouseY,w,w);
  fill(r,g,b,a);  
  
}

//The end
