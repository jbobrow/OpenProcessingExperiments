
int oldMouseX, oldMouseY;
int selectedColor;
PFont menuFont;
PFont brushOrBackgroundFont;
int brushOrBackground;
int theStrokeWeight;
int randomRed, randomGreen, randomBlue;
int strokeShape;
int brushOpacity;
int x1EllipseAuto=400;
int y1EllipseAuto=400;
int x2EllipseAuto=400;
int y2EllipseAuto=400;
int x3EllipseAuto=400;
int y3EllipseAuto=400;
int x4EllipseAuto=400;
int y4EllipseAuto=400;
int x1EllipseAutoVel;
int y1EllipseAutoVel;
int x2EllipseAutoVel;
int y2EllipseAutoVel;
int x3EllipseAutoVel;
int y3EllipseAutoVel;
int x4EllipseAutoVel;
int y4EllipseAutoVel;
int x1RectAuto=400;
int y1RectAuto=400;
int x2RectAuto=400;
int y2RectAuto=400;
int x3RectAuto=400;
int y3RectAuto=400;
int x4RectAuto=400;
int y4RectAuto=400;
int x1RectAutoVel;
int y1RectAutoVel;
int x2RectAutoVel;
int y2RectAutoVel;
int x3RectAutoVel;
int y3RectAutoVel;
int x4RectAutoVel;
int y4RectAutoVel;
color myPenStroke;
color backgroundColor;
boolean fatOrThin=false;
boolean eraserTripped=false;
boolean randomColor=false;
boolean opacityChange=false;
boolean autodraw=false;
boolean drawing=false;
PImage eraserIcon;

void setup() {
  size(800, 800);
  smooth();
  brushOrBackground=0;
  oldMouseX=0;
  oldMouseY=0;
  selectedColor=1;
  brushOpacity=255;
  myPenStroke=color(0, 0, 0, brushOpacity);
  backgroundColor=color(255, 255, 255);
  background(255);
  menuFont=loadFont("menu_deco_nash.vlw");
  brushOrBackgroundFont=loadFont("menu_deco_nash_14.vlw");
  theStrokeWeight=1;
  strokeShape=0;
  eraserIcon=loadImage("Eraser_icon.gif");
  x1EllipseAutoVel=int(random(-20, 20));
  y1EllipseAutoVel=int(random(-20, 20));
  x2EllipseAutoVel=int(random(-20, 20));
  y2EllipseAutoVel=int(random(-20, 20));
  x3EllipseAutoVel=int(random(-20, 20));
  y3EllipseAutoVel=int(random(-20, 20));
  x4EllipseAutoVel=int(random(-20, 20));
  y4EllipseAutoVel=int(random(-20, 20));
}

