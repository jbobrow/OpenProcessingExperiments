
PFont myFont;
PImage myPic; 

void setup() 
{
  myPic = loadImage("Alice_devant_un_lac_glitch.png");
  myFont = loadFont("HelveticaNeue-Bold-38.vlw");
  textAlign(CENTER);
  rectMode(CENTER);
  noStroke();
  size(680, 522);
  smooth();
}

void draw()
{
  set(0, 0, myPic);

  // SKY PART 1
  if (mouseX > 0 && mouseX <= 70 && mouseY > 0 && mouseY < 40 )
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 60, 25);
    textFont(myFont, 38);
    fill(pix);
    text("sky", mouseX-1, mouseY+10);
  }

  // SKY PART 2
  if (mouseX > 190 && mouseX <= 340 && mouseY > 0 && mouseY < 40 )
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 60, 25);
    textFont(myFont,38);
    fill(pix);
    text("sky", mouseX-1, mouseY+10);
  }

  // SKY PART 3
  if (mouseX > 430 && mouseX <= myPic.width && mouseY > 0 && mouseY < 40 )
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 60, 25);
    textFont(myFont, 38);
    fill(pix);
    text("sky", mouseX-1, mouseY+10);
  }

  // SKY PART 4
  if (mouseX > 0 && mouseX <= 560 && mouseY >= 40 && mouseY < 65 )
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 60, 25);
    textFont(myFont, 38);
    fill(pix);
    text("sky", mouseX-1, mouseY+10);
  }

  // SKY PART 5
  if (mouseX > 0 && mouseX <= 120 && mouseY >= 65 && mouseY < 95 )
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 60, 25);
    textFont(myFont,38);
    fill(pix);
    text("sky", mouseX-1, mouseY+10);
  }

  // SKY PART 6
  if (mouseX > 200 && mouseX <= 560 && mouseY >= 65 && mouseY < 95 )
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 60, 25);
    textFont(myFont, 38);
    fill(pix);
    text("sky", mouseX-1, mouseY+10);
  }

  // SKY PART 7
  if (mouseX > 560 && mouseX <= myPic.width && mouseY >= 75 && mouseY < 95 )
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 60, 25);
    textFont(myFont, 38);
    fill(pix);
    text("sky", mouseX-1, mouseY+10);
  }

  // SKY PART 8
  if (mouseX > 640 && mouseX <= myPic.width && mouseY >= 40 && mouseY < 95 )
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 60, 25);
    textFont(myFont, 38);
    fill(pix);
    text("sky", mouseX-1, mouseY+10);
  }

  // SKY PART 9
  if (mouseX > 0 && mouseX <= myPic.width && mouseY >= 95 && mouseY < 130 )
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 60, 25);
    textFont(myFont, 38);
    fill(pix);
    text("sky", mouseX-1, mouseY+10);
  }

  // SKY PART 10
  if (mouseX > 490 && mouseX <= 580 && mouseY >= 130 && mouseY < 165 )
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 60, 25);
    textFont(myFont, 38);
    fill(pix);
    text("sky", mouseX-1, mouseY+10);
  }

  // SKY PART 11
  if (mouseX > 140 && mouseX <= 310 && mouseY >= 130 && mouseY < 150 )
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 60, 25);
    textFont(myFont, 38);
    fill(pix);
    text("sky", mouseX-1, mouseY+10);
  }

  // CLOUD 1
  if (mouseX > 70 && mouseX <= 190 && mouseY > 0 && mouseY < 40)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 94, 25);
    textFont(myFont, 38);
    fill(pix);
    text("cloud", mouseX-2, mouseY+10);
  }

  // CLOUD 2
  if (mouseX > 340 && mouseX <= 430 && mouseY > 0 && mouseY < 40)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 94, 25);
    textFont(myFont,38);
    fill(pix);
    text("cloud", mouseX-2, mouseY+10);
  }

  // CLOUD 3
  if (mouseX > 120 && mouseX <= 200 && mouseY >= 65 && mouseY < 95)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 94, 25);
    textFont(myFont,38);
    fill(pix);
    text("cloud", mouseX-2, mouseY+10);
  }

  // CLOUD 4
  if (mouseX > 560 && mouseX <= 640 && mouseY >= 40 && mouseY < 75)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 94, 25);
    textFont(myFont, 38);
    fill(pix);
    text("cloud", mouseX-2, mouseY+10);
  }

  // TREES PART 1
  if (mouseX > 0 && mouseX <= 140 && mouseY >= 130 && mouseY < 270)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 90, 25);
    textFont(myFont,38);
    fill(pix);
    text("trees", mouseX, mouseY+10);
  }

  // TREES PART 2
  if (mouseX > 140 && mouseX <= 310 && mouseY >= 150 && mouseY < 270)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 90, 25);
    textFont(myFont, 38);
    fill(pix);
    text("trees", mouseX, mouseY+10);
  }

  // TREES PART 3
  if (mouseX > 310 && mouseX <= 385 && mouseY >= 130 && mouseY < 205)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 90, 25);
    textFont(myFont, 38);
    fill(pix);
    text("trees", mouseX, mouseY+10);
  }

  // TREES PART 4
  if (mouseX > 385 && mouseX <= 490 && mouseY >= 130 && mouseY < 265)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 90, 25);
    textFont(myFont, 38);
    fill(pix);
    text("trees", mouseX, mouseY+10);
  }

  // TREES PART 5
  if (mouseX > 490 && mouseX <= 580 && mouseY >= 165 && mouseY < 265)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 90, 25);
    textFont(myFont,38);
    fill(pix);
    text("trees", mouseX, mouseY+10);
  } 

  // TREES PART 6
  if (mouseX > 580 && mouseX < myPic.width && mouseY >= 130 && mouseY < 265)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 90, 25);
    textFont(myFont, 38);
    fill(pix);
    text("trees", mouseX, mouseY+10);
  }

  // LAKE PART 1
  if (mouseX > 0 && mouseX <= 310 && mouseY >= 270 && mouseY < 295)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 25);
    textFont(myFont, 38);
    fill(pix);
    text("lake", mouseX, mouseY+10);
  }

  // LAKE PART 2
  if (mouseX > 405 && mouseX <= myPic.width && mouseY >= 265 && mouseY < 315)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 25);
    textFont(myFont, 38);
    fill(pix);
    text("lake", mouseX, mouseY+10);
  }

  // LAKE PART 3
  if (mouseX > 0 && mouseX <= 275 && mouseY >= 295 && mouseY < 320)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 25);
    textFont(myFont, 38);
    fill(pix);
    text("lake", mouseX, mouseY+10);
  }

  // LAKE PART 4
  if (mouseX > 405 && mouseX <= myPic.width && mouseY >= 315 && mouseY < 395)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 25);
    textFont(myFont, 38);
    fill(pix);
    text("lake", mouseX, mouseY+10);
  }

  // LAKE PART 5
  if (mouseX > 380 && mouseX <= 405 && mouseY >= 265 && mouseY < 295)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 25);
    textFont(myFont,38);
    fill(pix);
    text("lake", mouseX, mouseY+10);
  }

  // LAKE PART 6-1
  if (mouseX > 0 && mouseX <= 80 && mouseY >= 360 && mouseY < 370)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 25);
    textFont(myFont, 38);
    fill(pix);
    text("lake", mouseX, mouseY+10);
  }

  // LAKE PART 6-2
  if (mouseX > 80 && mouseX <= 150 && mouseY >= 355 && mouseY < 365)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 25);
    textFont(myFont, 38);
    fill(pix);
    text("lake", mouseX, mouseY+10);
  }

  // LAKE PART 7
  if (mouseX > 405 && mouseX < myPic.width && mouseY >= 395 && mouseY < 405)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 25);
    textFont(myFont, 38);
    fill(pix);
    text("lake", mouseX, mouseY+10);
  }


  // LAKE PART 8
  if (mouseX > 475 && mouseX < myPic.width && mouseY >= 405 && mouseY < 425)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 25);
    textFont(myFont, 38);
    fill(pix);
    text("lake", mouseX, mouseY+10);
  }

  // LAKE PART 9
  if (mouseX > 555 && mouseX < myPic.width && mouseY >= 425 && mouseY < 445)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 25);
    textFont(myFont, 38);
    fill(pix);
    text("lake", mouseX, mouseY+10);
  }

  // LAKE PART 10
  if (mouseX > 555 && mouseX < myPic.width && mouseY >= 445 && mouseY < 475)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 25);
    textFont(myFont, 38);
    fill(pix);
    text("lake", mouseX, mouseY+10);
  }

  // ALICE PART 1
  if (mouseX > 310 && mouseX <= 380 && mouseY >= 205 && mouseY < 295)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 82, 23);
    textFont(myFont, 38);
    fill(pix);
    text("alice", mouseX, mouseY +10);
  }

  // ALICE PART 2  
  if (mouseX > 275 && mouseX <= 405 && mouseY >= 295 && mouseY < myPic.height)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 82, 23);
    textFont(myFont, 38);
    fill(pix);
    text("alice", mouseX, mouseY +10);
  }

  // JETTY PART 1-1
  if (mouseX > 0 && mouseX <= 80 && mouseY >= 320 && mouseY < 360)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 28);
    textFont(myFont, 38);
    fill(pix);
    text("jetty", mouseX, mouseY +10);
  }

  // JETTY PART 1-2
  if (mouseX > 0 && mouseX <= 80 && mouseY >= 370 && mouseY < myPic.height)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 28);
    textFont(myFont, 38);
    fill(pix);
    text("jetty", mouseX, mouseY +10);
  }

  // JETTY PART 2-1
  if (mouseX > 80 && mouseX <= 150 && mouseY >= 330 && mouseY < 355)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 28);
    textFont(myFont, 38);
    fill(pix);
    text("jetty", mouseX, mouseY +10);
  }

  // JETTY PART 2-2
  if (mouseX > 80 && mouseX <= 150 && mouseY >= 365 && mouseY < myPic.height)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 28);
    textFont(myFont, 38);
    fill(pix);
    text("jetty", mouseX, mouseY +10);
  }

  // JETTY PART 3
  if (mouseX > 150 && mouseX <= 275 && mouseY >= 320 && mouseY < myPic.height)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 28);
    textFont(myFont, 38);
    fill(pix);
    text("jetty", mouseX, mouseY +10);
  }

  // JETTY PART 4
  if (mouseX > 405 && mouseX <= 480 && mouseY >= 405 && mouseY < myPic.height)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 28);
    textFont(myFont, 38);
    fill(pix);
    text("jetty", mouseX, mouseY +10);
  }

  // JETTY PART 5
  if (mouseX > 480 && mouseX <= 555 && mouseY >= 425 && mouseY < myPic.height)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 28);
    textFont(myFont, 38);
    fill(pix);
    text("jetty", mouseX, mouseY +10);
  }

  // JETTY PART 6
  if (mouseX > 555 && mouseX <= 615 && mouseY >= 445 && mouseY < myPic.height)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 28);
    textFont(myFont,38);
    fill(pix);
    text("jetty", mouseX, mouseY +10);
  }

  // JETTY PART 7
  if (mouseX > 615 && mouseX <= myPic.width && mouseY >= 470 && mouseY < myPic.height)
  {
    color pix = myPic.get(mouseX, mouseY);
    fill(255);
    rect(mouseX, mouseY, 74, 28);
    textFont(myFont,38);
    fill(pix);
    text("jetty", mouseX, mouseY +10);
  }
}



