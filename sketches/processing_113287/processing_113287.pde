
float z=100;
float x=100;
float y=100;
float a=100;
float b=100;

boolean paused = false; // set up boolean variable called pause assumes it starts with key not pressed
 
void setup(){
  size (1000,800);
  background (255); //white background
  smooth(); // setting smoothness
  noLoop(); //draw () will not loop
}
 
void draw() {
     if(!paused) runMyCode(); //if keypressed is false run the code called runMyCode
}
 
void runMyCode() { // running of the code if key pressed is false
     //filling all variables with random values
    x=random(width/6);// random x position between 0 and 100
    y=random(height/6);// random y position between 0 and 100
    a=random(PI*4);
    b=random(PI*4);
    noFill();
   
  if ((mouseX<width/2) && (mouseY<height/2) && (mousePressed)) {
      strokeWeight(2); 
      stroke (random(255),random(255),0,random(255));//stroke with red
      arc (pmouseX,pmouseY,x,y,a,b);// draw lines starting at mouse position and shooting out at random positions
  } else if ((mouseX>width/2) && (mouseY<height/2) && (mousePressed)) {
      strokeWeight(2);  
      stroke (0,random(255),0,random(200));//stroke with green
      arc (pmouseX,pmouseY,x,y,a,b);// draw lines starting at mouse position and shooting out at random positions
} else if ((mouseX<width/2) && (mouseY>height/2) && (mousePressed)) {
      strokeWeight(2);    
      stroke (0,0,random(255),random(200));//stroke with blue
      arc (pmouseX,pmouseY,x,y,a,b);// draw lines starting at mouse position and shooting out at random positions
} else if ((mouseX>width/2) && (mouseY>height/2) && (mousePressed)) {
    strokeWeight(2);      
    stroke (0,0,0,random(100));//stroke with black
      arc (pmouseX,pmouseY,x,y,a,b);// draw lines starting at mouse position and shooting out at random positions
} else{
      strokeWeight(2); 
      stroke (random(255),random(255),random(255),random(255));//fill with random colour and opacity
      arc (pmouseX/2,pmouseY/2,x,y,a,b);// draw lines starting at mouse position and shooting out at random positions
}
}
 
 
void keyPressed() {
     background(random(255),random(255),random(255)); //resets background to black
} 

void mousePressed() {
  loop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
} 
   
 



