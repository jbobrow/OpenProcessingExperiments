
PImage slide1;
PImage slide1text1;
PImage slide1text2;
PImage slide2;
PImage slide2text1;
PImage slide2text2;
PImage slide3;
PImage slide3text1;
PImage slide3text2;
PImage slide4;
PImage slide4text1;
PImage slide4text2;
PImage slide5;
PImage slide5text1;
PImage slide5text2;
PImage slide6;
PImage slide6text1;
PImage slide6text2;
PImage slide6text3;
PImage slide6text4;
PImage slide6text5;
PImage slide6text6;
PImage slide7;
PImage slide7text1;
PImage slide7text2;
PImage slide8;
PImage slide8text1;
PImage slide8text2;
PImage slide8text3;
PImage slide8text4;
PImage slide9;
PImage slide9text1;
PImage slide10;
PImage slide10text1;
PImage slide11;
PImage slide11text1;
PImage slide11text2;
PImage slide12;
PImage slide12text1;
PImage slide12text2;
PImage slide13;
PImage slide13text1;
PImage slide13text2;
PImage slide14;
PImage slide14text1;
PImage slide15;
PImage slide15text1;
int slide = 1;
int timer = 0;
int timer2 = 0;
int timer3 = 0;
int timer4 = 0;
int timer5 = 0;
int timer6 = 0;
int timer7 = 0;
int timer8 = 0;
int timer9 = 0;
int timer10 = 0;
int timer11 = 0;
int timer12 = 0;
int timer13 = 0;
int timer14 = 0;
int i = 0;
int grow = 0;
int fade = 0;






//button Cheshire cat slide 1 to slide 2
int s1x = 92;
int s1y = 71;
int s1w = 115;
int s1h = 16;

//button Cheshire cat slide 1 to slide 3

int s2x = 408;
int s2y = 370;
int s2w = 165;
int s2h = 20;

//button Cheshire cat slide 2/3 to slide 4
int s3x = 0;
int s3y = 0;
int s3w = 640;
int s3h = 480;

//button Cheshire cat slide 4 to slide 5
int s4x = 338;
int s4y = 332;
int s4w = 42;
int s4h = 23;

//button Cheshire cat slide 4 to slide 6
int s5x = 422;
int s5y = 330;
int s5w = 53;
int s5h = 22;

//button Cheshire cat slide 4 to slide 7
int s6x = 302;
int s6y = 360;
int s6w = 55;
int s6h = 28;

//button Cheshire cat slide 8 to slide 9
int s7x = 281;
int s7y = 346;
int s7w = 284;
int s7h = 67;


//button Cheshire cat slide 8 to slide 10
int s8x = 41;
int s8y = 73;
int s8w = 393;
int s8h = 53;


//button Cheshire cat slide 9 to slide 10
int s9x = 109;
int s9y = 397;
int s9w = 115;
int s9h = 27;

//button Cheshire cat slide 9 to slide 11
int s10x = 187;
int s10y = 366;
int s10w = 84;
int s10h = 29;

//button Cheshire cat slide 11 to slide 12
int s11x = 310;
int s11y = 394;
int s11w = 54;
int s11h = 19;

//button Cheshire cat slide 11 to slide 13
int s12x = 166;
int s12y = 388;
int s12w = 38;
int s12h = 26;


