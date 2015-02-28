
class Robot {
  //properties x, y
  int x2=150; //Body
  int y2=300; //Body

  int x= x2+50; //Head and Neck
  int y= y2-150; //Head and Neck
  int d= 10; //Diameter of Eye


  //constructor
  //gets called when you first make robot
  Robot (int tempx2, int tempy2) {
    x2 = tempx2;
    y2 = tempy2;
    x= x2+50; //Head and Neck
  y= y2-150; //Head and Neck
  
    println("new robot");
  }

  //functions
  //things the robot can do move, display

  void move () {
    x=mouseX; 
    y=mouseY; 



    if (keyPressed && (key == CODED)) { // Move Robot left and right
      if (keyCode == LEFT) { 
        x2--;
      } 
      else if (keyCode == RIGHT) { 
        x2++;
      }
    }

    if (keyPressed && (key == CODED)) { // Move Robot up and down
      if (keyCode == UP) { 
        y2--;
      } 
      else if (keyCode == DOWN) {
        y2++;
      }
    }
  }

  void display () {
    //NECK
    strokeWeight (3);
    fill (46, 46, 46);
    triangle (x2+50, y2, x-30, y+50, x+30, y+50);

    //ANTANNEA

    //antennaeHeight= map(mouseY,0,-400,20,60);
    strokeWeight (1);
    line (x, y-60, x, y-80);
    fill (0, 255-x, x);
    quad (x, y-90, x+5, y-85, x, y-80, x-5, y-85);

    //HEAD
    fill (100, 100, 100);
    strokeWeight(2);
    ellipse (x, y, 120, 120); //main shape
    strokeWeight(1);
    //mouth
    fill (255, 255, 255);
    for (int i= 170; i<225; i+=10) { //upper teeth
      rect (x-i+190, y+10, 10, 10);
    }

    for (int i= 170; i<225; i+=10) { //lower teeth
      rect (x-i+190, y+20, 10, 10);
    }


    //eyes
    strokeWeight (2);
    fill (255, 18, 50);
    ellipse (x-20, y-20, d, d); //left eye
    strokeWeight (3);
    fill (0, x, 255-x); //changing colour
    quad (x+20, y-40, x+40, y-20, x+20, y, x, y-20); //right eye
    //ears
    strokeWeight (1);
    //left ear
    line (x+60, y, x+70, y-10);
    line (x+70, y-10, x+80, y);
    line (x+80, y, x+90, y-10);
    //right ear
    line (x-60, y, x-70, y-10);
    line (x-70, y-10, x-80, y);
    line (x-80, y, x-90, y-10);

    //WHEELS
    fill (46, 46, 46);
    ellipse (x2+20, y2+70, 20, 20); //left
    ellipse (x2+80, y2+70, 20, 20); //right

    fill (0, 0, 0);
    ellipse (x2+20, y2+70, 5, 5); //inner left
    ellipse (x2+80, y2+70, 5, 5); //inner right

    //ARMS
    fill (46, 46, 46);
    //left arm
    beginShape ();
    vertex (x2, y2+20);
    vertex (x2, y2+30);
    vertex (x2-20, y2+30);
    vertex (x2-20, y2+40);
    vertex (x2-30, y2+40);
    vertex (x2-30, y2+20);
    vertex (x2, y2+20);
    endShape ();
    //right arm
    beginShape ();
    vertex (x2+100, y2+20);
    vertex (x2+100, y2+30);
    vertex (x2+120, y2+30);
    vertex (x2+120, y2+40);
    vertex (x2+130, y2+40);
    vertex (x2+130, y2+20);
    vertex (x2+100, y2+20);
    endShape (); 

    //BODY
    fill (100, 100, 100);
    strokeWeight(2);
    rect (x2, y2, 100, 60); //main body
    fill (46, 46, 46);
    rect (x2+30, y2+20, 40, 20); //inner rect
    //response
    if (mousePressed) {
      fill (106, 15, 206);
      ellipse (x2+15, y2+10, 10, 10); //left top corner button
      ellipse (x2+15, y2+50, 10, 10); //left bottom corner button
      ellipse (x2+85, y2+10, 10, 10); //right top corner button
      ellipse (x2+85, y2+50, 10, 10); //right bottom corner button
      quad (x2+50, y2+5, x2+55, y2+10, x2+50, y2+15, x2+45, y2+10); //top quad button
      quad (x2+50, y2+45, x2+55, y2+50, x2+50, y2+55, x2+45, y2+50); //bottom quad button
      quad (x+20, y-40, x+40, y-20, x+20, y, x, y-20); //right eye
      quad (x, y-90, x+5, y-85, x, y-80, x-5, y-85); //antannae quad


      //buttons
    } 
    else {
      fill (48, 224, 49);
      ellipse (x2+15, y2+10, 10, 10); //left top corner button
      ellipse (x2+15, y2+50, 10, 10); //left bottom corner button
      ellipse (x2+85, y2+10, 10, 10); //right top corner button
      ellipse (x2+85, y2+50, 10, 10); //right bottom corner button

      fill (18, 59, 255);
      quad (x2+50, y2+5, x2+55, y2+10, x2+50, y2+15, x2+45, y2+10); //top quad button
      quad (x2+50, y2+45, x2+55, y2+50, x2+50, y2+55, x2+45, y2+50); //bottom quad button
    }
  }
}


