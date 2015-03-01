
int sizer; //declares a variable for size

void setup(){
  
  size(800,800); //declares the size of the sketch
  background(255); //declares the background color
  
  sizer = 20; // set initial value for variable
  
  
}

int r = 0;  //declaring variables for colors
int g = 0;
int b = 0;
int p = 0;

void draw(){
  
  
if(keyPressed && key == 'r'){ //if key pressed is r the shape will be red
   r = 255;
   g = 0;
   b = 0;
 }
 if(keyPressed && key == 'g'){  //if key pressed is g the shape will be green
   r = 0;
   g = 255;
   b = 0;
 }
 if(keyPressed && key == 'b'){  //if key pressed is b the shape will be blue
   r = 0;
   g = 0;
   b = 255;
 }

 noStroke();
 
 if(mousePressed){
   fill(r,g,b);
 }else{
   noFill();
 }
  
  if(mousePressed && mouseButton == LEFT){
   ellipse(mouseX,mouseY,sizer,sizer); 
  }
  else if(mousePressed && mouseButton == RIGHT){
   triangle(mouseX,mouseY,mouseX+50,mouseY+5,mouseX+25,mouseY+25); 
  }
 else if(mousePressed && mouseButton == CENTER){
   ellipse(mouseX,mouseY,sizer+10,sizer+10); 
 }
 }
  
  



