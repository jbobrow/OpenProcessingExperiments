

Button mySquareTool;
Button myCircleTool;
Button mySmallCircleTool;
Button myEraserTool;
Button mySmallSquareTool;


Trigger myTriangleTool;
Trigger mySmallTriangleTool;



void setup() {
  size(700, 750);
  background(0);
  //myFrame = new Button("frame", 350,350, );
  myEraserTool = new Button("eraser", 100, 720, 40);

  mySquareTool = new Button("rectangle", 605, 725, 35);
  //myHollowSquareTool = new Button("hollowRectangle", 550, 665, 30);
  // mySmallHollowSquareTool = new Button("smallHollowRectangle", 510, 665, 20);

  mySmallSquareTool = new Button("smallRectangle", 565, 720, 20);

  myCircleTool = new Button("circle", 445, 725, 35);
  mySmallCircleTool = new Button("smallCircle", 410, 720, 20);


  myTriangleTool = new Trigger("triangle", 475, 730, 490, 705, 505, 730);
  mySmallTriangleTool = new Trigger("smallTriangle", 510, 740, 530, 705, 550, 740);
}


void draw() {
  rectMode(CENTER);
  //Color Setup

  //////////////////////////////////////////////////////////////////////////////
  ///FRAMING

  //Transparent Black Rectangle
  fill(0, 1);
  rect(350, 350, 700, 700);


  //Menu bar
  noStroke();
  fill(255);
  rect(350, 725, 700, 50);

  //Frame & Border
  frameRate(60);
  stroke(255);
  strokeWeight(30);
  noFill();
  rect(350, 350, 670, 670);

  stroke(250);
  strokeWeight(30);
  noFill();
  rect(350, 350, 650, 650);

  stroke(225);
  strokeWeight(25);
  noFill();
  rect(350, 350, 630, 630);

  stroke(200);
  strokeWeight(20);
  noFill();
  rect(350, 350, 610, 610);

  stroke(190);
  strokeWeight(15);
  noFill();
  rect(350, 350, 590, 590);

  //back
  stroke(170);
  strokeWeight(10);
  noFill();
  rect(350, 350, 570, 570);  

  stroke(150);
  strokeWeight(8);
  noFill();
  rect(350, 350, 550, 550);  

  //myFrame.display();
  myEraserTool.display();


  mySquareTool.display();
  mySmallSquareTool.display();
  //myHollowSquareTool.display();
  // mySmallHollowSquareTool.display();



  myCircleTool.display();
  mySmallCircleTool.display();

  myTriangleTool.display();
  mySmallTriangleTool.display();


  /////////////////////////////////////////////

  myEraserTool.move();


  mySquareTool.move();
  mySmallSquareTool.move();
  //myHollowSquareTool.move();
  //  mySmallHollowSquareTool.move();


  myCircleTool.move();
  mySmallCircleTool.move();


  myTriangleTool.move();
  mySmallTriangleTool.move();

  println(mouseX, mouseY);
}



