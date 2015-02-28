
PImage p1;

PImage p2;
PImage p2_1;
PImage p2_2;
PImage p2_3;
PImage p2_4;
PImage p2_6;
PImage p2_7;

PImage p3_1;
PImage p3_2;
PImage p3_3;
PImage p3_4;
PImage p3_5;
PImage p3_6;
PImage p3_7;

PImage p4_1;
PImage p4_2;
PImage p4_3;
PImage p4_4;
PImage p4_5;
PImage p4_6;
PImage p4_7;

PImage p5_1;
PImage p5_2;
PImage p5_3;
PImage p5_3a;
PImage p5_4;

PImage p6_1;
PImage p6_2;
PImage p6_3;
PImage p6_4;

PImage p7_1;
PImage p7_2;
PImage p7_2a;
PImage p7_3;
PImage p7_4;
PImage p7_5;
PImage p7_6;

PImage p8;

PImage p9;
PImage p9_1;
PImage p9_2;
PImage p9_3;
PImage p9_4;
PImage p9_5;

PImage p10;
PImage p10_1;
PImage p10_2;

PImage p11;

PImage p12;
PImage p12_1;
PImage p12_2;
PImage p12_3;

PImage p13;



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

int page = 1;   // Current page, this is the most important variable in the code
int value;

PFont font;
String letters = "";
float angle = 0.0;
float csize;
//String[] words = { "Take care of the sense" };
//rect(b1x, b1y, b1w+1, b1h)

int b1x = 50;   // Button 1 x-coordinate
int b1y = 40;  // Button 1 y-coordinate
int b1w = 200;  // Button 1 width
int b1h = 300;   // Button 1 height

int b2x = 400;  // Button 2
int b2y = 200;
int b2w = 200;
int b2h = 200;

int b3x = 405;  // Button 3
int b3y = 262;
int b3w = 200;
int b3h = 40;


int b4x = 430;  // Button 4
int b4y = 290;
int b4w = 130;
int b4h = 40;


int b5x = 420;  // Button 5
int b5y =360;
int b5w = 200;
int b5h = 40;

int b6x = 390;// Button 6
int b6y = 154;
int b6w = 200;
int b6h = 40;


int b7x = 382;  // Button 7
int b7y = 121;
int b7w = 130;
int b7h = 40;


int b8x = 453;  // Button 8
int b8y = 48;
int b8w = 200;
int b8h = 40;


int b9x = 200;  // Button 9
int b9y = 350;
int b9w = 300;
int b9h = 60;

int b10x = 35;  // Button 10
int b10y = 413;
int b10w = 136;
int b10h = 15;

int b11x = 35;  // Button 11
int b11y = 440;
int b11w = 136;
int b11h = 15;

int b12x = 435;  // Button 11
int b12y = 400;
int b12w = 120;
int b12h = 40;

int startTime = 0; 
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// You can define more buttons here following the same pattern