void setup() {

  size( 640, 480);
  background(0);
  smooth();
  //fontname = loadFont("MonotypeCorsiva-48.vlw");
  //textFont(fontname);
  //textSize(20);
  slide1 = loadImage("slide1.jpg");
  slide1text1 = loadImage("slide1_text1.png");
  slide1text2 = loadImage("slide1_text2.png");
  slide2 = loadImage("slide2.jpg");
  slide2text1 = loadImage("slide2_text1.png");
  slide2text2 = loadImage("slide2_text2.png");
  slide3 = loadImage("slide3.jpg");
  slide3text1 = loadImage("slide3_text1.png");
  slide3text2 = loadImage("slide3_text2.png");
  slide4 = loadImage("slide4.jpg");
  slide4text1 = loadImage("slide4_text1.png");
  slide4text2 = loadImage("slide4_text2.png");
  slide5 = loadImage("slide5.jpg");
  slide5text1 = loadImage("slide5_text1.png");
  slide5text2 = loadImage("slide5_text2.png");
  slide6 = loadImage("slide6.jpg");
  slide6text1 = loadImage("slide6_text1.png");
  slide6text2 = loadImage("slide6_text2.png");
  slide6text3 = loadImage("slide6_text3.png");
  slide6text4 = loadImage("slide6_text4.png");
  slide6text5 = loadImage("slide6_text5.png");
  slide6text6 = loadImage("slide6_text6.png");
  slide7 = loadImage("slide7.jpg");
  slide7text1 = loadImage("slide7_text1.png");
  slide7text2 = loadImage("slide7_text2.png");
  slide8 = loadImage("slide8.jpg");
  slide8text1 = loadImage("slide8_text1.png");
  slide8text2 = loadImage("slide8_text2.png");
  slide8text3 = loadImage("slide8_text3.png");
  slide8text4 = loadImage("slide8_text4.png");
  slide9 = loadImage("slide9.jpg");
  slide9text1 = loadImage("slide9_text1.png");
  slide10 = loadImage("slide10.jpg");
  slide10text1 = loadImage("slide10_text1.png");
  slide11 = loadImage("slide11.jpg");
  slide11text1 = loadImage("slide11_text1.png");
  slide11text2 = loadImage("slide11_text2.png");
  slide12 = loadImage("slide12.jpg");
  slide12text1 = loadImage("slide12_text1.png");
  slide12text2 = loadImage("slide12_text2.png");
  slide13 = loadImage("slide13.jpg");
  slide13text1 = loadImage("slide13_text1.png");
  slide13text2 = loadImage("slide13_text2.png");
  slide14 = loadImage("slide14.jpg");
  slide14text1 = loadImage("slide14_text1.png");
  slide15 = loadImage("slide15.jpg");
  slide15text1 = loadImage("slide15_text1.png");


}

void draw() {
  if (slide == 1) {
    SlideOne();
  } 
  else if (slide == 2) {
    SlideTwo();
    if ((overButton(s3x, s3y, s3w, s3h)) && timer2 >= 600){
      slide = 4;
    }
  } 

  else if (slide == 3) {
    SlideThree();
    if ((overButton(s3x, s3y, s3w, s3h)) && timer2 >= 600){
      slide = 4;
    }
  } 
  else if (slide == 4) {
    SlideFour();
  } 
  else if (slide == 5) {
    SlideFive();
    if ((overButton(s3x, s3y, s3w, s3h)) && timer4 >= 500){
      slide = 8;
    }
  } 
  else if (slide == 6) {
    SlideSix();
    if ((overButton(s3x, s3y, s3w, s3h)) && timer5 >= 750){
      slide = 8;
    }
  } 
  else if (slide == 7) {
    SlideSeven();
    if ((overButton(s3x, s3y, s3w, s3h)) && timer6 >= 350){
      slide = 9;
    }
  } 
  else if (slide == 8) {
    SlideEight();
  } 
  else if (slide == 9) {
    SlideNine();
  } 
  else if (slide == 10) {
    SlideTen();
    if ((overButton(s3x, s3y, s3w, s3h)) && timer9 >= 310){
      slide = 11;
    }
  } 
  else if (slide == 11) {
    SlideEleven();
  } 
  else if (slide == 12) {
    SlideTwelve();
    if ((overButton(s3x, s3y, s3w, s3h)) && timer11 >= 400){
      slide = 15;
    }
  } 
  else if (slide == 13) {
    SlideThirteen();
    if ((overButton(s3x, s3y, s3w, s3h)) && timer12 >= 400){
      slide = 14;
    }
  } 
  else if (slide == 14) {
    SlideFourteen();
    if ((overButton(s3x, s3y, s3w, s3h)) && timer13 >= 300){
      slide = 15;
    }
  } 
  else if (slide == 15) {
    SlideFifteen();
    if ((overButton(s3x, s3y, s3w, s3h)) && timer14 >= 300){
      slide = 1;
    }
  }
}

boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true; 
  } 
  else {
    return false; 
  }
}