//Erase Drawing
void mousePressed() {

  // to reset all your other buttons
  /*
  if (myEraserTool.click()) {
    mySquareTool.button = false;
    mySmallSquareTool.button = false;
    myCircleTool.button = false;
    mySmallCircleTool.button = false;
    myTriangleTool.trigger = false;
    mySmallTriangleTool.trigger = false;
  } else if (mySquareTool.click()) {
    myEraserTool.button = false;
    mySmallSquareTool.button = false;
    myCircleTool.button = false;
    mySmallCircleTool.button = false;
    myTriangleTool.trigger = false;
    mySmallTriangleTool.trigger = false;
  } else if (mySmallSquareTool.click()) {
    mySquareTool.button = false;
    myEraserTool.button = false;
    myCircleTool.button = false;
    mySmallCircleTool.button = false;
    myTriangleTool.trigger = false;
    mySmallTriangleTool.trigger = false;
   } else if (myCircleTool.click()) {
    mySquareTool.button = false;
    mySmallSquareTool.button = false;
    myEraserTool.button = false;
    mySmallCircleTool.button = false;
    myTriangleTool.trigger = false;
    mySmallTriangleTool.trigger = false;
  } else if (mySmallCircleTool.click()) {
    mySquareTool.button = false;
    mySmallSquareTool.button = false;
    myCircleTool.button = false;
    myEraserTool.button = false;
    myTriangleTool.trigger = false;
    mySmallTriangleTool.trigger = false;
  } else if (myTriangleTool.click()) {
    mySquareTool.button = false;
    mySmallSquareTool.button = false;
    myCircleTool.button = false;
    mySmallCircleTool.button = false;
    myEraserTool.button = false;
    mySmallTriangleTool.trigger = false;
  } else if (mySmallTriangleTool.click()) {
    mySquareTool.button = false;
    mySmallSquareTool.button = false;
    myCircleTool.button = false;
    mySmallCircleTool.button = false;
    myTriangleTool.trigger = false;
    myEraser.button = false;
  }
  */

  myEraserTool.button = false;
  myEraserTool.click();


  mySquareTool.button = false;
  mySquareTool.click();

  mySmallSquareTool.button = false;
  mySmallSquareTool.click();


  myCircleTool.button = false;
  myCircleTool.click();

  mySmallCircleTool.button = false;
  mySmallCircleTool.click();


  myTriangleTool.trigger = false;
  myTriangleTool.click();

  mySmallTriangleTool.trigger = false;
  mySmallTriangleTool.click();

}




class Button {

  //properties
  float r;
  float g;
  float b;
  float a;

  float diam = 5;
  float diamB = 50;
  float diamR = 5;
  float diamRbig = 50;
  float diamT = 5;
  float diamTbig = 50;

  boolean button = false;


  String _buttonType;

  int _xpos;
  int _ypos;
  int _size;

  color buttonColor;

  //constructor
  Button(String bt, int x, int y, int s) {
    _buttonType = bt;
    _xpos = x;
    _ypos = y;
    _size = s;
  }




  void display() {

    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);


    ///Buttons Placement

    
    //////////////////////////////////////////////////////////////
//ERASER


    if (_buttonType == "eraser") {

      if (button) {
        buttonColor = color(255);
      } else {
        buttonColor = color(0);
      }
      // println(button);
      ////////Eraser
      //button # 1
      fill(0);
      stroke(255);
      strokeWeight(3);
      rect(_xpos, _ypos, _size, _size);
      stroke(255);
      rect(_xpos, _ypos, 30, 30);
      line(86, 707, 115, 735);
      line(86, 735, 115, 707);
    } 

    ///////////////////////////////////////////////////////////////
    //Big Rectangle

    if (_buttonType == "rectangle") {
      if (button) {
        buttonColor = color(0, 0, 255);
      } else {
        buttonColor = color(0);
      }

      // Rectangle button
      //button # 2
      fill(buttonColor);
      stroke(255);
      strokeWeight(4);
      rect(_xpos, _ypos, _size, _size);
      stroke(255);
      strokeWeight(4);
      rect(_xpos, _ypos, _size/2, _size/2);
      stroke(255);
      strokeWeight(4);
      rect(_xpos, _ypos, _size/8, _size/8);
    }
    
     ///////////////////////////////////////////////////////////////
    //Big Hollow Rectangle
/*
    if (_buttonType == "hollowRectangle") {
      if (button) {
        buttonColor = color(0, 0, 255);
      } else {
        buttonColor = color(0);
      }

      // Rectangle button
      //button # 2
      fill(buttonColor);
      stroke(255);
      strokeWeight(4);
      rect(_xpos, _ypos, _size, _size);
    
    }


 ///////////////////////////////////////////////////////////////
    //Small Hollow Rectangle

    if (_buttonType == "smallHollowRectangle") {
      if (button) {
        buttonColor = color(0, 0, 255);
      } else {
        buttonColor = color(0);
      }

      // Rectangle button
      //button # 2
      fill(buttonColor);
      stroke(255);
      strokeWeight(2);
      rect(_xpos, _ypos, _size, _size);
 
    }

*/
    /////////////////////////////////////////////////////////////////
    //Small Rectangle