void setup() {
  p1= loadImage("alice_page1.png");

  p2= loadImage("alice_page2_1.png");
  p2_2= loadImage("alice_page2_2.png");
  p2_3= loadImage("alice_page2_3.png");
  p2_4= loadImage("alice_page2_4.png");
  p2_6= loadImage("alice_page2_6.png");
  p2_7= loadImage("alice_page2_7.png");

  /////////////////////////////////////////
  p3_1= loadImage("alice_page3_1.png");
  p3_2= loadImage("alice_page3_2.png");
  p3_3= loadImage("alice_page3_3.png");
  p3_4= loadImage("alice_page3_4.png");
  p3_5= loadImage("alice_page3_5.png");
  p3_6= loadImage("alice_page3_6.png");
  p3_7= loadImage("alice_page3_7.png");

  ////////////////////////////////////////
  p4_1= loadImage("alice_page4_1.png");
  p4_2= loadImage("alice_page4_2.png");
  p4_3= loadImage("alice_page4_3.png");
  p4_4= loadImage("alice_page4_4.png");
  p4_5= loadImage("alice_page4_5.png");
  p4_6= loadImage("alice_page4_6.png");
  p4_7= loadImage("alice_page4_7.png");

  ////////////////////////////////////////
  p5_1= loadImage("alice_page5_1.png");
  p5_2= loadImage("alice_page5_2.png");
  p5_3= loadImage("alice_page5_3.png");
  p5_3a= loadImage("alice_page5_3a.png");
  p5_4= loadImage("alice_page5_4.png");
  ///////////////////////////////////////
  p6_1= loadImage("alice_page6_1.png");
  p6_2= loadImage("alice_page6_2.png");
  p6_3= loadImage("alice_page6_3.png");
  p6_4= loadImage("alice_page6_4.png");
  ///////////////////////////////////////
  p7_1= loadImage("alice_page7_1.png");
  p7_2= loadImage("alice_page7_2.png");
  p7_2a= loadImage("alice_page7_2a.png");
  p7_3= loadImage("alice_page7_3.png");
  p7_4= loadImage("alice_page7_4.png");
  p7_5= loadImage("alice_page7_5.png");
  p7_6= loadImage("alice_page7_6.png");
  /////////////////////////////////////////
  p8= loadImage("alice_page8.png");
  /////////////////////////////////////
  p9= loadImage("alice_page9.png");
  p9_1= loadImage("alice_page9_1.png");
  p9_2= loadImage("alice_page9_2.png");
  p9_3= loadImage("alice_page9_3.png");
  p9_4= loadImage("alice_page9_4.png");
  p9_5= loadImage("alice_page9_5.png");
  ///////////////////////////////////
  p10= loadImage("alice_page10.png");
  p10_1= loadImage("alice_page10_1.png");
  p10_2= loadImage("alice_page10_2.png");
  //////////////////////////////
  p11= loadImage("alice_page11.png");
  /////////////////////////////
  p12= loadImage("alice_page12.png");
  p12_1= loadImage("alice_page12_1.png");
  p12_2= loadImage("alice_page12_2.png");
  p12_3= loadImage("alice_page12_3.png");
  ////////////////////////////
  p13= loadImage("alice_page13.png");
  //////////////////////////////////
  ///////////////////////////////
  ////////////////////
  size(640, 480); 
  smooth();
  font = loadFont("Arial-BoldMT-48.vlw");
  textFont(font);
  startTime = millis(); 
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
void draw() {

  if (page == 1) {
    pageOne();
   // if (millis() > startTime + 6000) { 
     // page = 2; 
    //} 
  } 
  else if (page == 2) {
    pageTwo(); 
  } 
  else if (page == 3) {
    pageThree(); 

  } 
  else if (page == 4) {
    pageFour();
  } 
  else if (page == 5) {
    pageFive(); 
    text(letters, 300, 350);

    //     if (key == 'y') {  
    //   text("Y",200,200);
    //  } 
    //   
    //    if (key == 'e') {  
    //    text("E",250,200);  
    //  }  
    //   
    //   if (key == 's') {  
    //   text("S",300,200); 
    //     page = 8; 
    //} 

  } 
  else if (page == 6) {
    pageSix(); 


  } 
  else if (page == 7) {
    pageSeven(); 
  }
  else if (page == 8) {
    pageEight(); 
    // if (millis() > startTime + 20000) { 
    // page = 9; 
    // } 
  }
  else if (page == 9) {
    pageNine(); 
  }
  else if (page == 10) {
    pageTen(); 
  }
  else if (page == 11) {
    pageEleven(); 
  }
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
void mouseMoved() {
  value = mouseX;

}
////////////////////////////////////
void keyPressed() {
  if(page ==5 ){ 
    if (key == BACKSPACE) { 
      if (letters.length() > 0) {
        letters = letters.substring(0, letters.length()-1);
      }
    } 
    else if (textWidth(letters+key) < width){
      letters = letters+key;
      if (letters.equals("yes")) {
        page = 8;
      } 
    }
  }

  //  if ((key == ENTER) || (key == RETURN)) {
  //    letters = letters.toLowerCase();
  //    println(letters); // Print to console to see input
  //    if (letters.equals("yes")) {
  //      page = 8;
  //    } 
  //  }
  //}
}
////////////////////////////////////////    
void mousePressed() {
  if (page == 1) {
 page =2;
  }
  ////
  else if (page == 2) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 3; 
    } 
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 4;
    }
  }
  ////
  else if (page == 3) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 5; 
    } 
    else if (overButton(b4x, b4y, b4w, b4h) == true) {
      page = 6;
    }
    else if (overButton(b5x, b5y, b5w, b5h) == true) {
      page = 7;
    }   
  }  
  ////
  else if (page == 4) {
    if (overButton(b6x, b6y, b6w, b6h) == true) {
      page = 5; 
    } 
    else if (overButton(b7x, b7y, b7w, b7h) == true) {
      page = 6;
    }
    else if (overButton(b8x, b8y, b8w, b8h) == true) {
      page = 7;
    }   
  }  
  /////
  else if (page == 5) {
  }  

  /////
  else if (page == 6) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 8; 
    } 
  }  

  /////
  else if (page == 7) {
    if (overButton(b9x, b9y, b9w, b9h) == true) {
      page = 8; 
    } 
  }  
  /////
  else if (page == 8) {
    
      page = 9; 
   
  }  
  /////
  else if (page == 9) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 10; 
    } 
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 11;
    }

  }  
  /////
  else if (page == 10) {
    if (overButton(b12x, b12y, b12w, b12h) == true) {
      page = 2; 
    }
  }  
  /////

  else if (page == 11) {
    if (overButton(b10x, b10y, b10w, b10h) == true) {
      page = 2; 
    } 
    else if (overButton(b11x, b11y, b11w, b11h) == true) {
      page = 9;
    }

  }  
  /////
  /////
}//mouse pressed


