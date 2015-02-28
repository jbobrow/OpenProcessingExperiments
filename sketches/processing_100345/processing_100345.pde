
int counter = 0; 
// counter will function as timer
int step = 0;
// step will track which state light(s) are in

void setup() {
  size(200,200);
}

void draw() {

  // using functions to keep draw nice and simple
  background(0);
  advanceCounter();
  drawLight();
  drawFlashingGreen();
}

void advanceCounter() {
  // main logic for state machine  
  counter++;
  if (counter==200) {
    counter=0;
    step=0;
  } else if (counter==50) {
    step=1;
  } else if (counter==70) {
    step=2;
  }  
}


void drawLight(){
  // draw the light based on what step it is on
  // draws the red light as an 'empty' circle when unlit
  // draws yellow and green only when on
  
  fill(100);
  rect(10,10,40,100);
  
  // red light
  // draws an 'empty' light if not on
  if (step==2) {
    fill(255,0,0);
  } else {
    fill(100);
  }
  ellipse(30,30,20,20);
  
  // yellow light
  // just draws it if it is on
 if (step==1) {
    fill(#EEF22C); // just pulled yellow from colour selector
    ellipse(30,60,20,20);
  }  
  
  
  // green light
  if (step==0) {
    fill(0,255,0);
    ellipse(30,90,20,20);
  }
}


void drawFlashingGreen() {
  // use existing counter and step to 
  // draw a flashing green
  
  // counter/10%2 - divides counter by 10 and returns integer
  // and then sees if there is a remainder
  // when divided by 2
  // so: 70-79 will be 1, 80-89 will be 0, etc.
  
  fill(0,255,0);
  if (step==2 && round(counter/10)%2==0) {
    ellipse(60,90,20,20);  
  }

}