    if (_buttonType == "smallRectangle") {
      if (button) {
        buttonColor = color(0, 0, 255);
      } else {
        buttonColor = color(0);
      }

      // Rectangle button
      //button # 2
      fill(buttonColor);
      stroke(255);
      strokeWeight(2);
      rect(_xpos, _ypos, _size, _size);
      stroke(255);
      strokeWeight(2);
      rect(_xpos, _ypos, _size/2, _size/2);
      stroke(255);
      strokeWeight(2);
      rect(_xpos, _ypos, _size/8, _size/8);
    }

    /////////////////////////////////////////////////////////////////    
    // Big Circle

    if (_buttonType == "circle") {
      if (button) {
        buttonColor = color(200, 0, 255);
      } else {
        buttonColor = color(0);
      }
      //// circle button
      //button #2
      fill(buttonColor);
      stroke(255);
      strokeWeight(4);
      ellipse(_xpos, _ypos, _size, _size);
      fill(buttonColor);
      stroke(255);
      strokeWeight(4);
      ellipse(_xpos, _ypos, _size/2, _size/2);
      fill(buttonColor);
      stroke(255);
      strokeWeight(4);
      ellipse(_xpos, _ypos, _size/8, _size/8);
    }

    ////////////////////////////////////////////////////////////////
    //Small Circle

    if (_buttonType == "smallCircle") {
      if (button) {
        buttonColor = color(200, 0, 255);
      } else {
        buttonColor = color(0);
      }
      //// circle button
      //button #2
      fill(buttonColor);
      stroke(255);
      strokeWeight(2);
      ellipse(_xpos, _ypos, _size, _size);
      fill(buttonColor);
      stroke(255);
      strokeWeight(2);
      ellipse(_xpos, _ypos, _size/2, _size/2);
      fill(buttonColor);
      stroke(255);
      strokeWeight(2);
      ellipse(_xpos, _ypos, _size/8, _size/8);
    }

