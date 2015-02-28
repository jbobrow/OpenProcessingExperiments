
int oldMouseX, oldMouseY;
int selectedColor;
PFont menuFont;
PFont brushOrBackgroundFont;
int brushOrBackground;
int theStrokeWeight;
int randomRed, randomGreen, randomBlue;
int strokeShape;
int brushOpacity;
color myPenStroke;
color backgroundColor;
boolean fatOrThin=false;
boolean eraserTripped=false;
boolean randomColor=false;
boolean opacityChange=false;
boolean autodraw=false;
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
}

void draw() {
  stroke(myPenStroke, brushOpacity);
  strokeWeight(theStrokeWeight);

  //background changing code
  if (brushOrBackground==2) {
    background(myPenStroke);
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


  //brush or background
  fill(255);
  if (mousePressed && mouseX>325 && mouseX<400 && mouseY>0 && mouseY<22) {
    brushOrBackground=0;
  }
  if (mousePressed && mouseX>325 && mouseX<400 && mouseY>22 && mouseY<44) {
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
  if (mousePressed && mouseX>275 && mouseX<323 && mouseY>0 && mouseY<44) {
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
  if (brushOrBackground==2) {
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
  if (mousePressed && mouseX>0 && mouseX<50 && mouseY>0 && mouseY<50) {
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

  //fatter or thinner
  fill(255);
  strokeWeight(1);
  line(404, 0, 404, 44);
  if (mousePressed && mouseX>400 && mouseX<425 && mouseY>0 && mouseY<22) {
    rect(400, 0, 25, 15);
    if (fatOrThin==false) {
      theStrokeWeight ++;
      fatOrThin=true;
    }
  }
  if (mousePressed && mouseX>450 && mouseX<475 && mouseY>0 && mouseY<22) {
    rect(450, 0, 25, 15);
    if (fatOrThin==false) {
      theStrokeWeight += 10;
      fatOrThin=true;
    }
  }
  if (mousePressed && mouseX>400 && mouseX<425 && mouseY>22 && mouseY<44) {
    rect(400, 29, 25, 15);
    if (fatOrThin==false) {
      theStrokeWeight -= 1;
      fatOrThin=true;
    }
  }
  if (mousePressed && mouseX>450 && mouseX<475 && mouseY>22 && mouseY<44) {
    rect(450, 29, 25, 15);
    if (fatOrThin==false) {
      theStrokeWeight -= 10;
      fatOrThin=true;
    }
  }
  fill(0);
  textFont(brushOrBackgroundFont, 8);
  textAlign(CENTER, TOP);
  text("+1", 400, 0, 25, 22);
  text("+10", 450, 0, 25, 22);
  textAlign(CENTER, BOTTOM);
  text("-1", 400, 22, 25, 22);
  text("-10", 450, 22, 25, 22);
  textFont(brushOrBackgroundFont, 10);
  text("Brush size:" + theStrokeWeight, 400, 10, 75, 22);

  //stroke shape
  if (mousePressed && dist(mouseX, mouseY, 490, 32)<10) {
    strokeShape=0;
  }
  if (mousePressed && mouseX>505 && mouseX<525 && mouseY>22 && mouseY<44) {
    strokeShape=1;
  }
  if (mousePressed && mouseX>530 && mouseX<550 && mouseY>22 && mouseY<44) {
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

  //opacity changer
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
  if (mousePressed && mouseX>555 && mouseX<580 && mouseY>0 && mouseY<22) {
    rect(555, 0, 25, 15);
    if (opacityChange==false) {
      brushOpacity ++;
      opacityChange=true;
    }
  }
  if (mousePressed && mouseX>585 && mouseX<610 && mouseY>0 && mouseY<22) {
    rect(585, 0, 25, 15);
    if (opacityChange==false) {
      brushOpacity += 10;
      opacityChange=true;
    }
  }
  if (mousePressed && mouseX>555 && mouseX<580 && mouseY>22 && mouseY<44) {
    rect(555, 29, 25, 15);
    if (opacityChange==false) {
      brushOpacity -= 1;
      opacityChange=true;
    }
  }
  if (mousePressed && mouseX>585 && mouseX<610 && mouseY>22 && mouseY<44) {
    rect(585, 29, 25, 15);
    if (opacityChange==false) {
      brushOpacity -= 10;
      opacityChange=true;
    }
  }
  fill(0);
  textFont(brushOrBackgroundFont, 8);
  textAlign(CENTER, TOP);
  text("+1", 555, 0, 25, 22);
  text("+10", 585, 0, 25, 22);
  textAlign(CENTER, BOTTOM);
  text("-1", 555, 22, 25, 22);
  text("-10", 585, 22, 25, 22);
  textFont(brushOrBackgroundFont, 8);
  if (brushOpacity==255) {
    text("Brush opacity: Max", 555, 7, 75, 22);
  }
  else {
    text("Brush opacity:" + brushOpacity, 555, 7, 75, 22);
  }
  line(553, 0, 553, 44);











  //1: black button
  if (mousePressed && brushOrBackground==0 && mouseX>50 && mouseX<70 && mouseY>0 && mouseY<40) {
    myPenStroke=color(0, 0, 0, brushOpacity);
    selectedColor=1;
    eraserTripped=false;
    randomColor=false;
    opacityChange=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>50 && mouseX<70 && mouseY>0 && mouseY<40) {
    myPenStroke=color(0, 0, 0);
    backgroundColor=myPenStroke;
    selectedColor=1;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
    opacityChange=false;
  }
  if (selectedColor==1) {
    fill(255);
    stroke(0);
  }
  else {
    fill(200);
    stroke(200);
  }
  rect(50, 0, 20, 20);
  fill(0);
  ellipse(60, 10, 20, 20);


  //2: red button
  if (mousePressed && brushOrBackground==0 && mouseX>50 && mouseX<70 && mouseY>22 && mouseY<42) {
    myPenStroke=color(255, 0, 0, brushOpacity);
    selectedColor=2;
    stroke(200);
    fill(200);
    rect(50, 0, 20, 20);
    fill(0);
    ellipse(60, 10, 20, 20);
    eraserTripped=false;
    randomColor=false;
    opacityChange=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>50 && mouseX<70 && mouseY>22 && mouseY<42) {
    myPenStroke=color(255, 0, 0);
    backgroundColor=myPenStroke;
    selectedColor=2;
    stroke(200);
    fill(200);
    rect(50, 0, 20, 20);
    fill(0);
    ellipse(60, 10, 20, 20);
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
    opacityChange=false;
  }
  if (selectedColor==2) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(50, 22, 20, 20);
  fill(255, 0, 0);
  ellipse(60, 32, 20, 20);

  //3: navy blue button
  if (mousePressed && brushOrBackground==0 &&  mouseX>75 && mouseX<95 && mouseY>0 && mouseY<20) {
    myPenStroke=color(0, 0, 255, brushOpacity);
    selectedColor=3;    
    eraserTripped=false;
    randomColor=false;
    opacityChange=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>75 && mouseX<95 && mouseY>0 && mouseY<20) {
    myPenStroke=color(0, 0, 255);
    backgroundColor=myPenStroke;
    selectedColor=3;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
    opacityChange=false;
  }
  if (selectedColor==3) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(75, 0, 20, 20);
  fill(0, 0, 255);
  stroke(0, 0, 255);
  ellipse(85, 10, 20, 20);

  //4: green button
  if (mousePressed && mouseX>75 && brushOrBackground==0 && mouseX<95 && mouseY>22 && mouseY<42) {
    myPenStroke=color(0, 255, 0, brushOpacity);
    selectedColor=4;
    eraserTripped=false;
    randomColor=false;
    opacityChange=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>75 && mouseX<95 && mouseY>22 && mouseY<42) {
    myPenStroke=color(0, 0, 255);
    backgroundColor=myPenStroke;
    selectedColor=4;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
    opacityChange=false;
  }
  if (selectedColor==4) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(75, 22, 20, 20);
  fill(0, 255, 0);
  ellipse(85, 32, 20, 20);

  //5: yellow button
  if (mousePressed && brushOrBackground==0 && mouseX>100 && mouseX<120 && mouseY>0 && mouseY<20) {
    myPenStroke=color(255, 255, 0, brushOpacity);

    selectedColor=5;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>100 && mouseX<120 && mouseY>0 && mouseY<20) {
    myPenStroke=color(255, 255, 0);
    backgroundColor=myPenStroke;
    selectedColor=5;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==5) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(100, 0, 20, 20);
  fill(255, 255, 0);
  ellipse(110, 10, 20, 20);

  //6: baby blue button
  if (mousePressed && brushOrBackground==0 && mouseX>100 && mouseX<120 && mouseY>22 && mouseY<42) {
    myPenStroke=color(0, 255, 255, brushOpacity);

    selectedColor=6;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>100 && mouseX<120 && mouseY>22 && mouseY<42) {
    myPenStroke=color(0, 255, 255);
    backgroundColor=myPenStroke;
    selectedColor=6;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==6) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(100, 22, 20, 20);
  fill(0, 255, 255);
  ellipse(110, 32, 20, 20);

  //7: magenta button
  if (mousePressed && brushOrBackground==0 && mouseX>125 && mouseX<145 && mouseY>0 && mouseY<20) {
    myPenStroke=color(255, 0, 255, brushOpacity);

    selectedColor=7;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>125 && mouseX<145 && mouseY>0 && mouseY<20) {
    myPenStroke=color(255, 0, 255);
    backgroundColor=myPenStroke;
    selectedColor=7;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==7) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(125, 0, 20, 20);
  fill(255, 0, 255);
  ellipse(135, 10, 20, 20);

  //8: purple button
  if (mousePressed && brushOrBackground==0 && mouseX>125 && mouseX<145 && mouseY>22 && mouseY<42) {
    myPenStroke=color(165, 0, 255, brushOpacity);

    selectedColor=8;
    eraserTripped=false;    
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>125 && mouseX<145 && mouseY>22 && mouseY<42) {
    myPenStroke=color(165, 0, 255);
    backgroundColor=myPenStroke;
    selectedColor=8;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==8) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(125, 22, 20, 20);
  fill(165, 0, 255);
  ellipse(135, 32, 20, 20);

  //9: orange button
  if (mousePressed && brushOrBackground==0 && mouseX>150 && mouseX<170 && mouseY>0 && mouseY<20) {
    myPenStroke=color(255, 165, 0, brushOpacity);

    selectedColor=9;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>150 && mouseX<170 && mouseY>0 && mouseY<20) {
    myPenStroke=color(255, 165, 0);
    backgroundColor=myPenStroke;
    selectedColor=9;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==9) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(150, 0, 20, 20);
  fill(255, 165, 0);
  ellipse(160, 10, 20, 20);

  //10: purply blue button
  if (mousePressed && brushOrBackground==0 && mouseX>150 && mouseX<170 && mouseY>22 && mouseY<42) {
    myPenStroke=color(165, 165, 255, brushOpacity);

    selectedColor=10;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>150 && mouseX<170 && mouseY>22 && mouseY<42) {
    myPenStroke=color(165, 165, 255);
    backgroundColor=myPenStroke;
    selectedColor=10;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==10) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(150, 22, 20, 20);
  fill(165, 165, 255);
  ellipse(160, 32, 20, 20);

  //11: dark green button
  if (mousePressed && brushOrBackground==0 && mouseX>175 && mouseX<195 && mouseY>0 && mouseY<20) {
    myPenStroke=color(0, 125, 0, brushOpacity);

    selectedColor=11;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>175 && mouseX<195 && mouseY>0 && mouseY<20) {
    myPenStroke=color(0, 125, 0);
    backgroundColor=myPenStroke;
    selectedColor=11;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==11) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(175, 0, 20, 20);
  fill(0, 125, 0);
  ellipse(185, 10, 20, 20);

  //12: olive button
  if (mousePressed && brushOrBackground==0 && mouseX>175 && mouseX<195 && mouseY>22 && mouseY<42) {
    myPenStroke=color(165, 255, 0, brushOpacity);

    selectedColor=12;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>175 && mouseX<195 && mouseY>22 && mouseY<42) {
    myPenStroke=color(165, 255, 0);
    backgroundColor=myPenStroke;
    selectedColor=12;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==12) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(175, 22, 20, 20);
  fill(165, 255, 0);
  ellipse(185, 32, 20, 20);

  //13: turquoise button
  if (mousePressed && brushOrBackground==0 && mouseX>200 && mouseX<225 && mouseY>0 && mouseY<20) {
    myPenStroke=color(0, 255, 165, brushOpacity);

    selectedColor=13;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>200 && mouseX<225 && mouseY>0 && mouseY<20) {
    myPenStroke=color(0, 255, 165);
    backgroundColor=myPenStroke;
    selectedColor=13;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==13) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(200, 0, 20, 20);
  fill(0, 255, 165);
  ellipse(210, 10, 20, 20);

  //14: blue button
  if (mousePressed && brushOrBackground==0 && mouseX>200 && mouseX<220 && mouseY>22 && mouseY<42) {
    myPenStroke=color(0, 165, 255, brushOpacity);

    selectedColor=14;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>200 && mouseX<220 && mouseY>22 && mouseY<42) {
    myPenStroke=color(0, 165, 255);
    backgroundColor=myPenStroke;
    selectedColor=14;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==14) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(200, 22, 20, 20);
  fill(0, 165, 255);
  ellipse(210, 32, 20, 20);

  //15: brown button
  if (mousePressed && brushOrBackground==0 && mouseX>225 && mouseX<245 && mouseY>0 && mouseY<20) {
    myPenStroke=color(165, 100, 0, brushOpacity);

    selectedColor=15;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>225 && mouseX<245 && mouseY>0 && mouseY<20) {
    myPenStroke=color(165, 100, 0);
    backgroundColor=myPenStroke;
    selectedColor=15;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==15) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(225, 0, 20, 20);
  fill(165, 100, 0);
  ellipse(235, 10, 20, 20);

  //16: dark gray button
  if (mousePressed && brushOrBackground==0 && mouseX>225 && mouseX<245 && mouseY>22 && mouseY<42) {
    myPenStroke=color(100, 100, 100, brushOpacity);

    selectedColor=16;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>225 && mouseX<245 && mouseY>22 && mouseY<42) {
    myPenStroke=color(100, 100, 100);
    backgroundColor=myPenStroke;
    selectedColor=16;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==16) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(225, 22, 20, 20);
  fill(100);
  ellipse(235, 32, 20, 20);

  //17: light gray button
  if (mousePressed && brushOrBackground==0 && mouseX>250 && mouseX<270 && mouseY>0 && mouseY<20) {
    myPenStroke=color(200, 200, 200, brushOpacity);

    selectedColor=17;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>250 && mouseX<270 && mouseY>0 && mouseY<20) {
    myPenStroke=color(200, 200, 200);
    backgroundColor=myPenStroke;
    selectedColor=17;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==17) {
    stroke(0);
    fill(255);
    rect(250, 0, 20, 20);
    stroke(0);
    fill(200);
    ellipse(260, 10, 20, 20);
  }
  else {
    stroke(200);
    fill(200);
    rect(250, 0, 20, 20);
    stroke(0);
    fill(200);
    ellipse(260, 10, 19, 19);
  }

  //18: white button
  if (mousePressed && brushOrBackground==0 && mouseX>250 && mouseX<270 && mouseY>22 && mouseY<42) {
    myPenStroke=color(255, 255, 255, brushOpacity);

    selectedColor=18;
    eraserTripped=false;
    randomColor=false;
  }
  if (mousePressed && brushOrBackground>=1 && mouseX>250 && mouseX<270 && mouseY>22 && mouseY<42) {
    myPenStroke=color(255, 255, 255);
    backgroundColor=myPenStroke;
    selectedColor=18;
    brushOrBackground=2;
    eraserTripped=false;
    randomColor=false;
  }
  if (selectedColor==18) {
    stroke(0);
    fill(255);
  }
  else {
    stroke(200);
    fill(200);
  }
  rect(250, 22, 20, 20);
  fill(255);
  ellipse(260, 32, 20, 20);






  //auto drawing
  /* if (mousePressed && mouseX>555 && mouseX<648 && mouseY>0 && mouseY <40) {
   fill(200);
   stroke(0);
   autodraw=true;
   }
   if (autodraw==true) {
   rect(404, 44, 246, 40);
   if (mousePressed && mouseX>555 && mouseX<648 && mouseY>0 && mouseY <40) {
   autodraw=false;
   }
   }
   fill(255);
   stroke(0);
   rect(555, 0, 93, 40);
   fill(0);
   text("Auto drawing", 555, 0, 93, 44); */


  // clear screen box
  stroke(0);
  if (mouseX>725 && mouseX<800 && mouseY>0 && mouseY<40) {
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
  if (mouseX>650 && mouseX<725 && mouseY>0 && mouseY<40) {
    fill(255, 0, 0);
    if (mousePressed) {
      myPenStroke=color(0, 0, 0);
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

  //reset stroke weight changing ability
  if (mousePressed==false) {
    fatOrThin=false;
  }
  // keep stroke weight from going negative
  if (theStrokeWeight<=0) {
    fatOrThin=true;
    theStrokeWeight=1;
  }

  //reset opacity changing ability
  if (mousePressed==false) {
    opacityChange=false;
  }
}


