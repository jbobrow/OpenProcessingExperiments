
PImage[] buttons;
PImage backImage;
int selButton = 0;
int a = 20;
void setup(){
  size( 1000, 630 );
  

  
  buttons = new PImage[6];
  buttons[0] = loadImage("pacman01.png");
  buttons[1] = loadImage("pacman02.png");
  buttons[2] = loadImage("pacman03.png");
  buttons[3] = loadImage("pacman04.png");
  buttons[4] = loadImage("pacman05.png");
  buttons[5] = loadImage("pacman06.png");

  
  // This is just a white circle to use as an eraser
  background(0);
  smooth(); 
  stroke(#2B0AF0); 
  strokeWeight(3); 
  strokeJoin(ROUND); 
  fill(0);
  rect(260, 70, 730, 520);//big white rect 
  rect(580,310,90,60);
  rect(450,300,15,80);
  rect(770,300,15,80);
  rect(340,130,70,50);
  rect(500,130,70,50);
  rect(675,130,70,50);
  rect(815,130,70,50);
  rect(340,475,70,50);
  rect(500,475,70,50);
  rect(675,475,70,50);
  rect(815,475,70,50);
  noStroke();
  fill(255);
  ellipse(285,103,7,7);
  ellipse(285+a,103,7,7);
  ellipse(285+a+a,103,7,7);
  ellipse(285+a+a+a,103,7,7);
  ellipse(285+a+a+a+a,103,7,7);
  ellipse(285+a+a+a+a+a,103,7,7);
  ellipse(285+a+a+a+a+a+a,103,7,7);
  ellipse(285+a+a+a+a+a+a+a,103,7,7);
  ellipse(285+a+a+a+a+a+a+a+a,103,7,7);
  ellipse(285+a+a+a+a+a+a+a+a+a,103,7,7);
  ellipse(285+a+a+a+a+a+a+a+a+a+a,103,7,7);
  ellipse(285+a+a+a+a+a+a+a+a+a+a+a,103,7,7);
  ellipse(285+a+a+a+a+a+a+a+a,103+a,7,7);
  ellipse(285+a+a+a+a+a+a+a+a,103+a+a,7,7);
  ellipse(285+a+a+a+a+a+a+a+a,103+a+a+a,7,7);
  ellipse(285+a+a+a+a+a+a+a+a,103+a+a+a+a,7,7);
  ellipse(285+a+a+a+a+a+a+a+a,103+a+a+a+a+a,7,7);
  ellipse(285+a+a+a+a+a+a+a+a,103+a+a+a+a+a+a,7,7);
  
}
void draw() {
  
  

  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 260) {
      // ...inside menu area, need to check which button is being pressed:
      if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 0;
      else if (20 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 240) selButton = 1;
      else if (20 < mouseX && mouseX < 120 && 260 < mouseY && mouseY < 360)  selButton = 2;
      else if (140 < mouseX && mouseX < 240 && 140 < mouseY && mouseY < 240)  selButton = 3;
      else if (140 < mouseX && mouseX < 240 && 260 < mouseY && mouseY < 360)  selButton = 4;
      else if (20 < mouseX && mouseX < 120 && 380 < mouseY && mouseY < 480)  selButton = 5;

       
      
      
      
      
      
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(0);
  rect(0, 0, 200, height);
  image(buttons[0], 20, 20);
  image(buttons[1], 20, 140);
  image(buttons[2], 20, 260);  
  image(buttons[3],140,140);
  image(buttons[4],140,260);
  image(buttons[5],20,380);


  //Draw outline around selected button:
 // noFill();
  //stroke(120);
  //if (selButton == 0) rect(20, 20, 100, 100);
  //else if (selButton == 1) rect(20, 140, 100, 100);
  //else if (selButton == 2) rect(20, 260, 100, 100);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}