void mousePressed() {
  if (slide == 1) {
    if (overButton(s1x, s1y, s1w, s1h) == true) {
      slide = 3; 
    } 
    else if (overButton(s2x, s2y, s2w, s2h) == true) {
      slide = 2;
    }
  } 
  else if ((slide == 3) || (slide == 2)) {
    if (overButton(s3x, s3y, s3w, s3h) == true) {
      slide = 4; 
    } 
  } 
  else if (slide == 4) {
    if (overButton(s4x, s4y, s4w, s4h) == true) {
      slide = 5; 
    } 
    else if (overButton(s5x, s5y, s5w, s5h) == true) {
      slide = 6;
    } 
    else if (overButton(s6x, s6y, s6w, s6h) == true) {
      slide = 7;
    }
  }
  else if ((slide == 5) || (slide == 6)) {
    if (overButton(s3x, s3y, s3w, s3h) == true) {
      slide = 8; 
    }
  }
  else if (slide == 7) {
    if (overButton(s3x, s3y, s3w, s3h) == true) {
      slide = 9; 
    }
  }
  else if (slide == 8) {
    if (overButton(s7x, s7y, s7w, s7h) == true) {
      slide = 9; 
    } 
    else if (overButton(s8x, s8y, s8w, s8h) == true) {
      slide = 10; 
    }
  }
  else if (slide == 9) {
    if (overButton(s10x, s10y, s10w, s10h) == true) {
      slide = 11; 
    } 
    else if (overButton(s9x, s9y, s9w, s9h) == true) {
      slide = 10; 
    }
  }
  else if (slide == 10) {
    if (overButton(s3x, s3y, s3w, s3h) == true) {
      slide = 11; 
    }
  }
  else if (slide == 11) {
    if (overButton(s11x, s11y, s11w, s11h) == true) {
      slide = 12; 
    } 
    else if (overButton(s12x, s12y, s12w, s12h) == true) {
      slide = 13; 
    }
  }
  else if (slide == 12) {
    if (overButton(s3x, s3y, s3w, s3h) == true) {
      slide = 15; 
    }
  }
  else if (slide == 13) {
    if (overButton(s3x, s3y, s3w, s3h) == true) {
      slide = 14; 
    }
  }
  else if (slide == 14) {
    if (overButton(s3x, s3y, s3w, s3h) == true) {
      slide = 15; 
    }
  }
  else if (slide == 15) {
    if (overButton(s3x, s3y, s3w, s3h) == true) {
      slide = 1; 
    }
  }

} 

/*
void mouseOver() {
 if (slide == 2 || slide ==3){
 if (overButton(s3x, s3y, s3w, s3h) == true && timer2 >= 500){
 slide = 4;
 
 }
 }
 }
 
 */



// THIS IS WHERE I HAVE THE SLIDE TRANSITION

void SlideOne() {

  timer14 = 0;
  rect(s1x, s1y, s1w, s1h);
  rect(s2x, s2y, s2w, s2h);
  image(slide1,0,0);
  // This is where my timer for slide 1 starts
  timer++;
  noStroke();
  println("Timer: " + timer);
  if(timer >= 100){

    fade = i + 5;
    tint(255, 10 + fade); // I tint the font image to white so it shows up
    image(slide1text1, 47,49); // top font
    image(slide1text2, 360, 372); /// bottom font
    fill(0,0); // this is to prevent the buttons to show and fill white

  } 
  //image(slide1text1, 47,49);
  //image(slide1text2, 360, 372);
}

void SlideTwo() {
  timer = 0;
  fill(0,0);
  rect(s3x, s3y, s3w, s3h);
  image(slide2,0,0);
  timer2++; // this will cause the screen to fade to black after 200 frames
  noStroke();
  println("Timer2: " + timer2);
  if(timer2 >= 100){

    grow = i + 5;
    tint(255, 10 + grow);
    image(slide2text1,258,121);    
  } 
  if(timer2 >= 250) {

    grow = i + 5;
    tint(255, 10 + grow);
    image(slide2text2,289,316);
  }
  if (timer2 >= 590) {

    grow = i + 5;
    tint(0, 10 + grow);
    image(slide2,0,0);
  }
  //noTint();
}


