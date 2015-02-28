
/*
  TubeLand 
  ~little interactive app by Mary Scahill~ 
  
  ** Click on a color (does not have to be one of the "tiles") = a randomly sized tube will
     fall from the top of the screen in the color you selected.  
  ** Spacebar = invert colors
  ** Click and drag = two things happen:
        1) Colors are selected in "realtime" and applied to falling tube (no stroke)
        2) Blur affect is applied to the window
  ** X (or x) key = refreshed the screen 
*/
  




//These were just used to make the tiles for the palette
int colorSqH=20;
int colorSqW=20;

//user interaction stuff
boolean clicked=false;
boolean dragged=false;

//to store mouse-selected colors
color c;
color tempColor;

//to generate random-ish circles which created tubes
float xrand; 
float ellipseSz;
int fall = 0;
int move = 5;

void setup() {
  size(500,500);
  background(253);
    frameRate(30);

}  
void draw () {
  smooth();
  int cSqOver=80;// tile offset from left
  stroke(255);

if(clicked) {
  if(dragged) {
    noStroke();
    filter(BLUR, .6);//blur when dragged
    tempColor = get(mouseX, mouseY);//placing here makes the color apply in realtime
    fill(tempColor);
  }else{
  fill(c, 30);
  }
  ellipse(xrand, fall, ellipseSz, ellipseSz+1);
  fall+=move;
  if(fall >= height) {
    clicked=false;
    fall=move;
  }

}
 fill(175);
      strokeWeight(10);
      stroke(200,50);
 rect(60, 20, 380, 60, 10);
    for (int i=0; i<9; i++) {
      strokeWeight(2);
      stroke(250,200);
      switch(i) {
        case 0: fill (255, 0, 0);
          break;
        case 1: fill (255, 175, 0);
           break;         
        case 2: fill (255, 255, 0);
           break;
        case 3: fill(0,255,0);
           break;
        case 4: fill (0,255,175);
           break;         
        case 5: fill (0,175,255);
           break;
        case 6: fill(0,0,255);
           break; 
        case 7: fill(175,0,255);
           break;         
        case 8: fill(255,0,255);
           break;
      }
      rect(cSqOver,40,colorSqH,colorSqH, 5);
      cSqOver=cSqOver+40;
       } 
      
}
  
void mouseClicked() {
clicked=true;
c = get(mouseX, mouseY);
xrand = random(60,440); 
ellipseSz = random(5,300);
}

void mouseDragged() {
dragged=true;  
}

void mouseReleased() {
  dragged=false;
}

void keyPressed() {
  if (key == ' ') {
    filter(INVERT);
  }
  if (key == 'x' || key == 'X') {
    setup();
  } 
}