void draw() {
  stroke(myPenStroke, brushOpacity);
  strokeWeight(theStrokeWeight);

  //background changing code
  if (brushOrBackground==2) {
    background(myPenStroke);
  }

  //detects if the user is drawing
  if (mousePressed && mouseX>150 && mouseX <=800 && mouseY >45 && mouseY<65) {
    drawing=true;
  }

  if (mousePressed && mouseY>65 && mouseY<=800) {
    drawing=true;
  }

  //drawing code
  if (mousePressed && brushOrBackground==0) {
    if (strokeShape==0) {
      if (oldMouseX != mouseX || oldMouseY != mouseY) {
        line(mouseX, mouseY, oldMouseX, oldMouseY);
      }
    }
    if (strokeShape==1) {
      if (oldMouseX != mouseX || oldMouseY != mouseY) {
        rect(mouseX+(theStrokeWeight/2), mouseY+(theStrokeWeight/2), theStrokeWeight, theStrokeWeight);
      }
    }
    if (strokeShape==2) {
      if (oldMouseX != mouseX || oldMouseY != mouseY) {
        triangle(mouseX-(theStrokeWeight/2), mouseY+(theStrokeWeight/2), mouseX, mouseY-(theStrokeWeight/2), mouseX+(theStrokeWeight/2), mouseY+(theStrokeWeight/2));
      }
    }
  }
  oldMouseX=mouseX;
  oldMouseY=mouseY;

  //Buttons container
  strokeWeight(1);
  fill(200);
  stroke(200);
  rect(0, 0, 800, 45);
  stroke(0);
  line(0, 45, 800, 45);

  //autodraw
  stroke(0);
  fill(255);
  rect(0, 45, 150, 20);
  textFont(brushOrBackgroundFont, 10);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Autodraw", 0, 45, 150, 20);
  if (drawing==false && mousePressed && mouseX>0 && mouseY<150 && mouseY>45 && mouseY<65) {
    autodraw=true;
    brushOrBackground=-1;
  }
  if (autodraw==true) {
    stroke(myPenStroke);
    fill(myPenStroke);
    if (theStrokeWeight==1) {
      theStrokeWeight=2;
    }
    ellipse(x1EllipseAuto, y1EllipseAuto, theStrokeWeight, theStrokeWeight);
    ellipse(x2EllipseAuto, y2EllipseAuto, theStrokeWeight, theStrokeWeight);
    ellipse(x3EllipseAuto, y3EllipseAuto, theStrokeWeight, theStrokeWeight);
    ellipse(x4EllipseAuto, y4EllipseAuto, theStrokeWeight, theStrokeWeight);
    x1EllipseAuto += x1EllipseAutoVel;
    y1EllipseAuto += y1EllipseAutoVel;
    x2EllipseAuto += x2EllipseAutoVel;
    y2EllipseAuto += y2EllipseAutoVel;
    x3EllipseAuto += x3EllipseAutoVel;
    y3EllipseAuto += y3EllipseAutoVel;
    x4EllipseAuto += x4EllipseAutoVel;
    y4EllipseAuto += y4EllipseAutoVel;

    if (x1EllipseAuto>width || x1EllipseAuto < 0) {
      x1EllipseAutoVel *= -1;
    }
    if (y1EllipseAuto > height || y1EllipseAuto< 45) {
      y1EllipseAutoVel *= -1;
    }
    if (x2EllipseAuto>width || x2EllipseAuto < 0) {
      x2EllipseAutoVel *= -1;
    }
    if (y2EllipseAuto > height || y2EllipseAuto< 45) {
      y2EllipseAutoVel *= -1;
    }
    if (x3EllipseAuto>width || x3EllipseAuto < 0) {
      x3EllipseAutoVel *= -1;
    }
    if (y3EllipseAuto > height || y3EllipseAuto< 45) {
      y3EllipseAutoVel *= -1;
    }
    if (x4EllipseAuto>width || x4EllipseAuto < 0) {
      x4EllipseAutoVel *= -1;
    }
    if (y4EllipseAuto > height || y4EllipseAuto< 45) {
      y4EllipseAutoVel *= -1;
    }
    if (mouseX>0 && mouseY<150 && mouseY>45 && mouseY<65) {
      fill(255, 0, 0);
      rect(0, 45, 150, 20);
      textFont(brushOrBackgroundFont, 10);
      textAlign(CENTER, CENTER);
      fill(0);
      text("Move or release to stop", 0, 45, 150, 20);
      if (mousePressed) {
        autodraw=false;
      }
    }
  }


  //brush or background: 0 is brush, 1 and 2 are background, 1 is used to delay background set when background button is pushed
  fill(255);
  if (mousePressed && drawing==false && mouseX>325 && mouseX<400 && mouseY>0 && mouseY<22) {
    brushOrBackground=0;
  }
  if (mousePressed && drawing==false && mouseX>325 && mouseX<400 && mouseY>22 && mouseY<44) {
    brushOrBackground=1;
    eraserTripped=false;
  }
  if (brushOrBackground==0) {
    rect(325, 0, 75, 22);
  }
  else if (brushOrBackground >= 1) {
    rect(325, 22, 75, 22);
  }
  textFont(brushOrBackgroundFont, 10);
  stroke(0);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Brush", 325, 0, 75, 22);
  text("Background", 325, 22, 75, 22);

  //random color generator
  if (mousePressed && drawing==false && mouseX>275 && mouseX<323 && mouseY>0 && mouseY<44) {
    randomColor=true;
    randomRed=int(random(255));
    randomGreen=int(random(255));
    randomBlue=int(random(255));
    selectedColor=0;
    myPenStroke=color(randomRed, randomGreen, randomBlue);
    if (brushOrBackground==1) {
      brushOrBackground=2;
    }
  }
  if (brushOrBackground==2 && drawing==false) {
    backgroundColor=myPenStroke;
  }
  if (randomColor==true) {
    stroke(0);
    fill(255);
    rect(275, 0, 48, 44);
    fill(myPenStroke);
    rect(275, 30, 48, 14);
  }
  textAlign(CENTER, TOP);
  text("Random", 275, 0, 48, 30);
  textAlign(CENTER, BOTTOM);
  text("color", 275, 0, 48, 30);

  //eraser
  if (mousePressed && drawing==false && mouseX>0 && mouseX<50 && mouseY>0 && mouseY<50) {
    myPenStroke=backgroundColor;
    eraserTripped=true;
  }
  if (eraserTripped==true) {
    fill(255);
    stroke(0);
    rect(0, 0, 50, 44);
    randomColor=false;
  }
  image(eraserIcon, 0, 0);

  //fatter or thinner, fatOrThin determines if the stroke weight has been changed, true indicates a button has been pushed, and it must be reset by releasing the mouse
  //to change it again
  fill(255);
  strokeWeight(1);
  line(404, 0, 404, 44);
  if (adjustmentsButtons(415, 0, "+1") && fatOrThin==false && drawing==false) {
    fill(255);
    stroke(0);
    rect(405, 0, 25, 15);
    stroke(0);
    fill(0);
    textFont(brushOrBackgroundFont, 8);
    textAlign(CENTER, TOP);
    text("+1", 415, 0);
    theStrokeWeight ++;
    fatOrThin=true;
  }
  if (adjustmentsButtons(450, 0, "+10") && fatOrThin==false && drawing==false) {
    fill(255);
    stroke(0);
    rect(440, 0, 25, 15);
    stroke(0);
    fill(0);
    textFont(brushOrBackgroundFont, 8);
    textAlign(CENTER, TOP);
    text("+10", 450, 0);
    theStrokeWeight += 10;
    fatOrThin=true;
  }
  if (adjustmentsButtons(415, 29, "-1") && fatOrThin==false && drawing==false) {
    fill(255);
    stroke(0);
    rect(405, 29, 25, 15);
    stroke(0);
    fill(0);
    textFont(brushOrBackgroundFont, 8);
    textAlign(CENTER, TOP);
    text("-1", 415, 29);
    theStrokeWeight -= 1;
    fatOrThin=true;
  }
  if (adjustmentsButtons(450, 29, "-10") && fatOrThin==false && drawing==false) {
    fill(255);
    stroke(0);
    rect(440, 29, 25, 15);
    stroke(0);
    fill(0);
    textFont(brushOrBackgroundFont, 8);
    textAlign(CENTER, TOP);
    text("-10", 450, 29);
    theStrokeWeight -= 10;
    fatOrThin=true;
  }
  textFont(brushOrBackgroundFont, 10);
  text("Brush size:" + theStrokeWeight, 400, 13, 75, 22);


  //stroke shape
  if (mousePressed && drawing==false && dist(mouseX, mouseY, 490, 32)<10) {
    strokeShape=0;
  }
  if (mousePressed && drawing==false && mouseX>505 && mouseX<525 && mouseY>22 && mouseY<44) {
    strokeShape=1;
  }
  if (mousePressed && drawing==false && mouseX>530 && mouseX<550 && mouseY>22 && mouseY<44) {
    strokeShape=2;
    theStrokeWeight=2;
  }
  if (strokeShape==0) {
    fill(255);
    rect(480, 22, 20, 20);
  }
  fill(0);
  ellipse(490, 32, 20, 20);
  if (strokeShape==1) {
    fill(255);
    rect (502, 19, 26, 26);
  }
  fill(0);
  rect(505, 22, 20, 20);
  if (strokeShape==2) {
    fill(255);
    rect (530, 22, 20, 20);
  }
  fill(0);
  triangle(530, 42, 540, 22, 550, 42);
  textAlign(CENTER, CENTER);
  text("Brush shape:", 480, 0, 70, 20);
  line(475, 0, 475, 44);

  //opacity changer, opacity change = false is to keep the button from being held down, and it trips to true when the button is pressed, forcing it to be released
  //to change it again
  fill(255);
  strokeWeight(1);
  if (brushOpacity>255) {
    opacityChange=true;
    brushOpacity=255;
  }
  if (brushOpacity<0) {
    opacityChange=true;
    brushOpacity=1;
  }
  if (adjustmentsButtons(565, 0, "+1") && opacityChange==false && drawing==false) {
    fill(255);
    stroke(0);
    rect(555, 29, 25, 15);
    stroke(0);
    fill(0);
    textFont(brushOrBackgroundFont, 8);
    textAlign(CENTER, TOP);
    text("+1", 565, 29);
    brushOpacity ++;
    opacityChange=true;
  }
  if (adjustmentsButtons(595, 0, "+10") && opacityChange==false && drawing==false) {
    fill(255);
    stroke(0);
    rect(585, 29, 25, 15);
    stroke(0);
    fill(0);
    textFont(brushOrBackgroundFont, 8);
    textAlign(CENTER, TOP);
    text("+10", 595, 29);
    brushOpacity += 10;
    opacityChange=true;
  }
  if (adjustmentsButtons(565, 29, "-1") && opacityChange==false && drawing==false) {
    fill(255);
    stroke(0);
    rect(555, 29, 25, 15);
    stroke(0);
    fill(0);
    textFont(brushOrBackgroundFont, 8);
    textAlign(CENTER, TOP);
    text("-1", 565, 29);
    brushOpacity -= 1;
    opacityChange=true;
  }

  if (adjustmentsButtons(595, 29, "-10") && opacityChange==false && drawing==false) {
    fill(255);
    stroke(0);
    rect(585, 29, 25, 15);
    stroke(0);
    fill(0);
    textFont(brushOrBackgroundFont, 8);
    textAlign(CENTER, TOP);
    text("-10", 595, 29);
    brushOpacity -= 10;
    opacityChange=true;
  }

  textFont(brushOrBackgroundFont, 8);
  fill(0);
  textAlign(CENTER, CENTER);
  if (brushOpacity==255) {
    text("Brush opacity: Max", 555, 7, 75, 22);
  }
  else {
    text("Brush opacity:" + brushOpacity, 555, 7, 75, 22);
  }
  line(553, 0, 553, 44);




  //Color buttons

  //1: black button
  if (colorbutton(60, 10, 0, 0, 0) && drawing==false) {
    selectedColor=1;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==1) {
    fill(255);
    stroke(0);
    rect(50, 0, 20, 20);
    fill(0);
    ellipse(60, 10, 20, 20);
    myPenStroke=color(0, 0, 0, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }


  //2: red button
  if (colorbutton(60, 32, 255, 0, 0) && drawing==false) {
    selectedColor=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==2) {
    fill(255);
    stroke(0);
    rect(50, 22, 20, 20);
    fill(255, 0, 0);
    ellipse(60, 32, 20, 20);
    myPenStroke=color(255, 0, 0, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }


  //3: navy blue button
  if (colorbutton(85, 10, 0, 0, 255) && drawing==false) {
    selectedColor=3;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==3) {
    fill(255);
    stroke(0);
    rect(75, 0, 20, 20);
    fill(0, 0, 255);
    ellipse(85, 10, 20, 20);
    myPenStroke=color(0, 0, 255, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }


  //4: green button
  if (colorbutton(85, 32, 0, 255, 0) && drawing==false) {
    selectedColor=4;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==4) {
    fill(255);
    stroke(0);
    rect(75, 22, 20, 20);
    fill(0, 255, 0);
    ellipse(85, 32, 20, 20);
    myPenStroke=color(0, 255, 0, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }



  //5: yellow button
  if (colorbutton(110, 10, 255, 255, 0) && drawing==false) {
    selectedColor=5;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==5) {
    fill(255);
    stroke(0);
    rect(100, 0, 20, 20);
    fill(255, 255, 0);
    ellipse(110, 10, 20, 20);
    myPenStroke=color(255, 255, 0, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }



  //6: baby blue button
  if (colorbutton(110, 32, 0, 255, 255) && drawing==false) {
    selectedColor=6;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==6) {
    fill(255);
    stroke(0);
    rect(100, 22, 20, 20);
    fill(0, 255, 255);
    ellipse(110, 32, 20, 20);
    myPenStroke=color(0, 255, 255, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }




  //7: magenta button
  if (colorbutton(135, 10, 255, 0, 255) && drawing==false) {
    selectedColor=7;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==7) {
    fill(255);
    stroke(0);
    rect(125, 0, 20, 20);
    fill(255, 0, 255);
    ellipse(135, 10, 20, 20);
    myPenStroke=color(255, 0, 255, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }




  //8: purple button
  if (colorbutton(135, 32, 165, 0, 255) && drawing==false) {
    selectedColor=8;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==8) {
    fill(255);
    stroke(0);
    rect(125, 22, 20, 20);
    fill(165, 0, 255);
    ellipse(135, 32, 20, 20);
    myPenStroke=color(165, 0, 255, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }

  //9: orange button
  if (colorbutton(160, 10, 255, 165, 0) && drawing==false) {
    selectedColor=9;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==9) {
    fill(255);
    stroke(0);
    rect(150, 0, 20, 20);
    fill(255, 165, 0);
    ellipse(160, 10, 20, 20);
    myPenStroke=color(255, 165, 0, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }

  //10: purply blue button
  if (colorbutton(160, 32, 165, 165, 255) && drawing==false) {
    selectedColor=10;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==10) {
    fill(255);
    stroke(0);
    rect(150, 22, 20, 20);
    fill(165, 165, 255);
    ellipse(160, 32, 20, 20);
    myPenStroke=color(165, 165, 255, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }

  //11: dark green button
  if (colorbutton(185, 10, 0, 125, 0) && drawing==false) {
    selectedColor=11;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==11) {
    fill(255);
    stroke(0);
    rect(175, 0, 20, 20);
    fill(0, 125, 0);
    ellipse(185, 10, 20, 20);
    myPenStroke=color(0, 125, 0, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }

  //12: olive button
  if (colorbutton(185, 32, 165, 255, 0) && drawing==false) {
    selectedColor=12;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==12) {
    fill(255);
    stroke(0);
    rect(175, 22, 20, 20);
    fill(165, 255, 0);
    ellipse(185, 32, 20, 20);
    myPenStroke=color(165, 255, 0, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }

  //13: turquoise button
  if (colorbutton(210, 10, 0, 255, 165) && drawing==false) {
    selectedColor=13;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==13) {
    fill(255);
    stroke(0);
    rect(200, 0, 20, 20);
    fill(0, 255, 165);
    ellipse(210, 10, 20, 20);
    myPenStroke=color(0, 255, 165, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }

  //14: blue button
  if (colorbutton(210, 32, 0, 165, 255) && drawing==false) {
    selectedColor=14;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==14) {
    fill(255);
    stroke(0);
    rect(200, 22, 20, 20);
    fill(0, 165, 255);
    ellipse(210, 32, 20, 20);
    myPenStroke=color(0, 165, 255, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }

  //15: light gray button
  if (mousePressed && brushOrBackground==0 && drawing==false && mouseX>235 && mouseX<255 && mouseY>0 && mouseY<20) {
    myPenStroke=color(200, 200, 200, brushOpacity);
    selectedColor=15;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && drawing==false && mouseX>235 && mouseX<255 && mouseY>0 && mouseY<20) {
    myPenStroke=color(200, 200, 200);
    backgroundColor=myPenStroke;
    selectedColor=15;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==15) {
    stroke(0);
    fill(255);
    rect(225, 0, 20, 20);
    stroke(0);
    fill(200);
    ellipse(235, 10, 20, 20);
  }
  else {
    stroke(200);
    fill(200);
    rect(225, 0, 20, 20);
    stroke(0);
    fill(200);
    ellipse(235, 10, 19, 19);
  }


  //16: dark gray button
  if (colorbutton(235, 32, 100, 100, 100) && drawing==false) {
    selectedColor=16;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==16) {
    fill(255);
    stroke(0);
    rect(225, 22, 20, 20);
    fill(100);
    ellipse(235, 32, 20, 20);
    myPenStroke=color(100, 100, 100, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }


  //17: brown button
  if (colorbutton(260, 10, 165, 100, 0) && drawing==false) {
    selectedColor=17;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==17) {
    fill(255);
    stroke(0);
    rect(250, 0, 20, 20);
    fill(165, 100, 0);
    ellipse(260, 10, 20, 20);
    myPenStroke=color(165, 100, 0, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }


  //18: white button
  if (colorbutton(260, 32, 255, 255, 255) && drawing==false) {
    selectedColor=18;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==18) {
    fill(255);
    stroke(0);
    rect(250, 22, 20, 20);
    fill(255);
    ellipse(260, 32, 20, 20);
    myPenStroke=color(255, 255, 255, brushOpacity);
    if (brushOrBackground>=1) {
      backgroundColor=myPenStroke;
      brushOrBackground=2;
    }
  }

  // clear screen box
  stroke(0);
  if (drawing==false && mouseX>725 && mouseX<800 && mouseY>0 && mouseY<40) {
    fill(255, 0, 0);
    if (mousePressed) {
      background(255);
    }
  }
  else {
    fill(255);
  }
  rect(725, 0, 75, 40);
  fill(0);
  textFont(menuFont, 12);
  textAlign(CENTER, CENTER);
  text("Clear screen", 725, 0, 75, 40);


  // reset settings button
  stroke(0);
  if (drawing==false && mouseX>650 && mouseX<725 && mouseY>0 && mouseY<40) {
    fill(255, 0, 0);
    if (mousePressed) {
      myPenStroke=color(0, 0, 0);
      brushOrBackground=0;
      background(255);
      theStrokeWeight=1;
      selectedColor=1;
      strokeShape=0;
      brushOpacity=255;
    }
  }
  else {
    fill(255);
  }
  rect(650, 0, 73, 40);
  stroke(0);
  fill(0);
  textFont(menuFont, 12);
  textAlign(CENTER, CENTER);
  text("Reset", 650, 0, 75, 25);
  textAlign(CENTER, BOTTOM);
  text("settings", 650, 18, 75, 25);

  //reset stroke weight and opacity changing abilities
  if (mousePressed==false) {
    fatOrThin=false;
    opacityChange=false;
    drawing=false;
    if (brushOrBackground<0) {
      brushOrBackground=0;
    }
  }
  // keep stroke weight from going negative
  if (theStrokeWeight<=0) {
    fatOrThin=true;
    theStrokeWeight=1;
  }
}

//color buttons
boolean colorbutton (int xButtonCenter, int yButtonCenter, int colorButtonRed, int colorButtonGreen, int colorButtonBlue) {
  fill(colorButtonRed, colorButtonGreen, colorButtonBlue);
  stroke(colorButtonRed, colorButtonGreen, colorButtonBlue);
  strokeWeight(1);
  ellipse(xButtonCenter, yButtonCenter, 20, 20);
  boolean hit= false;
  if (mousePressed && dist(mouseX, mouseY, xButtonCenter, yButtonCenter)<10) hit=true;
  return hit;
}

//fatter or thinner and opacity change buttons
boolean adjustmentsButtons (int xOrigin, int yOrigin, String theText) {
  fill(200);
  stroke(200);
  strokeWeight(1);
  rect(xOrigin, yOrigin, 25, 15);
  stroke(0);
  fill(0);
  textFont(brushOrBackgroundFont, 8);
  textAlign(CENTER, TOP);
  text(theText, xOrigin, yOrigin);
  boolean hit=false;
  if (mousePressed && mouseX>xOrigin-10 && mouseX<xOrigin+15 && mouseY>yOrigin && mouseY<yOrigin+15) hit=true;
  return hit;
}