void SlideThree() {
  timer = 0;
  fill(0,0);
  rect(s3x, s3y, s3w, s3h);
  image(slide3, 0, 0);
  timer2++; // this fades the screen to black after 200 frames
  noStroke();
  println("Timer2: " + timer2);
  if(timer2 >= 100){

    grow = i + 5;
    tint(255, 10 + grow);
    image(slide3text1,356,60);    
  } 
  if (timer2 >= 300) {

    grow = i + 5;
    tint(255, 10 + grow);
    image(slide3text2,38,315);
  }
  if (timer2 >= 590) {

    grow = i + 5;
    tint(0, 10 + grow);
    image(slide3,0,0);
  }
}

/*void trans3() {
 timer++;
 noStroke();
 println("Timer: " + timer);
 if(timer >= 200){
 
 grow = i + 5;
 tint(0, grow);
 image(slide3,0,0);
 //rect( 0, 0, width, height);
 //fill(0, grow);
 //rect(0, 0, width, height);
 }
 }
 
 */


void SlideFour() {
  noTint();
  rect(s4x, s4y, s4w, s4h);
  rect(s5x, s5y, s5w, s5h);
  rect(s6x, s6y, s6w, s6h);
  image(slide4,0,0);
  /*timer3++;
   noStroke();
   println("Timer3: " + timer3);
   if(timer3 >= 100){
   
   fade = i + 5;
   tint(255, 150 + fade); // I tint the font image to white so it shows up
   image(slide4text1, 215, 68);
   } // top font
   if (timer3 >= 150) {
   
   grow = i + 5;
   tint(255, 150 + grow);
   image(slide4text2, 305, 330);
   } */
  timer3++;
  noStroke();
  println("Timer3: " + timer3);
  if(timer3 >= 100){

    fade = i + 10;
    tint(255, 200 + fade); // I tint the font image to white so it shows up
    image(slide4text1, 215, 68); // top font
    image(slide4text2, 305, 330); /// bottom font
    tint(255,20); // this is to prevent the buttons to show and fill white

  } 

}

void SlideFive() {
  rect(s3x, s3y, s3w, s3h);
  image(slide5,0,0);
  timer4++; // this will cause the screen to fade to black after 200 frames
  noStroke();
  println("Timer4: " + timer4);
  if(timer4 >= 100){

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide5text1,23,42);    
  } 
  if(timer4 >= 250) {

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide5text2,44,68);
  }
  if (timer4 >= 490) {

    grow = i + 5;
    tint(0, 10 + grow);
    image(slide5,0,0);
  }
  tint(255,20);
}

void SlideSix() {
  rect(s3x, s3y, s3w, s3h);
  image(slide6,0,0);
  timer5++; // this will cause the screen to fade to black after 200 frames
  noStroke();
  println("Timer5: " + timer5);
  if(timer5 >= 100){

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide6text1,20,50);    
  } 
  if(timer5 >= 250) {

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide6text2,64,78);
  } 
  if(timer5 >= 350) {
    grow = i + 10;
    tint(255, 10 + grow);
    image(slide6text3,140,107);
  }
  if(timer5 >= 450) {
    grow = i + 10;
    tint(255, 10 + grow);
    image(slide6text4,184,133);
  }
  if(timer5 >= 550) {
    grow = i + 10;
    tint(255, 10 + grow);
    image(slide6text5,211,159);
  }
  if(timer5 >= 650) {
    grow = i + 10;
    tint(255, 10 + grow);
    image(slide6text6,239,185);
  }
  if (timer5 >= 740) {

    grow = i + 5;
    tint(0, 10 + grow);
    image(slide6,0,0);
  }
  tint(255,20);

}

void SlideSeven() {
  rect(s3x, s3y, s3w, s3h);
  image(slide7,0,0);
  timer6++; // this will cause the screen to fade to black after 200 frames
  noStroke();
  println("Timer6: " + timer6);
  if(timer6 >= 100){

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide7text1,34,62);    
  } 
  if(timer6 >= 150) {

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide7text2,340,194);
  }
  if (timer6 >= 340) {

    grow = i + 5;
    tint(0, 10 + grow);
    image(slide7,0,0);
  }
  tint(255,20);
}