////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// Check to see if the click happends over the button
boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true; 
  } 
  else {
    return false; 
  }
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// PAGE One

void pageOne() {
  background(0);
  image(p1,0,0);
  fill(0);
}

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// PAGE Two

void pageTwo() {
  background(255);
  image(p2,0,0);
  image(p2_2,0,0);
  image(p2_3,0,0);
  image(p2_7,0,0);



  ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//
  // Left Button - FROG FOOTMAN
  if (overButton(b1x, b1y, b1w, b1h) == true) {

    fill(255); 
  } 
  else {

    image(p2_4,0,0);
    fill(153); 
  }
  //rect(b1x, b1y, b1w, b1h);
  //  fill(0);
  ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//
  // Right Button - FISH FOOTMAN
  if (overButton(b2x, b2y, b2w, b2h) == true) {

    fill(255); 
  } 
  else {

    image(p2_6,0,0);
    fill(153); 
  }
  // rect(b2x, b2y, b2w, b2h);
  // fill(0);

}

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// PAGE Three

void pageThree() {
  background(255);
  image(p3_1,0,0);

  image(p3_2,0,0);
  image(p3_3,0,0);
  image(p3_4,0,0);

  ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//  
  // Crazy Pop Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(p3_5,0,0);

  } 
  else {
    fill(153); 
  }

  // rect(b3x, b3y, b3w, b3h);
  // fill(0);

  ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@// 
  // talkative Mom Button
  if (overButton(b4x, b4y, b4w, b4h) == true) {
    image(p3_6,0,0);
    fill(255); 
  } 
  else {
    fill(153); 
  }
  // rect(b4x, b4y, b4w, b4h);
  //fill(0);


  ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//
  // Stylistic Uncle Button
  if (overButton(b5x, b5y, b5w, b5h) == true) {
    image(p3_7,0,0);
    fill(255); 
  } 
  else {
    fill(153); 
  }
  //rect(b5x, b5y, b5w, b5h);
  //fill(0);

}


