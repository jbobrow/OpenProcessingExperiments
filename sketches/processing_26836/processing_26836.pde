
//Lauren Fraser 2011

//DECLARE VARIABLES
float r;
float g;
float b;
float a;
float c;
float diam;
float x;
float y;
float ranX, ranY; 

//INITIAL SETTINGS
void setup() {
  size(600,600);
  smooth();
  background(0);
}

//REPEAT
void draw() {
  r=random(255);
  g=random(255);
  b=random(200);
  a=random(200);
  c=random(100);
  diam=random(25);
  x=random(width);
  y=random(height);
 
    noStroke();
  fill(r,g,b,c);
  ellipse(x,y,diam,diam);
  
  

  
  
//squares in the middle of the page to give people a bit more of a clue about the whole concept - that clicking in each quadrant draws a square in the colour assigned to that quadrant.

fill(190, 0, 0);
rect(240,240,60,60);

fill(0, 224, 0);
rect(300,240,60,60);

fill(1, 144, 255);
rect(240,300,60,60);

fill(252, 255, 29);
rect(300,300,60,60);

//making the black square in the middle
fill(0);
rect(270,270,60,60);
  
//  telling programing what colour the squares should be depending on the quadrant the mouse is in when it is clicked. Also, saying that the black square in the middle should produce
//black squares in random positions when clicked.
  
    if(mouseX<width/2 && mouseY<height/2) {
      fill(190, 0, 0, a);
    if(mouseX>270 && mouseY>270 && mouseX<300 && mouseY<300){
    fill(0); 
    }   
      println("red");
  }
  
  
  else if(mouseX>width/2 && mouseY<height/2) {
    fill(0, 224, 0, a);
    if(mouseX>300 && mouseY>270 && mouseX<330 && mouseY<300){
    fill(0);
    }
    println("green");
  }
  else if(mouseX<width/2 && mouseY>height/2) {
    fill(1, 144, 255, a);
    if(mouseX>270 && mouseY>300 && mouseX<300 && mouseY<330){
    fill(0);
    }
    println("blue");
  }
  else if(mouseX>width/2 && mouseY>height/2) {
    fill(252, 255, 29, a);
    if(mouseX>300 && mouseY>300 && mouseX<330 && mouseY<330){
    fill(0);
    }
    println("yellow");
  }
  

}

void mousePressed(){
 ranX = random(10, width -10);
 ranY = random(10, height -10);
 rect(ranX, ranY, 40, 40);

}



//EVENT HANDLERS

//CUSTOM FUNCTIONS

//CLASSES