void SlideEight() {
  rect(s3x, s3y, s3w, s3h);
  image(slide8,0,0);
  timer7++; // this will cause the screen to fade to black after 200 frames
  noStroke();
  println("Timer7: " + timer7);
  if(timer7 >= 100){

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide8text1,25,43);    
  } 
  if(timer7 >= 250) {

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide8text2,41,73);
  } 
  if(timer7 >= 400) {
    grow = i + 10;
    tint(255, 10 + grow);
    image(slide8text3,85,129);
  }
  if(timer7 >= 500) {
    grow = i + 10;
    tint(255, 10 + grow);
    image(slide8text4,286,317);
  }
  tint(255,20);
  
}

void SlideNine() {
  rect(s9x, s9y, s9w, s9h);
  rect(s10x, s10y, s10w, s10h);
  image(slide9,0,0);
  timer8++; // this will cause the screen to fade to black after 200 frames
  noStroke();
  println("Timer8: " + timer8);
  if(timer8 >= 100){

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide9text1,34,304);    
  } 
}

void SlideTen() {
  rect(s3x, s3y, s3w, s3h);
  image(slide10,0,0);
  timer9++; // this will cause the screen to fade to black after 200 frames
  noStroke();
  println("Timer9: " + timer9);
  if(timer9 >= 100){

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide10text1,25,60);    
  } if (timer9 >= 300) {

    grow = i + 5;
    tint(0, 10 + grow);
    image(slide10,0,0);
  }
  tint(255,20);
  
}

void SlideEleven() {
  rect(s11x, s11y, s11w, s11h);
  rect(s12x, s12y, s12w, s12h);
  image(slide11,0,0);
  timer10++; // this will cause the screen to fade to black after 200 frames
  noStroke();
  println("Timer10: " + timer10);
  if(timer10 >= 100) {
    grow = i + 10;
    tint(255, 10 + grow);
    image(slide11text1,34,88);
  }
  if(timer10 >= 200) {
    grow = i + 10;
    tint(255, 10 + grow);
    image(slide11text2,134,391);
  }
  tint(255,20);
}

void SlideTwelve() {
  rect(s3x, s3y, s3w, s3h);
  image(slide12,0,0);
  timer11++; // this will cause the screen to fade to black after 200 frames
  noStroke();
  println("Timer11: " + timer11);
  if(timer11 >= 100){

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide12text1,320,60);    
  } if(timer11 >= 200){

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide12text2,26,252);   
  }
  if (timer11 >= 390) {

    grow = i + 5;
    tint(0, 10 + grow);
    image(slide12,0,0);
  }
  tint(255,20);
}

void SlideThirteen() {
  rect(s3x, s3y, s3w, s3h);
  image(slide13,0,0);
  timer12++; // this will cause the screen to fade to black after 200 frames
  noStroke();
  println("Timer12: " + timer12);
  if(timer12 >= 100){

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide13text1,384,53);    
  } if(timer12 >= 200){

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide13text2,43,321);   
  }
  if (timer12 >= 390) {

    grow = i + 5;
    tint(0, 10 + grow);
    image(slide13,0,0);
  }
  tint(255,20);
}

void SlideFourteen() {
  rect(s3x, s3y, s3w, s3h);
  image(slide14,0,0);
  timer13++; // this will cause the screen to fade to black after 200 frames
  noStroke();
  println("Timer13: " + timer13);
  if(timer13 >= 100){

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide14text1,445,51);    
  } 
  if (timer13 >= 290) {

    grow = i + 5;
    tint(0, 10 + grow);
    image(slide14,0,0);
  }
  tint(255,20);
}

void SlideFifteen() {
  timer = 0;
  timer2 = 0;
  timer3 = 0;
  timer4 = 0;
  timer5 = 0;
  timer6 = 0;
  timer7 = 0;
  timer8 = 0;
  timer9 = 0;
  timer10 = 0;
  timer11 = 0;
  timer12 = 0;
  timer13 = 0;
  rect(s3x, s3y, s3w, s3h);
  image(slide15,0,0);
  
  timer14++; // this will cause the screen to fade to black after 200 frames
  noStroke();
  println("Timer14: " + timer14);
  if(timer14 >= 100){

    grow = i + 10;
    tint(255, 10 + grow);
    image(slide15text1,49,59);    
  } 
  if(timer14 >= 290){
    grow = i + 5;
    tint(0, 10 + grow);
    image(slide15,0,0);
  }
  tint(255,20);
}









