

/* @pjs font="ufonts.com_gotham-light.ttf"; */

int myState = 0 ;

PImage  render1 ;
PImage  render2 ;
PImage  render3 ;
PImage  render4 ;
PImage  render5 ;

PFont black ;
PFont light ;

void setup() {  
  size(960, 540);
  smooth();
  noStroke();

  render1 = loadImage("new_render_1.png") ;
  render2 = loadImage("new_render_2.png") ;
  render3 = loadImage("new_render_3.png") ;
  render4 = loadImage("new_render_4.png") ;
  render5 = loadImage("Jamie_Waxberg_render_3.png") ;

  black = createFont("ufonts.com_gotham-black.ttf", 36) ;
  light = createFont("ufonts.com_gotham-light.ttf", 20) ;
}

void draw() {
  background(150);

  switch(myState) {

  case 0:
    image(render1, 0, 0) ;
    fill(250, 60);
    rect(65, 45, 180, 63);
    fill(250);
    textFont(light, 30);
    text("Root Tree", 75, 75) ;
    textFont(light, 21) ;
    text("Jamie Waxberg", 75, 97) ;
    textFont(light, 14) ;
    text("Click to see different renders", 55, 125) ;

    break; 

  case 1:
    image(render2, 0, 0) ;
    fill(250, 60);
    rect(65, 45, 180, 63);
    fill(250);
    textFont(light, 30);
    text("Root Tree", 75, 75) ;
    textFont(light, 21) ;
    text("Jamie Waxberg", 75, 97) ;
    break; 

  case 2:
    image(render3, 0, 0) ;
    fill(250, 60);
    rect(65, 45, 180, 63);
    fill(250);
    textFont(light, 30);
    text("Root Tree", 75, 75) ;
    textFont(light, 21) ;
    text("Jamie Waxberg", 75, 97) ;
    break; 

  case 3:
    image(render4, 0, 0) ;
    fill(250, 60);
    rect(50, 28, 180, 63);
    fill(250);
    textFont(light, 30);
    text("Root Tree", 60, 60) ;
    textFont(light, 21) ;
    text("Jamie Waxberg", 60, 82) ;
    break; 

  case 4:
    image(render5, 0, 0) ;
    fill(250, 60);
    rect(65, 45, 180, 63);
    fill(250);
    textFont(light, 30);
    text("Root Tree", 75, 75) ;
    textFont(light, 21) ;
    text("Jamie Waxberg", 75, 97) ;
    break;
  }
}

void mousePressed() {
  myState = myState + 1 ;

  if (myState > 4) {
    myState = 0 ;
  }
}



