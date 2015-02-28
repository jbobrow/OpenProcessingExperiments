


int card = 1;
PFont font;

// images to display on cards
PImage card_1;
PImage card_2;
PImage card_33;
PImage card_4;
PImage card_5;
PImage card_6;
PImage card_7;
PImage card_8;
PImage card_9;
PImage card_10;
PImage card_0;






boolean move = true;

void setup() {
  size(640, 480);
  smooth();
  font = loadFont("MarkerFelt-Wide-30.vlw");
  textFont(font);
  
  // load images
  card_1 = loadImage("slide1.png");
  card_2 = loadImage("Slide2.png");
  card_33 = loadImage("33.png");
  card_4 = loadImage("Slide4.png");
  card_5 = loadImage("Slide5.png");
  card_6 = loadImage("Slide6.png");
  card_7 = loadImage("Slide7.png");
  card_8 = loadImage("Slide8.png");
  card_9 = loadImage("Slide9.png");
  card_10 = loadImage("Slide10.png");
  card_0= loadImage("Slide0.png");

  
}

void draw() {
  //background(255);
  
  if (card == 1) { // beginning of card 1
    background(0);
    
    fill(255);
    image(card_1, 0, 0);
    
    // left button
    fill(255, 0, 0);
    ellipse(200, 400, 80, 80);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 200, 400);
      if (d < 50) {
        card = 2;
        move = false;
      }
    } // end of left button
    
   
//  // right button
//    fill(134, 0, 220);
//    ellipse(400, 400, 100, 100);
//    
//    if (mousePressed && move) {
//      float d = dist(mouseX, mouseY,400, 400);
//      if (d < 50) {
//        card = 2;
//        move = false;
//      }
//    } // end of r button 
    
  } // end of card 1
  else if (card == 2) { // beginning of card 2
    background(0);
    
    fill(255);
    image(card_2, 0, 0);
    
    // left button
    fill(255, 0, 0);
    ellipse(180, 370, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY,180 ,360 );
      if (d < 40) {
        card = 7;
        move = false;
      }
    } // end of left button
    
  // right button
    fill(255, 0, 0);
    ellipse(440, 370, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY,440,360);
      if (d < 40) {
        card = 0;
        move = false;
      }
    } // end of r button 
    
  } // end of card 2
  
 
    else if (card == 7) { // beginning of card 7
    background(0);
    
    fill(255);
    image(card_7, 0, 0);
    
    // left button
    fill(255, 0, 0);
    ellipse(200, 340, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 200, 340);
      if (d < 30) {
        card = 8;
        move = false;
      }
    } // end of left button
    
  // right button
    fill(255, 0, 0);
    ellipse(440, 340, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY,440, 340);
      if (d < 25) {
        card = 0;
        move = false;
      }
    } // end of r button 
    
  }//end of card 7
  
    else if (card == 8) { // beginning of card 8
    background(0);
    
    fill(255);
    image(card_8, 0, 0);
    
    // left button
    fill(255, 0, 0);
    ellipse(220, 360, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 220, 360);
      if (d < 40) {
        card = 9;
        move = false;
      }
    } // end of left button
    
  // right button
    fill(255, 0, 0);
    ellipse(430, 360, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY,430, 360);
      if (d < 25) {
        card = 10;
        move = false;
      }
    } // end of right button 
   
  }//end of card 8
  
      else if (card == 9) { // beginning of card 9
    background(0);
    
    fill(255);
    image(card_9, 0, 0);
    
    // left button
    fill(255, 0, 0);
    ellipse(width/2, 440, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, width/2, 440);
      if (d < 40) {
        card = 1;
        move = false;
      }
    } // end of left button
    
    //take off button.
////  // right button
//    fill(134, 0, 220);
//    ellipse(400, 400, 50, 50);
//    
//    if (mousePressed && move) {
//      float d = dist(mouseX, mouseY,400, 400);
//      if (d < 40) {
//        card = 1;
//        move = false;
//      }
//    } // end of r button 
   
  }//end of card 9
  
  //*add card 0
  
    else if (card == 0) { // beginning of card 0
    background(0);
    
    fill(255);
    image(card_0, 0, 0);
    
    // left button
    fill(255, 0, 0);
    ellipse(width/2, 400, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, width/2, 400);
      if (d < 40) {
        card = 1;
        move = false;
      }
    } // end of left button
    
    //turn off button. 
////  // right button
//    fill(134, 0, 220);
//    ellipse(400, 400, 50, 50);
//    
//    if (mousePressed && move) {
//      float d = dist(mouseX, mouseY,400, 400);
//      if (d < 40) {
//        card = 10;
//        move = false;
//      }
//    } // end of r button 
   
  }//end of card 0
  
    else if (card == 10) { // beginning of card 10
    background(0);
    
    fill(255);
    image(card_10, 0, 0);
    
    // left button
    fill(255, 0, 0);
    ellipse(width/2, 420, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, width/2, 420);
      if (d < 50) {
        card = 1;
        move = false;
      }
    } // end of left button
    
    //take out right button. 
