
boolean button = false;
PShape fish;
PShape scales;
PShape bones;
PShape tank;
PShape fish2;
PShape bones2;
float xpos, ypos;
PShape bubbles;
float xspeed = 2.8;
float yspeed = 2.2;
int xdirection = 1;
int ydirection = 1;
float scalesR;
float scalesG; 
float scalesB; 
float diam;
float xbubble;
float ybubble;
int totalBubbles = 0;


void setup() {

  size (800,500);
  smooth();
  frameRate(25);
  fish = loadShape ("fish.svg");
  scales = loadShape ("scales.svg");
  bones = loadShape ("bones.svg");
  bubbles = loadShape ("bubbles.svg");
  tank = loadShape ("tank.svg");
  fish2 = loadShape ("fish2.svg");
  bones2 = loadShape ("bones2.svg");
  xpos = width/2;
  ypos = height/2;
  scales.disableStyle();
  
}

void draw() {
  shape(tank, 0, 0, 800, 500);
  //background (119,188,240);
   
   

//floating fish
  xpos = xpos + (xspeed * xdirection);
  ypos = ypos + (yspeed * ydirection);
  if ((xpos > width) || (xpos < 0)) {
    xdirection *= -1;
  }
  if (ypos > height || ypos < 0) {
    ydirection *= -1;
  }

  //transition from fish to bones
  if (button) {
    shape (bones, xpos/2, ypos/2, 450,700);
    //shape (bones2,xpos, ypos, 400, 300);
  }
  else {
    shape (fish, xpos/2, ypos/2, 450, 700); 
   //rainbow scales
    scalesR = random (255);
    scalesG = random (255);
    scalesB = random (255);
    noStroke ();
    fill (scalesR, scalesB, scalesG);
    shape (scales, xpos/2+150, ypos/2+140, 150, 200);

    fill (scalesR, scalesB, scalesG);
    shape (scales, xpos/2+150, ypos/2+120, 100, 150);

    fill (scalesR, scalesB, scalesG);
    shape (scales, xpos/2+150, ypos/2+180, 100, 150);
    
      //diam = random(200,300);
    //shape (bubbles, xpos/2+250, ypos/2+70, 300, 200);
    
     //shape (fish2, xpos+100, ypos+100, 250, 400); 
    
  }
xbubble = random (40);
ybubble = random (40);
if (mouseX > xpos/2 && mouseY > ypos/2){
  fill (227,243,250);
  
  //stroke(255);
  //strokeWeight (3);
  ellipse(xpos/2+400, ypos/2-30, xbubble+5, ybubble+5);
  ellipse(xpos/2+340, ypos/2+30, xbubble+20, ybubble+20);
  ellipse(xpos/2+390, ypos/2+120, xbubble-5, ybubble-5);
  //shape(bubbles, xpos/2+250, ypos/2+70, xbubble, 250);
  
 
}
  
}

void mousePressed() {
  if (mouseX > xpos/2 &&  mouseY > ypos/2) {
    button = !button;
  }
}


