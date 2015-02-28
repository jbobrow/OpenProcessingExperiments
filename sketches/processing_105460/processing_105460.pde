
//DRAWING ASSIGNMENT 
//GUI (graphic user interface) you need 4 buttons for collor (red, greeen,  blue, erase)
// create a single button function and from that, create all the buttons
// each button in a different position and with its correspondant color, maybe at the top or bottom of the window.

//Paint tool
//Draw lines with the mouse movement, when mouse click is down.
//The color of lines must be selected from one of 4 buttons (red,green, blue, erase all).

//Image (done)
//Load an image in the background of the window.
//You will paint over the image, but when you erase the background,the image will be loaded again.

//My Cat Image 
PImage myCat;
int myW=150;
color myRed= color(255,0,0);
color myGreen= color(0,255,0);
color myBlue= color(0,0,255);
int myH=100;
color myLine= color(myRed);
float value = 0;




void setup(){
size (800, 800);
myCat = loadImage ("pompic.jpg");
image(myCat, 0, 0);
background(0);
imageMode(CENTER);
image(myCat, 400, 400);

}

void draw (){
// background(250);
//Buttons
  stroke(0);
  strokeWeight (1);
  button(0,myRed);
  button(myW,myGreen);
  button(myW*2,myBlue);
  button(myW*3,0);

  if(mousePressed) {
  strokeWeight (2+value);
  stroke(myLine);
    line(pmouseX, pmouseY, mouseX, mouseY);}
    
//Conditional 1
  if((mouseX > 0 && mouseX < myW) && (mouseY >0 && mouseY < myH)) {
     myLine=myRed;
  }
    
//Conditional 2
  if((mouseX >myW && mouseX < myW*2) && (mouseY >0 && mouseY < myH)) {
     myLine=myGreen;
}

//Conditional 3
  if((mouseX >myW*2 && mouseX < myW*3) && (mouseY >0 && mouseY <myH)) {
     myLine=myBlue;
  }
  
//Conditional 4
  if((mouseX >myW*3 && mouseX < myW*4) && (mouseY >0 && mouseY <myH)) {
     background(255);
     image(myCat, 400, 400);
  }
  
}
  

void button (int X, int col) {
  fill(col);
  rect(X,0,myW,myH);
  
}

void keyPressed() {
  value += 1;


/*  if (value == 0) {
    value = 255;
  } 
  else {
    value = 0;
  }*/
}





