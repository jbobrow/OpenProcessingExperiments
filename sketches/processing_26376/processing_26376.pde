
//import processing.opengl.*;
import processing.video.*;

MovieMaker mm;

Button [] buttons = new Button [3];

int redish = 250;
int redgrow = 1;
int greenish = 250;
int greengrow = 1;
int blueish = 250;
int bluegrow = 1;
float brushsize = 10;



void setup () {
  
  size(800, 600);
  mm = new MovieMaker(this, 800, 600, "drawing.mov");
  
  
  smooth();
  background(255);
  frameRate(30);
  noStroke();
  buttons[0] = new Button (width/6, height/6*5, color (255,0,0));
  buttons[1] = new Button (width/2, height/6*5, color (0,255,0));
  buttons[2] = new Button (width/6*5, height/6*5, color (0,0,255));
  
}  
 
 
 void draw () {
  
  for (int i = 0; i < buttons.length; i++) {
   
   buttons[i].display();
  
  }
  
  if (mouseX > (width/6)-50 && mouseX < (width/6)+50 && mouseY > (height/6*5)-50 && mouseY < (height/6*5)+50 && mouseButton == RIGHT) {
    
    buttons[0].isPressed = true;
    buttons[1].isPressed = false;
    buttons[2].isPressed = false;
    
  }
  
  if (mouseX > (width/2)-50 && mouseX < (width/2)+50 && mouseY > (height/6*5)-50 && mouseY < (height/6*5)+50 && mouseButton == RIGHT) {
    
    buttons[0].isPressed = false;
    buttons[1].isPressed = true;
    buttons[2].isPressed = false;
    
  }
    
  if (mouseX > (width/6*5)-50 && mouseX < (width/6*5)+50 && mouseY > (height/6*5)-50 && mouseY < (height/6*5)+50 && mouseButton == RIGHT) {
    
    buttons[0].isPressed = false;
    buttons[1].isPressed = false;
    buttons[2].isPressed = true;
    
  } 
 
   if (buttons[0].isPressed && mouseButton == LEFT && mousePressed) {
    
    fill(redish,255-redish,255-redish); 
    ellipse(mouseX,mouseY,brushsize,brushsize);
    redish+=redgrow;
   
   } 
   
   if (buttons[1].isPressed && mouseButton == LEFT && mousePressed) {
    
    fill(255-greenish,greenish,255-greenish); 
    ellipse(mouseX,mouseY,brushsize,brushsize);
    greenish+=greengrow;
   
   }
   
   if (buttons[2].isPressed && mouseButton == LEFT && mousePressed) {
    
    fill(255-blueish,255-blueish,blueish); 
    ellipse(mouseX,mouseY,brushsize,brushsize);
    blueish+=bluegrow;
   
   }
   
   
   if (redish >= 255 || redish <= 0) {
     
     redgrow *= -1;
     
   }
   
   if (greenish >= 255 || greenish <= 0) {
     
     greengrow *= -1;
     
   }
   
   if (blueish >= 255 || blueish <= 0) {
     
     bluegrow *= -1;
     
   }
   
   fill(0);
   rect(width/3,height/6*5,100,100);
   rect(width/3*2,height/6*5,100,100);
   strokeWeight(10);
   stroke(255);
   line(width/3,height/6*5,width/3-30,height/6*5);
   line(width/3,height/6*5,width/3+30,height/6*5);
   
   
   
   line(width/3*2,height/6*5,width/3*2-30,height/6*5);
   line(width/3*2,height/6*5,width/3*2+30,height/6*5);
   line(width/3*2,height/6*5,width/3*2,height/6*5-30);
   line(width/3*2,height/6*5,width/3*2,height/6*5+30);
   noStroke();
   if (mouseX > (width/3)-50 && mouseX < (width/3)+50 && mouseY > (height/6*5)-50 && mouseY < (height/6*5)+50 && mouseButton == RIGHT) {
     
     brushsize -= .1;
     
   }
   
   if (mouseX > (width/3*2)-50 && mouseX < (width/3*2)+50 && mouseY > (height/6*5)-50 && mouseY < (height/6*5)+50 && mouseButton == RIGHT) {
     
     brushsize += .1;
     
   }
  
   mm.addFrame();
 
 } 


void keyPressed() {
  if (key == ' ') {
    // Finish the movie if space bar is pressed
    mm.finish();
    // Quit running the sketch once the file is written
    exit();
  }
}



class Button {
 
  color buttoncollor;
  float xcenter;
  float ycenter;
  boolean isPressed = false;
  
  Button (float tempX, float tempY, color tempColor) {
    
    xcenter = tempX;
    ycenter = tempY;
    buttoncollor = tempColor;
  
  }
    
  void display () {
  
    rectMode(CENTER);
    fill(buttoncollor);
    rect(xcenter, ycenter, 100, 100);
  
  }

}     
                
