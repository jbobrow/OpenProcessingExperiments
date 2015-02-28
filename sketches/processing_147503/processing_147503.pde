
PImage img;
PImage menu;

float r=0;
float g=100;
float b=100;

float opacity;
float dia=50;


boolean eraser= false;
boolean circles=true;
boolean squares=false;
boolean squareLines=false;
boolean circleLines=false;

void setup() {
  size(800, 650);
  background(17, 5, 52);
  smooth();
  menu= loadImage("menu.png");
}

void draw() {

  if (mousePressed && eraser && mouseY>50) { // eraser button
    erase();
  }


  image(menu, 0, 0);
}
void mouseClicked() {

  if (mouseY<50) {// allows brushs to not draw behind the menu
    opacity=0;
    eraser=false;
    circles=false;
    squares=false;
    squareLines=false;
    circleLines=false;

    if (mouseX>50 && mouseX<85) {//circle
      circles=true;
    }

    else if (mouseX> 125 && mouseX<160) {//circlelines
      circleLines=true;
    }
    else if (mouseX>225 && mouseX<260) {//square
      squares=true;
    }
    else if (mouseX>300 && mouseX<330) {//square lines
      squareLines=true;
    }
    else if (mouseX>400 && mouseX< 440) {//eraser
      eraser= true;
    }
    else if (mouseX> 580 && mouseX<650) {//reset
      reset();
    }  

    else if (mouseX>690 && mouseX<750) {//save
      saveDrawing();
    } 
    else {
    }
  }
  else {
    makeShapes();
  }
}



void saveDrawing() {
  fill(17, 5, 52);//cover menu
  rect(0, 0, 800, 50);

  saveFrame("images/watercolor_symmetry-###.png"); //it should open the image in a new tab on web
}

void makeShapes() {


  callColor();
  if (circles) {
    makeCircle();
  }
  else if (squares) {
    makeSquares();
  }
  else if (squareLines) {
    squareLines2();
  }
  else if (circleLines) {

    circleLines2();
  }
  noStroke();
  fill(17, 5, 52);

  rect(0, 0, 50, 650);//borders
  rect(0, 600, 800, 50);
  rect(750, 0, 50, 650);
}

void callColor() {
  noStroke(); 
  fill(r, g, b, opacity);
  r=random(50, 100);
  g=random(20, 80);
  b=random(100, 150);
  opacity=random(50, 150);
  dia=random(10, 100);
}

void makeCircle() {
  ellipse(mouseX, mouseY, dia, dia);
  ellipse(mouseX, height-mouseY, dia, dia); // the height- and width- allows it to be mirrored on the x and y axis
  ellipse(width-mouseX, mouseY, dia, dia);
  ellipse(width-mouseX, height-mouseY, dia, dia);
}

void makeSquares() {


  rectMode(CENTER);
  rect(mouseX, mouseY, dia, dia);
  rect(mouseX, height-mouseY, dia, dia); // the height- and width- allows it to be mirrored on the x and y axis
  rect(width-mouseX, mouseY, dia, dia);
  rect(width-mouseX, height-mouseY, dia, dia);
}

void erase() {
  eraseColor();

  drawEraser();
}

void eraseColor() {
  noStroke ();

  opacity=random(0, 100);
  fill(17, 5, 52, opacity);

  dia=50;
}

void drawEraser() {
  ellipse(mouseX, mouseY, dia, dia);
  ellipse(mouseX, height-mouseY, dia, dia); // the height- and width- allows it to be mirrored on the x and y axis
  ellipse(width-mouseX, mouseY, dia, dia);
  ellipse(width-mouseX, height-mouseY, dia, dia);
}

void circleLines2() {

  noFill();
  opacity=random(50, 150); 
  stroke(r, g, b, opacity);
  strokeWeight(1);
  r=random(50, 100);
  g=random(20, 80);
  b=random(100, 150);

  dia=random(10, 100);  

  ellipse(mouseX, mouseY, dia, dia);
  ellipse(mouseX, height-mouseY, dia, dia); // the height- and width- allows it to be mirrored on the x and y axis
  ellipse(width-mouseX, mouseY, dia, dia);
  ellipse(width-mouseX, height-mouseY, dia, dia);
}

void squareLines2() {
  noFill(); 
  opacity=random(50, 150);
  stroke(r, g, b, opacity);
  strokeWeight(1);
  r=random(50, 100);
  g=random(20, 80);
  b=random(100, 150);

  dia=random(10, 100);  

  rect(mouseX, mouseY, dia, dia);
  rect(mouseX, height-mouseY, dia, dia); // the height- and width- allows it to be mirrored on the x and y axis
  rect(width-mouseX, mouseY, dia, dia);
  rect(width-mouseX, height-mouseY, dia, dia);
}

void reset() {
  background(17, 5, 52);
  circles=true;
}



