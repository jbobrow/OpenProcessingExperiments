
//an integer value for the opacity (t=transparency)
int t = 128;
//initial integer values for the width and height of the rectangles
int w = 50;
int h = 50;
//initial integer values for the background
int r = 0;
int g = 0;
int b = 0;
//integer for a counter
int c = 0;
//variable for the font
PFont theFont;


void setup(){
  size(600,600);
  background(0);
  
  rectMode(CENTER);
  smooth();
  
  createFont("Arial-Black-48",48);
  createFont("OCRAExtended-48",48);
}


void draw(){
  c++;
  
  background(r,g,b);
  
  changeBackground();
  changeSize();
  drawRectangles();
  drawCircles();
  help();
  
  if(c<15){
    introMessage();
  }
  
}


public void changeBackground(){
  if(keyPressed){
    //if r is pressed, the background changes to red
    if(key == 'r'){
      r = 255;
      g = 0;
      b = 0;
    }
    
    //if g is pressed, the background changes to green
    if(key == 'g'){
      r = 0;
      g = 255;
      b = 0;
    }
    
    //if b is pressed, the background changes to blue
    if(key == 'b'){
      r = 0;
      g = 0;
      b = 255;
    }
    
    //if w is pressed, the background changes to white
    if(key == 'w'){
      r = 255;
      g = 255;
      b = 255;
    }
    
    //if y is pressed, the background is changed to white
    if(key == 'y'){
      r = 255;
      g = 225;
      b = 0;
    }
    
    //if p is pressed, the background is changed to purple
    if(key == 'p'){
      r = 125;
      g = 0;
      b = 255;
    }
    
    //if o is pressed, the background is changed to orange
    if(key == 'o'){
      r = 255;
      g = 125;
      b = 0;
    }
    
    //if the space bar is pressed, the background is reset to black
    if(key == ' '){
      r = 0;
      g = 0;
      b = 0;
    }
  }
}


public void changeSize(){
  if(keyPressed){
    
    //if the up arrow is pressed, the size of the objects increase
    if(keyCode == UP){
      w++;
      h++;
    } 
    
    //if the down arrow is pressed, the size of the objects decrease
    if(keyCode == DOWN){
      w--;
      h--;
    }
    
    
    //if the left arrow is pressed, the opacity is decreased (colours get stronger)
    if(keyCode == LEFT){
      t++;
    }
    
    //if the right arrow is pressed, the opacity is increased (colours get weaker)
    if(keyCode == RIGHT){
      t--;
    }
  }
}


public void drawRectangles(){
  //a loop which creates all the rectangles
  for(int x=50; x<600; x+=100){
    for(int y=50; y<600; y+=100){
      
      //ifs define the colour of the rectangle depending on its whereabouts on the x axis
      if(x<100){
        fill(255,0,0,t);
      }
      
      if(x>100 && x<200){
        fill(255,125,0,t);
      }
      
      if(x>200 && x<300){
        fill(255,255,0,t);
      }
      
      if(x>300 && x<400){
        fill(125,255,0,t);
      }
      
      if(x>400 && x<500){
        fill(0,255,0,t);
      }
      
      if(x>500){
        fill(0,255,125,t);
      }
      
      rect(x,y,w,h);
    }
  }
}


public void drawCircles(){
  //a loop which creates all the circles
  for(int x=0; x<700; x+=100){
    for(int y=0; y<700; y+=100){
      
      //ifs define the colour of the circle depending on its whereabouts on the x axis
      if(x==0){
        fill(0,255,255,t);
      }
      
      if(x==100){
        fill(0,125,255,t);
      }
      
      if(x==200){
        fill(0,0,255,t);
      }
      
      if(x==300){
        fill(125,0,255,t);
      }
      
      if(x==400){
        fill(255,0,255,t);
      }
      
      if(x==500){
        fill(255,0,125,t);
      }
      
      if(x==600){
        fill(255,0,0,t);
      }
      
      ellipse(x,y,w,h);
    }
  }
}


public void help(){
  if(keyPressed){
    if(key == 'h'){
      
      //if h is pressed created a white retangle that covers the screen and show help text
      fill(255);
      rect(300,300,600,600);
      
      theFont = loadFont("Arial-Black-48.vlw");
      
      fill(0);
      
      //help text for background changes
      textFont(theFont,50);
      text("Background",1,50);
      
      textFont(theFont,20);
      text("white = w  red = r  yellow = y  orange = o",20,100);
      text("purple = p  g = green  blue = b  black = space",20,130);
      
      
      //help text for size changes
      textFont(theFont,50);
      text("Size",1,250);
      
      textFont(theFont,20);
      text("Up Arrow = increase in size",20,300);
      text("Down Arrow = decrease in size",20,320);
      
      
      //help changes for opacity changes
      textFont(theFont,50);
      text("Opacity",1,440);
      
      textFont(theFont,20);
      text("Right Arrow = increase in opacity (colour weakens)",20,490);
      text("Left Arrow = decrease in opacity (colour strenghtens)",20,510);
      
      
      //nice wee message to be nice :) (smiley face)
      textFont(theFont,30);
      text("Enjoy making different patterns :)",20,575);
    }
  }
}


public void introMessage(){
  fill(255);
  
  theFont = loadFont("Arial-Black-48.vlw");
  
  //text that displays for 15 frames informing the user about the "help page"
  textFont(theFont,75);
  text("Hold h for help",1,300);
}