////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// PAGE Four

void pageFour() {
  background(255);
  image(p4_1,0,0);

  image(p4_2,0,0);
  image(p4_3,0,0);
  image(p4_4,0,0);



  ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//  
  // Crazy Pop Button
  if (overButton(b6x, b6y, b6w, b6h) == true) {
    image(p4_5,0,0);

  } 
  else {
    fill(153); 
  }

  // rect(b6x, b6y, b6w, b6h);
  // fill(0);

  ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@// 
  // talkative Mom Button
  if (overButton(b7x, b7y, b7w, b7h) == true) {
    image(p4_6,0,0);
    fill(255); 
  } 
  else {
    fill(153); 
  }
  // rect(b7x, b7y, b7w, b7h);
  //fill(0);


  ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//
  // Stylistic Uncle Button
  if (overButton(b8x, b8y, b8w, b8h) == true) {
    image(p4_7,0,0);
    fill(255); 
  } 
  else {
    fill(153); 
  }
  //rect(b8x, b8y, b8w, b8h);
  //fill(0);

}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// PAGE Five 
//*Talkative Mother*

void pageFive() {
  background(255);
  image(p5_3,0,0);
  image(p5_1,0,0);
  image(p5_2,0,0);
  image(p5_3a,0,0);   
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// PAGE six
//*Crazy Pop*
void pageSix() {
  background(255);
  image(p6_1,0,0);
  image(p6_3,0,0);

  angle += 0.07;
  pushMatrix();
  translate(240, 200);
  scale((cos(angle / 4.0) + 1.2) * 1.0);
  rotate(angle);
  image(p6_2,0,0);
  popMatrix();

  // rect(b1x, b1y, b1w, b1h);
  // fill(150);

  // image(p6_2,mouseX,mouseY);
  //image(p6_2,0,0);
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// PAGE Seven
//*Stylistic Uncle*
void pageSeven() {
  background(255);
  image(p7_1,0,0);


  image(p7_3,0,0);
  image(p7_4,0,0);
  image(p7_5,0,0);

  float x = mouseX;
  float ix = width - mouseX; // Inverse X
  noStroke();
  fill(255, 150);
  ellipse(x, 210, 150, 150);
  fill(0, 159);
  ellipse(ix, 210, 150, 150);

  if (overButton(b9x, b9y, b9w, b9h) == true) {
    image(p7_2a,0,0);
  } 
  else {
    image(p7_2,0,0);
  }



}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// PAGE Eight

void pageEight() {
  background(0);
  image(p8,0,0);
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// PAGE Nine

////IF U CHOOSE FROG FOOT-MAN
void pageNine() {   
  background(255);
 
  
  image(p9_1,0,0);
  image(p9_2,0,0);
  image(p9_3,0,0);

  ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//  
  // FROG Bottle 1
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(255); 
  } 
  else {
    image(p9_4,0,0);
    fill(153); 
  }
  // rect(b1x, b1y, b1w, b1h);
  //  fill(0);

  ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//  
  // FROG Bottle 2
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    fill(255); 
  } 
  else {
    image(p9_5,0,0);
    fill(153); 
  }
  //  rect(b2x, b2y, b2w, b2h);
  //  fill(0);

}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// PAGE Ten

////IF U CHOOSE FROG FOOT-MAN
void pageTen() {
  background(255);
  image(p10,0,0);


  if (overButton(b12x, b12y, b12w, b12h) == true) {
    image(p10_2,400,0);
  } 
  else {
    image(p10_1,400,0);
  }



}


////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
// PAGE Eleven

////IF U CHOOSE FROG FOOT-MAN
void pageEleven() {
  background(255);
  image(p12,0,0);


  if (overButton(b10x, b10y, b10w, b10h) == true) {
    image(p12_2,0,0);
  } 
  else if (overButton(b11x, b11y, b11w, b11h) == true) {
    image(p12_3,0,0);
  } 
  else {
    image(p12_1,0,0);
  }
}







