

//int eyesDiameter = 90; 
//int eyeballsDiameter = 20;
//int distFromCenter = eyesDiameter - eyeballsDiameter; 
//float pMouseX = 0, pMouseY = 0; 
//float disX, disY; 

ArrayList manyEyes; 
ArrayList listForEye; 

int[] fillColor = {
  #93DAEA, #DEF7E0, #EEF278, #5DBCA3, #FCF0F9, #F0FCFC, #FFFCFF
}; 
int colorOfBox1 = fillColor[0]; 
int colorOfBox2 = fillColor[0]; 
int colorOfBox3 = fillColor[0]; 
int colorOfBox4 = fillColor[0]; 

int sizeOfEye = 30; 

int codeForEye = 0; 

int mouseXPressed = 58; 
int mouseYPressed = 205; 

void setup() {
  size (1000, 600); 
  smooth();  
  background (fillColor[5]);
  manyEyes = new ArrayList(); 
  listForEye = new ArrayList();
}

void draw() {
  background (fillColor[5]); 
  if (mousePressed == true) {
    if ((mouseX > 30) && (mouseX < 100) && (mouseY > 20) && (mouseY < 70)) {
      codeForEye = 0;
    }
    else if ((mouseX>30) && (mouseX < 130) && (mouseY> 100) && (mouseY < 150)) {
      codeForEye = 1;
    }
    else if ((mouseX>28) && (mouseX < 190) && (mouseY> 190) && (mouseY < 240)) {
      background (fillColor[5]); 
      mouseXPressed = mouseX;
      sizeOfEye = mouseX - 10;
    }
    else if ((mouseX>30) && (mouseX < 160) && (mouseY> 250) && (mouseY < 300)) {
      codeForEye = 3;
    }
    else {
      manyEyes.add (new Eye (mouseX, mouseY, sizeOfEye));
      listForEye.add(codeForEye);
    }
  }

  for (int i = 0; i < manyEyes.size()-1; i++) {
    Eye oneEye = (Eye) manyEyes.get(i); 
    oneEye.update(mouseX, mouseY); 
    int eyeCode = (Integer) listForEye.get(i); 
    oneEye.display(eyeCode);
  }
  if (codeForEye == 3) {
    background (fillColor[5]);
    for (int i = 0; i < manyEyes. size(); i++) {
      manyEyes.remove(i);
      listForEye.remove(i);
    }
  }
  drawToolBars();
}
; 

//    noFill(); 
//    ellipse (mouseX, mouseY, eyesDiameter, eyesDiameter); 
//    //    println(pMouseX); 
//    //    println(pMouseY);
//
//
//    fill (0); 
//    float distP = dist(mouseX, mouseY, pMouseX, pMouseY); 
//    println(distP); 
//    disX = pMouseX + (distFromCenter*(mouseX-pMouseX)/distP); 
//    disY = pMouseY - (distFromCenter*(mouseY-pMouseY)/distP); 
//    println((mouseX-pMouseX)/distP); 
//    //      println(disY); 
//    ellipse(disX, disY, eyeballsDiameter, eyeballsDiameter); 
//    //      ellipse (mouseX, mouseY, eyeballsDiameter, eyeballsDiameter);
//
//    pMouseX = mouseX; 
//    pMouseY = mouseY;

