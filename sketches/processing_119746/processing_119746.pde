

int imageMode = 2; // selects which image is being shown
int timer = 0; // control how long second image runs for



void setup() {}

void draw() {
  background(0);

  // timer code - count down  
  if (timer > 0) {
    timer--;
  } else if (timer ==0) {
    // timer counted down - change back to image 1
    imageMode = 1;
  }


  // image selector based on imageMode
  if (imageMode == 1) {
  
    drawImageOne(); // call drawing function
      
  } else {
    
    drawImageTwo();
  
  }
  
  
}


void mousePressed() {

  if (imageMode == 1) {
    imageMode = 2;
    timer = 100;    
  } 
}
  


// drawing functions

void drawImageOne() {
  rect(10,10,10,10);
}

void drawImageTwo() {
  ellipse(10,10,10,10);



}

