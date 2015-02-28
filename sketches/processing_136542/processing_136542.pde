
int myState = 0;
PFont sans;
PImage hawks1;
PImage hawks2;
PImage hawks3;
PImage hawks4;
PImage hawkschamps1;
int x = 0;

void setup() {
  size(500, 500);

sans = createFont("Viga-Regular.ttf", 200);
hawks1 = loadImage("hawks1.png");
hawks2 = loadImage("hawks2.png");
hawks3 = loadImage("hawks3.png");
hawks4 = loadImage("hawks4.png");
hawkschamps1 = loadImage("hawkschamps1.png");
}

void draw() {
  
  background(100);
  
  switch(myState) {
    
    case 0:
    image(hawks1, 0, 0);
    break;
    
    case 1:
    image(hawks1, 0, 0);
    textFont(sans, 35);
    text("Hawks Win Series 4 - 1", x, 250);
    x = x + 3;
    if (x > width) {
      x = -300;
    }
    break;
    
    case 2:
    image(hawks2, 0, 0);
    break;
   
    case 3:
    image(hawks2, 0, 0);
    textFont(sans, 35);
    text("Hawks Win Series 4 - 3", x, 250);
    x = x + 3;
    if (x > width) {
      x = -300;
    }
    break;
    
    case 4:
    image(hawks3, 0, 0);
    break;
    
    case 5:
    image(hawks3, 0, 0);
    textFont(sans, 35);
    text("Hawks Win Series 4 - 1", x, 250);
    x = x + 3;
    if (x > width) {
      x = -300;
    }
    break;
    
    case 6:
    image(hawks4, 0, 0);
    break;
    
    case 7:
    image(hawks4, 0, 0);
    textFont(sans, 35);
    text("Hawks Win Series 4 - 2", x, 250);
    x = x + 3;
    if (x > width) {
      x = -300;
    }
    break;
    
    case 8:
    image(hawkschamps1, 0, 0);
    break;

  }
}

void mousePressed() {
  myState = (myState + 1);
  if (myState > 8) {
    myState = 0;
  }
}


