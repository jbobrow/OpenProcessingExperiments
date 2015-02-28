
float xpos = 0; // keeps track of where the x of the ball is
float ypos = 0; // keeps track of where the y of the ball is

float xdir = 5; // keeps track of xdirection
float ydir = 5.5; // keeps track of ydirection

PFont cat;

int click = 0;



void setup(){
  cat = loadFont("Helvetica-48.vlw"); 
  textFont(cat, 32); 


  background(#15B6E5);  //hexadecimal 
  // 1 parameter:  grayscale between 0 and 255
  // 2 parameters:  grayscale value, opacity
  // 3 parameters: r,g,b between 0 and 25
  // 4 parameters: r, g, b + opacity
  frameRate(60);
  size(600, 600); //x, y
  smooth();
  //noStroke();
}


void draw(){  // repeat (loop)
//  background(#15B6E5);  //hexadecimal 
  fakeBackground();
  fill (255);
 // image(cat, xpos, ypos, 300, 400);
text("cat", xpos, ypos);

//  ellipse(xpos, ypos, 100, 100);

if (xpos < 0 || xpos > width){
  xdir = - xdir;  
}
if (ypos < 0 || ypos > height){
  ydir = - ydir;  

}
  xpos = xpos + xdir;
  ypos = ypos + ydir;

  
}

void fakeBackground(){ 
    fill (#15B6E5, 100);
    rect(0, 0, width, height); // fake background
}

void mousePressed(){
  click++;
  if (click % 2 == 0){
  noLoop();
  } else {
   loop(); 
  }
}



