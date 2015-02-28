

int score = 0;
int card = 1;
PFont font;

// images to display on cards
PImage card_1;
PImage card_2;
PImage card_3;
PImage card_4;
PImage card_5;
PImage card_6;
PImage card_7;
PImage card_8;
PImage card_9;
PImage card_10;







boolean move = true;

void setup() {
  size(480,320);
  smooth();
  font = loadFont("Poornut-50.vlw");
  textFont(font);
  
  // load images
  card_1 = loadImage("1.png");
  card_2 = loadImage("2.png");
  card_3 = loadImage("3.png");
  card_4 = loadImage("4.png");
  card_5 = loadImage("5.png");
  card_6 = loadImage("6.png");
  card_7 = loadImage("7.png");
  card_8 = loadImage("8.png");
  card_9 = loadImage("9.png");
  card_10 = loadImage("10.png");
  

  
}

void draw() {
  //background(255);
  
  if (card == 1) { // beginning of card 1
    background(0);
    
    fill(255);
    image(card_1, 0, 0);
    
    // left button
    fill(255);
    ellipse(240,150 ,100,100);
    
    text(score, width-40, 40);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 240, 150);
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
    fill(0, 255, 0);
    rect(110, 260,50 , 50);
    
  
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY,110 ,260 );
      if (d < 50) {
        card = 5;
        move = false;
      }
    } // end of left button
    
  // right button
    fill(255, 0, 255);
    rect(320, 260, 50, 50);
    
  
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY,320,260);
      if (d < 25) {
        card = 1;
        move = false;
      }
    } // end of r button 
    
  } // end of card 2
  
 
    else if (card == 5) { // beginning of card 5
    background(0);
    
    fill(255);
    image(card_5, 0, 0);
    
    // left button
    fill(255, 0, 0);
    rect(110, 260, 50, 50);
    
    text(score+25, width-60, 40);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 110, 260);
      if (d < 50) {
        card = 3;
        move = false;
      }
    } // end of left button
    
  // right button
    fill(255, 0, 255);
    rect(320, 260, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY,320, 260);
      if (d < 25) {
        card = 1;
        move = false;
      }
    } // end of r button 
    
  }//end of card 5
  
    else if (card == 3) { // beginning of card 3
    background(0);
    
    fill(255);
    image(card_3, 0, 0);
    
    // left button
    fill(0, 0, 255);
    rect(110, 260, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 110, 260);
      if (d < 40) {
        card = 4;
        move = false;
      }
    } // end of left button
    
  // right button
    fill(0, 255, 0);
    rect(320, 260, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY,320, 260);
      if (d < 40) {
        card = 1;
        move = false;
      }
    } // end of right button 
   
  }//end of card 3
  
      else if (card == 4) { // beginning of card 4
    background(0);
    
    fill(255);
    image(card_4, 0, 0);
    
    // left button
    fill(255, 0, 255);
    rect(110, 260, 50, 50);
    
    text(score+50, width-60, 40);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 110, 260);
      if (d < 40) {
        card = 9;
        move = false;
      }
    } // end of left button
    
    
 // right button
   fill(255, 0, 0);
    rect(320, 260, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY,320, 260);
      if (d < 40) {
        card = 1;
        move = false;
      }
    } // end of r button 
   
  }//end of card 4
  

//10
    else if (card == 9) { // beginning of card 9
    background(0);
    
    fill(255);
    image(card_9, 0, 0);
    
    // left button
    fill(255, 0, 0);//red
    rect(110, 260, 50, 50);
    
    text(score+75, width-60, 40);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 110, 260);
      if (d < 40) {
        card = 6;
        move = false;
      }
    } // end of left button
    
     
////  // right button
    fill(134, 0, 220);//magenta
    rect(320, 260, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY,320, 260);
      if (d < 40) {
        card = 1;
        move = false;
      }
    } // end of r button 
   
  }//end of card 10
  
    else if (card == 6) { // beginning of card 6
    background(0);
    
    fill(255);
    image(card_6, 0, 0);
    
    // left button
    fill(255, 165, 0);//orange.
    rect(110, 260, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 110, 260);
      if (d < 50) {
        card = 7;
        move = false;
      }
    } // end of left button
    
     
  // right button
   fill(0, 255, 0);//green.
   rect(320, 260, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY,320, 260);
      if (d < 40) {
        card = 1;
        move = false;
      }
    } // end of r button 
   
  }//end of card 6
  
  
      else if (card == 7) { // beginning of card 7
    background(0);
    
    fill(255);
    image(card_7, 0, 0);
    
    // left button
    fill(255, 255, 0);//yellow
    rect(110, 260, 50, 50);
    
    text(score+100, width-80, 40);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 110, 260);
      if (d < 50) {
        card = 8;
        move = false;
      }
    } // end of left button
    
  // right button
    fill(0, 0, 255);//blue
    rect(320, 260, 50, 50);
    
    if (mousePressed && move) {
      float d = dist(mouseX, mouseY,320, 260);
      if (d < 50) {
        card = 1;
        move = false;
      }
    } // end of r button 
    
  }//end of card 7
  
        else if (card == 8) { // beginning of card 8
    background(0);
    
    fill(255);
    image(card_8, 0, 0);

  // left button
  fill(255);
rect(400, 130, 50, 50);

text(score+105, width-80, 40);
//    
if (mousePressed && move) {
 float d = dist(mouseX, mouseY, 400,130);
      if (d < 50) {
        card = 1;
       move = false;
      }
    } // end of left button
////    
//// right button
//   fill(134, 0, 220);
//   ellipse(400, 400, 100, 100);
////   
//   if (mousePressed && move) {
//     float d = dist(mouseX, mouseY,400, 400);
//     if (d < 50) {
//       card = 6;
//      move = false;
//    }
//    } // end of r button 
//    
 }//end of card 8



    
  

//***************************************************************** 
}  
//gets called every time mouse is released
void mouseReleased(){
  move = true;
}