void drawToolBars() {

  smooth(2); 
  stroke(fillColor[1]); 
  strokeWeight(5); 

  // TOOLBAR 1 ****************************************************************************
  if ((mouseX>30) && (mouseX < 130) && (mouseY> 20) && (mouseY < 70)) {
    colorOfBox1 = fillColor[3];
  } 
  else if (codeForEye == 0) {
    colorOfBox1 = fillColor[3];
  }
  else {
    colorOfBox1 = fillColor[0];
  }
  // TOOLBAR 2 ****************************************************************************
  if ((mouseX>30) && (mouseX < 130) && (mouseY> 100) && (mouseY < 150)) {
    colorOfBox2 = fillColor[3];
  } 
  else if (codeForEye == 1) {
    colorOfBox2 = fillColor[3];
  }
  else {
    colorOfBox2 = fillColor[0];
  }
  // TOOLBAR 3 ****************************************************************************
  if ((mouseX>15) && (mouseX < 200) && (mouseY> 190) && (mouseY < 220)) {
    colorOfBox3 = fillColor[3];
  } 
  else if (codeForEye == 2) {
    colorOfBox3 = fillColor[3];
  }
  else {
    colorOfBox3 = fillColor[0];
  }
  // TOOLBAR 4 ****************************************************************************
  if ((mouseX>30) && (mouseX < 160) && (mouseY> 250) && (mouseY < 300)) {
    colorOfBox4 = fillColor[3];
  } 
  else {
    colorOfBox4 = fillColor[0];
  }

  fill(colorOfBox1); 
  roundRect (30, 20, 100, 50);
  fill(colorOfBox2); 
  roundRect (30, 100, 100, 50); 
  fill(colorOfBox3); 
  roundRect (30, 200, 150, 10);
  fill(colorOfBox4); 
  roundRect (30, 250, 130, 50);  
  noStroke(); 
  fill(fillColor[0]); 
  ellipse (mouseXPressed, mouseYPressed, 20, 20); 
  //  fill(colorOfBox3); 
  //  roundRect (30, 180, 100, 50);
  //  fill (colorOfBox4); 
  //  roundRect (30, 260, 100, 50); 
  //  fill (colorOfBox5); 
  //  roundRect (30, 340, 100, 50); 

  // TEXT IN BOX ****************************************************************************

  PFont mono1;
  mono1 = loadFont("Papyrus-20.vlw");
  textFont(mono1);


  textSize(20); 
  fill(0, 102, 153);
  text("Normal Eye", 30, 50); 
  text("Sleepy Eye", 30, 130);
  text("Clear Screen", 37, 282); 
  textSize(13); 
  text("Small Eye", 25, 230); 
  text("Bigger Eye", 125, 230); 

  //  text("Angry Eye", 30, 210);
  //  text("Bigger Eye", 30, 290); s
  //  text("Smaller Eye", 30, 370);
}

class Eye {
  int x, y;
  int size;
  float angle = 0.0; 


  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
  }

  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
  }

  void display(int e) {
    switch (e) {
      // ****************************************************************************
    case 0:  
      pushMatrix();
      translate(x, y);
      smooth(); 
      strokeWeight(5); 
      stroke(220); 
      fill(240); 
      ellipse(0, 0, size, size);
      rotate(angle);
      noStroke(); 
      fill(0);
      ellipse(size/4, 0, size/2, size/2);
      popMatrix();
      break;
      // **************************************************************************** 
    case 1:
      pushMatrix();
      translate(x, y);
      smooth(); 
      strokeWeight(5); 
      stroke(220); 
      fill(fillColor[4]); 
      ellipse(0, 0, size, size);
      rotate(angle);
      noStroke(); 
      fill(0);
      ellipse(size/4, 0, size/2, size/2);
      rotate(-angle); 
      stroke(220); 
      fill(220); 
      arc (0, 0, size, size, -PI, 0);
      popMatrix();
      break;
      // ****************************************************************************
//    case 3:
//      background (fillColor[5]); 
//      break;
      // ****************************************************************************

      // ****************************************************************************
    case 4: 
      break;
    }
  }
}


void roundRect(float x, float y, float w, float h)
{
  float corner = w/12.0;
  float midDisp = w/10.0;
  
  beginShape();  
  curveVertex(x+corner,y);
  curveVertex(x+w-corner,y);
  curveVertex(x+w+midDisp,y+h/2.0);
  curveVertex(x+w-corner,y+h);
  curveVertex(x+corner,y+h);
  curveVertex(x-midDisp,y+h/2.0);
  
  curveVertex(x+corner,y);
  curveVertex(x+w-corner,y);
  curveVertex(x+w+midDisp,y+h/2.0);
  endShape();
} 


