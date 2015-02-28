
String typedText = "1 2 3 4 5 6 7 8 9 10";

PFont font;
boolean showEllipse_1 = false;
boolean showEllipse_2 = false;
boolean showEllipse_3 = false;
boolean showEllipse_4 = false;
boolean showEllipse_5 = false;
boolean showEllipse_6 = false;
boolean showEllipse_7 =false;
boolean showEllipse_8 =false;
boolean showEllipse_9 =false;
boolean showLines_9 =false;
boolean showEllipse_10 =false;
boolean showLines_10 =false;
boolean showLines_11 =false;

boolean showEllipses = true;
boolean showLines = true;

int counter = 0;
int blinkingCounter = 0;

void setup() {
  size(1800, 700);
  smooth();
  font = createFont("Helvetica", 1);
}


//Draw function is a loop. It starts { and ends with }
void draw() {
  counter=counter+1;
  blinkingCounter = blinkingCounter+1;
  //  println(counter);
  background(0);
  stroke(153);
  strokeWeight(3.5);

  fill(255);
  textFont(font, 30);
  // this adds a blinking cursor after your text, at the expense of redrawing everything every frame
  // text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), 35, 45);

  //blinkingCounter is the counter for the blinking effect
  if (blinkingCounter == 2) {
    if (showEllipse_1 == false) {
      showEllipse_1 = true;
    }
    else {
      showEllipse_1= false;
    }
  }
  if (blinkingCounter == 3) {
    if (showEllipse_2 == false) {
      showEllipse_2 = true;
    }
    else {
      showEllipse_2= false;
    }
  }
  if (blinkingCounter == 4) {
    if (showEllipse_3 == false) {
      showEllipse_3 = true;
    }
    else {
      showEllipse_3= false;
    }

    if (blinkingCounter <= 5) {
      if (showEllipse_4 == false) {
        showEllipse_4 = true;
      }
      else {
        showEllipse_4= false;
      }
    }
    if (blinkingCounter <= 6) {
      if (showEllipse_5 == false) {
        showEllipse_5 = true;
      }
      else {
        showEllipse_5= false;
      }
    }
    if (blinkingCounter <= 7) {
      if (showEllipse_8 == false) {
        showEllipse_8 = true;
      }
      else {
        showEllipse_8= false;
      }
    }
    if (blinkingCounter == 8) {
      if (showEllipse_7 == false) {
        showEllipse_7 = true;
      }
      else {
        showEllipse_7= false;
      }
    }
    if (blinkingCounter == 9) {
      if (showEllipse_8 == false) {
        showEllipse_8 = true;
      }
      else {
        showEllipse_8= false;
      }
    }
    blinkingCounter=0;
    println("showEllipses="+showEllipses);
  }
  //counter is the counter for making the numbers appear progressively
  if (counter == 5) {
    //just checking the value ==
    //  showEllipses = !showEllipses;
    if (showEllipse_1 == false) {
      showEllipse_1 = true;
    }
  }
  if (counter == 10) {
    //just checking the value ==
    //  showEllipses = !showEllipses;
    if (showEllipse_2 == false) {
      showEllipse_2 = true;
    }
  }
  if (counter == 15) {
    if (showEllipse_3 == false) {
      showEllipse_3 = true;
    }
  }
  if (counter == 15) {

    if (showEllipse_4 == false) {
      showEllipse_4 = true;
    }
  }
  if (counter == 25) {
    if (showEllipse_5 == false) {
      showEllipse_5 = true;
    }
  }

  if (counter == 27) {
    if (showEllipse_6 == false) {
      showEllipse_6 = true;
    }
  }
  if (counter == 30) {
    if (showEllipse_7 == false) {
      showEllipse_7 = true;
    }
  }
  if (counter == 35) {
    if (showEllipse_8 == false) {
      showEllipse_8 = true;
    }
  }

  if (counter == 38) {
    if (showEllipse_9 == false) {
      showEllipse_9 = true;
    }
  } 
  if (counter == 40) {
    if (showLines_9 == false) {
      showLines_9 = true;
    }
  } 
  if (counter == 43) {
    //just checking the value ==
    //  showEllipses = !showEllipses;
    if (showEllipse_10 == false) {
      showEllipse_10 = true;
    }
  }
  if (counter ==46) {
    if (showLines_10==false) {
      showLines_10 =true;
    }
  }
  if (counter ==50) {
    if (showLines_11==false) {
      showLines_11 =true;
    }
  }
  if (showEllipse_1 == true ) {
    //one 
    ellipse(100, 150, 15, 15);
  }

  if (showEllipse_2 ==true) {
    //two
    ellipse(300, 150, 15, 15);
    ellipse(400, 150, 15, 15);
  }
  if (showEllipse_3 ==true) {
    //three
    ellipse(600, 150, 15, 15);
    ellipse(700, 150, 15, 15);
    ellipse(700, 250, 15, 15);
  }
  if (showEllipse_4 ==true) {
    //four
    ellipse(900, 250, 15, 15);
    ellipse(900, 150, 15, 15);
    ellipse(1000, 150, 15, 15);
    ellipse(1000, 250, 15, 15);
  }
  //five
  if (showEllipse_5 ==true) {
    rect(1197, 147, 100, 7);
    ellipse(1300, 250, 15, 15);
    ellipse(1300, 150, 15, 15);
    ellipse(1200, 250, 15, 15);
    ellipse(1200, 150, 15, 15);
  }
  //six
  if (showEllipse_6 ==true) {
    rect(95, 447, 100, 5);
    rect(97, 447, 5, 100);
    ellipse(100, 450, 15, 15);
    ellipse(100, 550, 15, 15);
    ellipse(200, 550, 15, 15);
    ellipse(200, 450, 15, 15);
  }
  //seven
  if (showEllipse_7 ==true) {
    rect(297, 447, 100, 5);
    rect(297, 447, 5, 100);
    rect(397, 447, 5, 100);
    ellipse(300, 450, 15, 15);
    ellipse(300, 550, 15, 15);
    ellipse(400, 450, 15, 15);
    ellipse(400, 550, 15, 15);
  }
  //eight
  if (showEllipse_8 ==true) {
    rect(597, 447, 5, 100);
    rect(597, 447, 100, 5);
    rect(697, 447, 5, 100);
    rect(597, 545, 100, 5);
    ellipse(700, 450, 15, 15);
    ellipse(700, 550, 15, 15);
    ellipse(600, 450, 15, 15);
    ellipse(600, 550, 15, 15);
  }
  // nine
  if (showEllipse_9 ==true) {
    rect(897, 445, 100, 5);
    rect(897, 445, 5, 100);
    rect(997, 447, 5, 100); 
    rect(900, 547, 100, 5);
    ellipse(1000, 550, 15, 15);
    ellipse(1000, 450, 15, 15);
    ellipse(900, 550, 15, 15);
    ellipse(900, 450, 15, 15);
  }
  if (showLines_9==true) {
    line (900, 450, 1000, 550);
  }
  //ten
  if (showEllipse_10==true) {
    rect(1197, 447, 100, 5);
    rect(1197, 547, 100, 5);
    rect(1297, 450, 5, 100);
    rect(1197, 447, 5, 100);
    ellipse(1200, 450, 15, 15);
    ellipse(1200, 550, 15, 15);
    ellipse(1300, 450, 15, 15);
    ellipse(1300, 550, 15, 15);
  }
  if (showLines_10 ==true) {
    line (1200, 450, 1300, 550);
  }
  if (showLines_11 ==true) {
    line (1200, 550, 1300, 450);
  }
  // noStroke();
  // fill(255, 0, 0);

  for (int i = 0; i < 20;  i++) {
    filter(i * BLUR, 1);
    stroke(0);
    fill(255, 255, 0);
  }
  //movements:
  // set a counter appear - draw one by one, blink, draw line, when all the dots are finish
  //add blinking and maybe loop when it stops to start again
}