    /////////////////////////////////////////////////////////////////
    /*
      else if (_buttonType == "triangle") {
     if(button){
     buttonColor = color(0,200,255);
     } else {
     buttonColor = color(0);
     }
     
     //// triangle draw button
     fill(buttonColor);
     stroke(255);
     strokeWeight(2);
     triangle(165, 685, 185, 645, 205, 685);
     fill(buttonColor);
     stroke(255);
     strokeWeight(3);
     triangle(180, 675, 185, 665, 190, 675);
     */
  }

  void click() {

    if (mouseX > _xpos - _size/2 &&
      mouseX < _xpos + _size/2 &&
      mouseY > _ypos - _size/2 &&
      mouseY < _ypos + _size/2) {
      button = !button;
    }
  }


  void move() {



    
    ///////////////////////////////////////////////////////////////////
    //Reset Canvas

    if (button && _buttonType == "eraser") {
      fill(0);
      stroke(r, g, b);
      rect(_xpos, _ypos, _size, _size);
      stroke(r, g, b);
      rect(_xpos, _ypos, 30, 30);
      line(86, 707, 115, 735);
      line(86, 735, 115, 707);
    } else {
    }

    if (button && _buttonType == "eraser") {
      fill(0);
      noStroke();
      rect(350, 350, 545, 545);
    } else {
    }



    //Big Ractangle
    ////////////////////////////////////////////////////////////////

    if (button && _buttonType == "rectangle") {
      fill(0);
      stroke(r, g, b);
      strokeWeight(4);
      rect(_xpos, _ypos, _size, _size);
      noFill();
      stroke(r, g, b);
      strokeWeight(4);
      rect(_xpos, _ypos, _size/2, _size/2);
      noFill();
      stroke(r, g, b);
      strokeWeight(4);
      rect(_xpos, _ypos, _size/8, _size/8);
    }

    if (button && _buttonType == "rectangle") {
      // Rectangles draw
      fill(r, g, b, 2);
      stroke(r, g, b);
      strokeWeight(abs(mouseX-pmouseX));
      rect(mouseX, mouseY, 300, 300); //rectangle Large rectangle
      rect(mouseX, mouseY, diamR, diamR);  //repeating growing rectangle
      rect(mouseX, mouseY, 150, 150);  //medium rectangle
      rect(mouseX, mouseY, diamRbig, diamRbig);  //largest growing rectangle
      // Growing
      diamRbig++;
      diamR++;
      //Restart Growing Rect
      if (diamR >= 300) {
        diamR = 5;
      }
      if (diamRbig > 1000) {
        diamRbig = 5;
      }
    } else {
    }

//Big Hollow Ractangle
    ////////////////////////////////////////////////////////////////
/*
    if (button && _buttonType == "hollowRectangle") {
      fill(0);
      stroke(r, g, b);
      strokeWeight(4);
      rect(_xpos, _ypos, _size, _size);
   
    
    }

    if (button && _buttonType == "hollowRectangle") {
      // Rectangles draw
      fill(r, g, b, 2);
      stroke(r, g, b);
      strokeWeight(abs(mouseX-pmouseX));
      rect(mouseX, mouseY, 300, 300); //rectangle Large rectangle
    }



//Small Hollow Ractangle
    ////////////////////////////////////////////////////////////////

    if (button && _buttonType == "smallHollowRectangle") {
      fill(0);
      stroke(r, g, b);
      strokeWeight(2);
      rect(_xpos, _ypos, _size, _size);
      
    }

    if (button && _buttonType == "smallHollowRectangle") {
      // Rectangles draw
      fill(r, g, b, 2);
      stroke(r, g, b);
      strokeWeight(abs(mouseX-pmouseX));
      rect(mouseX, mouseY, 150, 150); //rectangle Large rectangle
    }
*/
    //////////////////////////////////////////////////////////////////
    //Small Rectngle

      if (button && _buttonType == "smallRectangle") {
      fill(0);
      stroke(r, g, b);
      strokeWeight(4);
      rect(_xpos, _ypos, _size, _size);
      noFill();
      stroke(r, g, b);
      strokeWeight(4);
      rect(_xpos, _ypos, _size/2, _size/2);
      noFill();
      stroke(r, g, b);
      strokeWeight(4);
      rect(_xpos, _ypos, _size/8, _size/8);
    }

    if (button && _buttonType == "smallRectangle") {
      // Rectangles draw
      fill(r, g, b, 2);
      stroke(r, g, b);
      strokeWeight(abs(mouseX-pmouseX));
      rect(mouseX, mouseY, 150, 150); //rectangle Large rectangle
      rect(mouseX, mouseY, diamR/2, diamR/2);  //repeating growing rectangle
      rect(mouseX, mouseY, 75, 75);  //medium rectangle
      rect(mouseX, mouseY, diamRbig/2, diamRbig/2);  //largest growing rectangle
      // Growing
      diamRbig++;
      diamR++;
      //Restart Growing Rect
      if (diamR >= 150) {
        diamR = 2.5;
      }
      if (diamRbig > 500) {
        diamRbig = 2.5;
      }
    } else {
    }



    //BIG CIRCLE
    ///////////////////////////////////////////////////////////////////

    if (button && _buttonType == "circle") {
      fill(0);
      stroke(r, g, b);
      strokeWeight(4);
      ellipse(_xpos, _ypos, _size, _size);
      fill(0);
      stroke(r, g, b);
      strokeWeight(4);
      ellipse(_xpos, _ypos, _size/2, _size/2);
      fill(0);
      stroke(r, g, b);
      strokeWeight(4);
      ellipse(_xpos, _ypos, _size/8, _size/8);

      // Circles
      fill(r, g, b, 2);
      stroke(r, g, b);
      strokeWeight(abs(mouseX-pmouseX));
      ellipse(mouseX, mouseY, 300, 300); //Large Circle
      stroke(r, g, b);
      ellipse(mouseX, mouseY, diam, diam); // Repeating Growing Circle
      ellipse(mouseX, mouseY, 150, 150); //Medium circle
      ellipse(mouseX, mouseY, diamB, diamB); //Largest Growing circle
      // Growing

      diamB++;
      diam++;
      //Restart Growing Circle
      if (diam >= 300) {
        diam = 5;
      }
      if (diamB > 1000) {
        diamB = 5;
      }
    } else {
    }


    //////////////////////////////////////////////////////////////////
    //Small Circle
    if (button && _buttonType == "smallCircle") {
      fill(0);
      stroke(r, g, b);
      strokeWeight(2);
      ellipse(_xpos, _ypos, _size, _size);
      fill(0);
      stroke(r, g, b);
      strokeWeight(2);
      ellipse(_xpos, _ypos, _size/2, _size/2);
      fill(0);
      stroke(r, g, b);
      strokeWeight(2);
      ellipse(_xpos, _ypos, _size/8, _size/8);

      // Circles
      fill(r, g, b, 2);
      stroke(r, g, b);
      strokeWeight(abs(mouseX-pmouseX));
      ellipse(mouseX, mouseY, 150, 150); //Large Circle
      stroke(r, g, b);
      ellipse(mouseX, mouseY, diam/2, diam/2); // Repeating Growing Circle
      ellipse(mouseX, mouseY, 75, 75); //Medium circle
      ellipse(mouseX, mouseY, diamB/2, diamB/2); //Largest Growing circle
      // Growing

      diamB++;
      diam++;
      //Restart Growing Circle
      if (diam >= 150) {
        diam = 2.5;
      }
      if (diamB > 500) {
        diamB = 2.5;
      }

    }


    //////////////////////////////////////////////////////////////////

    /*

     
     
     if (buttonPressedTri) {
     fill(0);
     stroke(r, g, b);
     strokeWeight(2);
     triangle(365, 685, 385, 645, 405, 685);
     fill(0);
     stroke(r, g, b);
     strokeWeight(3);
     triangle(380, 675, 385, 665, 390, 675);
     
     // triangles
     fill(r, g, b, 2);
     stroke(r, g, b);
     strokeWeight(abs(mouseX-pmouseX));
     triangle(mouseX - 150, mouseY + 150, mouseX, mouseY - 150, mouseX + 150, mouseY + 150); //Large triangle
     stroke(r, g, b);
     triangle(mouseX - 5, mouseY + 10, mouseX, mouseY, mouseX + 5, mouseY + 10); // Repeating Growing triangle
     triangle(mouseX - 75, mouseY + 75, mouseX, mouseY - 75, mouseX + 75, mouseY + 75); //Largest Growing triangle
     } else {
     }
     */
  }
}

