
float r = 40;
float f1=0, f2=0, f3=0, f4=0, f5=0;
float wf1=255, wf2=255, wf3=255, wf4=255, wf5=255;
float xPos1, yPos1;
float xPos2, yPos2;
float xPos3, yPos3;
float xPos4, yPos4;
float xPos5, yPos5;
float wxPos1, wyPos1;
float wxPos2, wyPos2;
float wxPos3, wyPos3;
float wxPos4, wyPos4;
float wxPos5, wyPos5;


void setup() {
  size(400, 400);
  ellipseMode(CENTER);
  smooth();
  noStroke();
  textAlign(CENTER, CENTER);
  textSize(20);
}

void draw() {
  drawCircles();
}


void drawCircles() {
  //black circle 1
  xPos1=100;
  yPos1=40;
  fill(f1);
  ellipse(xPos1, yPos1, r, r);
  fill(255);
  text("↕", xPos1, yPos1);


  //black circle 2
  xPos2=100;
  yPos2=120;
  fill(f2);
  ellipse(xPos2, yPos2, r, r);
  fill(255);
  text("↓↓", xPos2, yPos2);

  //black circle 3
  xPos3=100;
  yPos3=200;
  fill(f3);
  ellipse(xPos3, yPos3, r, r);
  fill(255);
  text("↑↑", xPos3, yPos3);

  //black circle 4
  xPos4=100;
  yPos4=280;
  fill(f4);
  ellipse(xPos4, yPos4, r, r);
  fill(255);
  text("↓", xPos4, yPos4);


  //black circle 5
  xPos5=100;
  yPos5=360;
  fill(f5);
  ellipse(xPos5, yPos5, r, r);
  fill(255);
  text("↑", xPos5, yPos5);



  //white circle 1
  wxPos1=300;
  wyPos1=40;
  fill(wf1);
  ellipse(wxPos1, wyPos1, r, r);
  fill(0);
  text("↕", wxPos1, wyPos1);


  //white circle 2
  wxPos2=300;
  wyPos2=120;
  fill(wf2);
  ellipse(wxPos2, wyPos2, r, r);
fill(0);
  text("↓↓", wxPos2, wyPos2);


  //white circle 3
  wxPos3=300;
  wyPos3=200;
  fill(wf3);
  ellipse(wxPos3, wyPos3, r, r);
fill(0);
  text("↑↑", wxPos3, wyPos3);


  //white circle 4
  wxPos4=300;
  wyPos4=280;
  fill(wf4);
  ellipse(wxPos4, wyPos4, r, r);
 fill(0);
  text("↓", wxPos4, wyPos4);


  //white circle 5
  wxPos5=300;
  wyPos5=360;
  fill(wf5);
  ellipse(wxPos5, wyPos5, r, r);
  fill(0);
  text("↑", wxPos5, wyPos5);
}

void mousePressed() {
  //black circle actions===================
  if ((dist(xPos1, yPos1, mouseX, mouseY))<r/2) {
    f1=255;
  }
  if ((dist(xPos2, yPos2, mouseX, mouseY))<r/2) {
    if (f2==0) { 
      f2=255;
    } 
    else {
      if (f2==255) {
        f2=0;
      }
    }
  }
  if ((dist(xPos4, yPos4, mouseX, mouseY))<r/2) {
    if (f4==0) { 
      f4=255;
    }
  }

  //white circle actions===========================
  if ((dist(wxPos1, wyPos1, mouseX, mouseY))<r/2) {
    wf1=0;
  }
  if ((dist(wxPos2, wyPos2, mouseX, mouseY))<r/2) {
    if (wf2==255) { 
      wf2=0;
    } 
    else {
      if (wf2==0) {
        wf2=255;
      }
    }
  }
  if ((dist(wxPos4, wyPos4, mouseX, mouseY))<r/2) {
    if (wf4==255) { 
      wf4=0;
    }
  }
}

void mouseReleased() {
  //black circle actions=================
  if ((dist(xPos1, yPos1, mouseX, mouseY))<r/2) {
    f1=0;
  }
  if ((dist(xPos3, yPos3, mouseX, mouseY))<r/2) {
    if (f3==0) { 
      f3=255;
    } 
    else {
      if (f3==255) {
        f3=0;
      }
    }
  }
  if ((dist(xPos5, yPos5, mouseX, mouseY))<r/2) {
    if (f5==0) { 
      f5=255;
    }
  }

  //white circle actions ========================
  if ((dist(wxPos1, wyPos1, mouseX, mouseY))<r/2) {
    wf1=255;
  }
  if ((dist(wxPos3, wyPos3, mouseX, mouseY))<r/2) {
    if (wf3==255) { 
      wf3=0;
    } 
    else {
      if (wf3==0) {
        wf3=255;
      }
    }
  }
  if ((dist(wxPos5, wyPos5, mouseX, mouseY))<r/2) {
    if (wf5==255) { 
      wf5=0;
    }
  }
}     
