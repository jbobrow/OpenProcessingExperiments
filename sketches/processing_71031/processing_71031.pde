
// Assignment 02
// Janna Coles
// jcoles01@brynmawr.edu
// CS 110 -01
// 9/19/2012
// A space-y looking background with size and color changing ellipses. 
  //Color/size change based on the the mouse's y position.
  //Clicking the pink square produces a pink poptart.


void setup() {
  
  rectMode(CENTER);
  size (500,600);
  smooth();
  noStroke();
  
  // Randomly generated backgroud with for loop  

    background(1, 36, 69);
  
    for(float diameter = 10.0; diameter > 1.0; diameter -= .1)
     { fill(255);
       ellipse(random(0,600),random(0,600), diameter, diameter);
     }

  //Nyan Cat summoning rectangle
    fill(228, 122, 194);
    rect(250,300, 10,10);
  
}

// Click for ellipses

 void mousePressed() {
   
    //Nyan Cat
      if(mouseY<=305 && mouseY>=295 && mouseX >=245 && mouseX <=255) {
        fill(217, 174, 125);
        rect(250,300, 210,160);
        fill(228, 122, 194);
        rect(250,300, 190,140);
        for( int x = 0;  x <40; x += 1)
        {fill(224, 16, 173);
        rect(random(165,345), random(230, 370), 7,7);
        } 
       
      }
   
    // Red ellipses
      if( mouseY <= 100) {
      fill(255, 0, 0);
      ellipse(mouseX,mouseY, 20,10);
      }
    
    // Orange ellipses
      if( mouseY >= 100 && mouseY < 200) {
      fill(243, 173, 25);
      ellipse(mouseX,mouseY, 40,20);
      }
      
    // Yellow ellipses
      if( mouseY >= 200 && mouseY < 300) {
      fill(255, 255, 0);
      ellipse(mouseX,mouseY, 60,30);
      }
      
    // Green ellipses
      if( mouseY >= 300 && mouseY < 400 && !(mouseY<=305 && mouseY>=295 && mouseX >=245 && mouseX <=255)) {
      fill(27, 252, 16);
      ellipse(mouseX,mouseY, 60,30);
      }
    
    // Blue ellipses
      if(mouseY >= 400 && mouseY < 500) {
      fill(0, 0, 255);
      ellipse(mouseX,mouseY, 40,20);
      }
        
    // Purple ellipses
      if( mouseY >= 500) {
      fill(87, 70, 152);
      ellipse(mouseX,mouseY, 20,10);
      }
 } 



void draw() {
}


// Key press eraser

void keyPressed() {
      background(1, 36, 69);
  
    for(float diameter = 10.0; diameter > 1.0; diameter -= .1)
     { fill(255);
       ellipse(random(0,600),random(0,600), diameter, diameter);
     }

  //Nyan Cat summoning rectangle
    fill(228, 122, 194);
    rect(250,300, 10,10);
  
}
