
/* @pjs preload="franks.jpg", "birds.jpg", "details.jpg", "chairs.jpg", "greens.jpg", "ornaments.jpg", "windows.jpg", font="BodoniXT.ttf"; */

int myState = 0;
int myCounter = 0;
PFont bodoni;

PImage windows;
PImage ornament;
PImage greens;
PImage chair;
PImage frank;
PImage detail;
PImage bird;

void setup() {
  size(500, 500);
  frank = loadImage ("franks.jpg");
  chair = loadImage ("chairs.jpg");
  greens = loadImage ("greens.jpg");
  ornament = loadImage ("ornaments.jpg");
  windows = loadImage ("windows.jpg");
  detail = loadImage ("details.jpg");
  bird = loadImage ("birds.jpg");
  bodoni = createFont("BodoniXT.ttf", 50);
}

void draw(){
  textAlign(CENTER, CENTER);
  
  switch(myState) {
   case 0:
   background(0, 0, 0);
   textFont (bodoni, 20);
   text("Frank Lloyd Wright", width/2, 225);
   text("Oak Park Home Tour", width/2, height/2);
   text("(Click to navigate)", width/2, 275);
   text("Kim Kizyma", width/2, 300);
   break ;
    
    case 1:
    image(frank, 0, 0);
    break ;
    
    case 2:
    image(windows, 0, 0);
    break ;
    
    case 3:
    image(chair, 0, 0);
    break ;
    
    case 4:
    image(green, 0, 0);
    break ;
    
    case 5:
    image(ornament, 0, 0);
    break;
    
    case 6:
    image(detail, 0, 0);
    break;
    
    case 7:
    image(bird, 0, 0);
    break;
    
    case 8:
    background(0, 0, 0);
    break;
  }
}

void mousePressed() {
  myState = myState + 1;
  if (myState > 8) {
    myState = 0;
  }
}