class Trigger {
  
  
  //properties
  float r;
  float g;
  float b;
  float a;

  float diam = 5;
  float diamB = 50;
  float diamR = 5;
  float diamRbig = 50;
  float diamT = 5;
  float diamTbig = 50;

  boolean trigger = false;

  
  String _triggerType;
  
  //constructor
  int _xpos1;
  int _xpos2;
  int _xpos3;
  
  int _ypos1;
  int _ypos2;
  int _ypos3;
  

  
  color buttonColor1;
  
  //constructor
  Trigger(String tt, int x1, int y1, int x2, int y2, int x3, int y3) {
    _triggerType = tt;
    _xpos1 = x1;
    _ypos1 = y1;
    _xpos2 = x2;
    _ypos2 = y2;
    _xpos3 = x3;
    _ypos3 = y3;
  }
  
  
  
  
  
  
    void display() {
////////////////////////////////////

    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    
    //Big triangle
//////////////////////////////////////////////////////////////////////////////

    if (_triggerType == "triangle") {
      if (trigger) {
        buttonColor1 = color(0, 0, 255);
      } else {
        buttonColor1 = color(0);
      }

      // triangle button
      //button # 2
        
     fill(0);
     stroke(255);
     strokeWeight(2);
     triangle(_xpos1, _ypos1, _xpos2, _ypos2, _xpos3, _ypos3);
     fill(0);
     stroke(255);
     strokeWeight(2);
     triangle(_xpos1 + 10, _ypos1 - 5, _xpos2, _ypos2 + 10, _xpos3 - 10, _ypos3 - 5);
    }

/////////////////////////////////////////////////
//Small Triangle
    if (_triggerType == "smallTriangle") {
      if (trigger) {
        buttonColor1 = color(0, 0, 255);
      } else {
        buttonColor1 = color(0);
      }

      // triangle button
      //button # 2
        
     fill(0);
     stroke(255);
     strokeWeight(3);
     triangle(_xpos1, _ypos1, _xpos2, _ypos2, _xpos3, _ypos3);
     fill(0);
     stroke(255);
     strokeWeight(2);
     triangle(_xpos1 + 10, _ypos1 - 5, _xpos2, _ypos2 + 10, _xpos3 - 10, _ypos3 - 5);
    }
    
////////////////////////////////////////////
}
    

//////////////////////////////////////////////    
    //135, 680, 155, 650, 175, 680)
    void click() {

    if (mouseX > _xpos1  &&
      mouseX < _xpos3  &&
      mouseY > _ypos2 &&
      mouseY < _ypos1) {
      trigger = !trigger;
    }
  }
/////////////////////////////////////////////  
  
//////////////////////////  
  void move() {
//////////////////////////      
    //Triangle

    if (trigger && _triggerType == "smallTriangle") {
   
     fill(0);
     stroke(r, g, b);
     strokeWeight(3);
     triangle(_xpos1, _ypos1, _xpos2, _ypos2, _xpos3, _ypos3);
       fill(0);
     stroke(r, g, b);
     strokeWeight(3);
     triangle(_xpos1 + 10, _ypos1 - 5, _xpos2, _ypos2 + 10, _xpos3 - 10, _ypos3 - 5);
    } else {
    }

    if (trigger && _triggerType == "smallTriangle") {
     // triangles
     fill(r, g, b, 2);
     stroke(r, g, b);
     strokeWeight(abs(mouseX-pmouseX));
     triangle(mouseX - 150, mouseY + 150, mouseX, mouseY - 150, mouseX + 150, mouseY + 150); //Large triangle
     stroke(r, g, b);
     triangle(mouseX - 5, mouseY + 10, mouseX, mouseY, mouseX + 5, mouseY + 10); // Repeating Growing triangle
     triangle(mouseX - 75, mouseY + 75, mouseX, mouseY - 75, mouseX + 75, mouseY + 75); //Largest Growing triangle
     } else {
     }
     
     /////////////////////////////////////////////////////////////////////////////////
     //Small Triangle
     
     if (trigger && _triggerType == "triangle") {
   
     fill(0);
     stroke(r, g, b);
     strokeWeight(3);
     triangle(_xpos1, _ypos1, _xpos2, _ypos2, _xpos3, _ypos3);
       fill(0);
     stroke(r, g, b);
     strokeWeight(2);
     triangle(_xpos1 + 10, _ypos1 - 5, _xpos2, _ypos2 + 10, _xpos3 - 10, _ypos3 - 5);
    } else {
    }

    if (trigger && _triggerType == "triangle") {
     // triangles
     fill(r, g, b, 2);
     stroke(r, g, b);
     strokeWeight(abs(mouseX-pmouseX));
     triangle(mouseX - 75, mouseY + 75, mouseX, mouseY - 75, mouseX + 75, mouseY + 75); //Large triangle
     stroke(r, g, b);
     triangle(mouseX - 2.5, mouseY + 5, mouseX, mouseY, mouseX + 2.5, mouseY + 5); // Repeating Growing triangle
     triangle(mouseX - 37.5, mouseY + 37.5, mouseX, mouseY - 37.5, mouseX + 37.5, mouseY + 37.5); //Largest Growing triangle
     } else {
     }
     
////////////////////////////////////     
  }
/////////////////////////////////    
    
}




