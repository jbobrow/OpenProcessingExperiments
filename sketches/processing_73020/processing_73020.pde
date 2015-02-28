
void setup() {
  size(600, 900);
  smooth();
}

//variables for the two moving parts: the bouncing ball and the moving green line

float numy=0;
float speedy=10;
float gravity = 0.9;

float numx=0;
float speedx=5;

float numb=0;
float speedb=second()/12;

void draw () {
  
  background(234, 204, 118);  

  //effects the movement of the ball
  numy = numy + speedy; 
  speedy = speedy + gravity;
  numx = numx + speedx; 
  
  //effect the movement of the green line
  numb = numb + speedb;


//conditionals for the bouncing ball
  noStroke();
  fill(250, 141, 33);
  ellipse(numx, 625+numy, 80, 80);
  
    if (numy > 300) {//if circles reaches right edge of screen
      //circle jumps to the left
      speedy = -speedy * 0.95;
    }
  
    if (numx > 600) {//if circle reaches bottom edge of screen
      //circle jumps up
      speedx = -speedx;
    }
  
    if (numy < 0) {//if circle reaches the left edge
      //circle jumps to right side
      speedy = -speedy;
    }
  
    if (numx < 0) {//if circle reaches the top edge of screen
      //circle falls down
      speedx = -speedx;
    } 
  
//here are the two non-moving parts in the screen

  //the thin brown line
  stroke(70, 20, 0);
  strokeWeight(7);
  line(600, 400, 250, 900);


  //the red rectangle in the bottom right corner
  strokeCap(SQUARE);
  stroke(180, 20, 16);
  strokeWeight(80);
  line(535, 700, 440, 825);
  
//the moving green line 
  stroke(35, 80, 10);
  strokeWeight(20);
  line(numb, 400, 85+numb, 750);
  
  if (numb > width) {//if the line reaches the right each it return to the left side of the screen
      numb = 0;
  }
    

//here are the four rectangles clusterd at the top
  
    if(mouseY < 300) {//if you move you mouse to the top third of the screen the cluster of shapes explodes in different directions
      stroke(0, 0, 0);
      strokeWeight(165);
      line(100, 60, -115, 250);
    
      stroke(35, 80, 10);
      strokeWeight(25);
      line(150, 520, 265, 418);
      line(410, 300, 645, 95);
    
      stroke(180, 20, 16);
      strokeWeight(45);
      line(485, 452, 535, 510);
    }

    else {
      stroke(0, 0, 0);
      strokeWeight(165);
      line(300, 60, 85, 250);
    
      stroke(35, 80, 10);
      strokeWeight(25);
      line(150, 320, 265, 218);
      line(210, 300, 445, 95);
    
      stroke(180, 20, 16);
      strokeWeight(45);
      line(285, 252, 335, 310);
    }
  }
