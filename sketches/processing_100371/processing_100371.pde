
int counter = 0;
// counter will function as timer
int step = 0;
// step will track which state light(s) are in
 
int light_1x =0; 
int light_1y =0;
int light_2x =140;
int light_2y =80;
 
 
void setup() {
  size(200,200);
}
 
void draw() {
 
  // using functions to keep draw nice and simple
  background(0);
  advanceCounter();
  lightLogic();
  
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
 
 
void lightLogic() {
  // this routine decides what lights light up on each stop light based on the current step
   
  // left red light, right green
  if (step==0) {
    drawLight(light_1x,light_1y,0);
    drawLight(light_2x,light_2y,2);
     
  // both yellow - of course traffic lights don't really do this!
  } else if (step==1) {
    drawLight(light_1x,light_1y,1);
    drawLight(light_2x,light_2y,1);
     
  // left red light, right green
  } else if (step==2) {
    drawLight(light_1x,light_1y,2);
    drawLight(light_2x,light_2y,0);
  }
 
}
 
 
void drawLight(int x, int y, int light){
  // this draws a stop light, can be positioned by x,y coordinates
  // light variable decides which light is on:
  // red - 0, yellow - 1, green - 2
   
  fill(100);
  rect(x+10,y+10,40,100);
   
  // red light
  if (light==0) {
    fill(255,0,0);
    ellipse(x+30,y+30,20,20);
  }
   
  // yellow light
 if (light==1) {
    fill(#EEF22C); // just pulled yellow from colour selector
    ellipse(x+30,y+60,20,20);
  } 
   
  // green light
  if (light==2) {
    fill(0,255,0);
    ellipse(x+30,y+90,20,20);
  }
}