////  // right button
//    fill(134, 0, 220);
//    ellipse(400, 400, 50, 50);
//    
//    if (mousePressed && move) {
//      float d = dist(mouseX, mouseY,400, 400);
//      if (d < 40) {
//        card = 1;
//        move = false;
//      }
//    } // end of r button 
   
  }//end of card 10
  
  
//      else if (card == 5) { // beginning of card 5
//    background(0);
//    
//    fill(255);
//    image(card_2, 0, 0);
//    
//    // left button
//    fill(255, 255, 0);
//    ellipse(280, 400, 100, 100);
//    
//    if (mousePressed && move) {
//      float d = dist(mouseX, mouseY, 280, 400);
//      if (d < 50) {
//        card = 5;
//        move = false;
//      }
//    } // end of left button
//    
//  // right button
//    fill(134, 0, 220);
//    ellipse(400, 400, 100, 100);
//    
//    if (mousePressed && move) {
//      float d = dist(mouseX, mouseY,400, 400);
//      if (d < 50) {
//        card = 5;
//        move = false;
//      }
//    } // end of r button 
//    
//  }//end of card 5
//  
//        else if (card == 6) { // beginning of card 6
//    background(0);
//    
//    fill(255);
//    image(card_2, 0, 0);
//    
//    // left button
//    fill(255, 255, 0);
//    ellipse(280, 400, 100, 100);
//    
//    if (mousePressed && move) {
//      float d = dist(mouseX, mouseY, 280, 400);
//      if (d < 50) {
//        card = 6;
//        move = false;
//      }
//    } // end of left button
//    
//  // right button
//    fill(134, 0, 220);
//    ellipse(400, 400, 100, 100);
//    
//    if (mousePressed && move) {
//      float d = dist(mouseX, mouseY,400, 400);
//      if (d < 50) {
//        card = 6;
//        move = false;
//      }
//    } // end of r button 
//    
//  }//end of card 6
//  
//    else if (card == 7) { // beginning of card 7
//    background(0);
//    
//    fill(255);
//    image(card_2, 0, 0);
//    
//    // left button
//    fill(255, 255, 0);
//    ellipse(280, 400, 100, 100);
//    
//    if (mousePressed && move) {
//      float d = dist(mouseX, mouseY, 280, 400);
//      if (d < 50) {
//        card = 7;
//        move = false;
//      }
//    } // end of left button
//    
//  // right button
//    fill(134, 0, 220);
//    ellipse(400, 400, 100, 100);
//    
//    if (mousePressed && move) {
//      float d = dist(mouseX, mouseY,400, 400);
//      if (d < 50) {
//        card = 7;
//        move = false;
//      }
//    } // end of r button 
//    
//  }//end of card 7
//  
//   else if (card == 8) { // beginning of card 8
//    background(0);
//    
//    fill(255);
//    image(card_2, 0, 0);
//    
//    // left button
//    fill(255, 255, 0);
//    ellipse(280, 400, 100, 100);
//    
//    if (mousePressed && move) {
//      float d = dist(mouseX, mouseY, 280, 400);
//      if (d < 50) {
//        card = 8;
//        move = false;
//      }
//    } // end of left button
//    
//  // right button
//    fill(134, 0, 220);
//    ellipse(400, 400, 100, 100);
//    
//    if (mousePressed && move) {
//      float d = dist(mouseX, mouseY,400, 400);
//      if (d < 50) {
//        card = 8;
//        move = false;
//      }
//    } // end of r button 
//    
//  }//end of card 8
//  
  
//  else if (card == 1) {
//    background(0);
//    
//    fill(255);
//    text("Litte Red Riding-Hood is given her Hood.", 50, 100);
//
//    fill(255, 255, 0);
////    text("She puts Hood On?", 100, 400);
//    
//    
//    rect(145, 425, 75, 30);
//    rect(345, 425, 55, 30);
//    
//    fill(0);
//
//    text("She Puts Hood On", 350, 450);
//    
//    
//    
//    int left = 145;
//    int right = 220;
//    int top = 425;
//    int bottom = 455;
//    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
//      if (mousePressed) {
//        card = 3;
//      } else {
//        fill(255, 0, 255);
//      }
//    }
//    text("She Forgets to Put Hood On.", 150, 450);
//
//
//    
//    left = 345;
//    right = 400;
//    top = 425;
//    bottom = 455;
//    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
//      card = 4;
//    }
//  } 

  else if (card == 2) {
    background(100);
    
    
    fill(255);
    text("Welcome to card 2", 200, 100);

    
    
  } else if (card == 3) {
    background(150);
    
    fill(255);
    text("Welcome to card 3", 200, 100);  
  


  } else if (card == 4) {
    background(200);
    
  } else if (card == 5) {
    background(250);
    
  }
}  
//gets called every time mouse is released
void mouseReleased(){
  move = true;
}



