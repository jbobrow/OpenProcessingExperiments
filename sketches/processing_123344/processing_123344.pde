
/* @pjs font = "OpenSans-Light.ttf,OpenSans-LightItalic.ttf,OpenSans-Regular.ttf ; */

int myState = 0 ;


PFont light ;
PFont lightitalic ;
PFont regular ;
boolean start ;


float barOne; //html
float barTwo; //css
float barThree; //java
float barFour; //wordpress
float barFive; //illustrator
float barSix; //audition
float barSeven;  //aftereffects
float barEight; //photoshop
float barNine; //indesign
float barTen; //finalcut
float barEleven; //blender

float percent1 ;
float percent2 ;
float percent3 ;
float percent4 ;
float percent5 ;
float percent6;
float percent7 ;
float percent8 ;
float percent9 ;
float percent10 ;
float percent11 ;



void setup() {
  size(800, 600);
  smooth();
  
  //bold = createFont("OpenSans-ExtraBold.ttf", 18) ;
  //semibold = createFont("OpenSans-SemiBold.ttf", 18) ;
  light = createFont("OpenSans-Light.ttf", 18) ;
  lightitalic = createFont("OpenSans-LightItalic.ttf", 18) ;
  //regular = createFont("OpenSans-Regular.ttf", 18) ;
  percent1 = 0 ;
  //light = createFont("OpenSans-Light-48.vlw",48) ;
}



void draw() {
  textFont(light) ;

  switch(myState) {

  case 0:
    noStroke() ;
    background(#2d2d2d); 
   
   
    fill(#FAFAFA);
    textAlign(RIGHT, CENTER) ;
    textFont(light, 18) ;
    textSize(14) ;
    text("HTML |", 170, 75); //barone
    text("CSS |", 170, 120); //bartwo
    text("JAVA |", 170, 165); //barthree
    text("WORDPRESS |", 170, 210); //barfour
    text("ILLUSTRATOR |", 170, 255); //barfive
    text("AUDITION |", 170, 300); //barsix
    text("AFTER EFFECTS |", 170, 345); //barseven
    text("PHOTOSHOP |", 170, 390); //bareight
    text("INDESIGN |", 170, 435); //barnine
    text("FINALCUT |", 170, 480); //barten
    text("BLENDER |", 170, 525); //bar eleven

    ///background rectangles

    fill(#4c4c4c) ;
    rect(175, 69, 500, 20, 4) ; //bgone //ADD2
    rect(175, 114, 500, 20, 4) ;  //bgtwo
    rect(175, 160, 500, 20, 4) ; //bgthree
    rect(175, 204, 500, 20, 4) ; //bgfour
    rect(175, 249, 500, 20, 4) ; //bgfive
    rect(175, 294, 500, 20, 4) ; //bgsix
    rect(175, 338, 500, 20, 4) ; //bgseven
    rect(175, 384, 500, 20, 4) ; //bgeight
    rect(175, 429, 500, 20, 4) ; //bgnine
    rect(175, 474, 500, 20, 4) ; //bgten
    rect(175, 519, 500, 20, 4) ; //bgeleven

    textFont(lightitalic, 14) ;
    fill(#98d06c) ;
    text("%", 710, 75);
    text("%", 710, 120);
    text("%", 710, 166);
    text("%", 710, 210);
    text("%", 710, 255);
    text("%", 710, 300);
    text("%", 710, 344);     
    text("%", 710, 390);
    text("%", 710, 435);
    text("%", 710, 480);
    text("%", 710, 525);
    
    break ;



  case 1:
    background(#2d2d2d); 
    noStroke() ;

    fill(#FAFAFA);
    textAlign(RIGHT, CENTER) ;
    textFont(light, 18) ;
    textSize(14) ;
    text("HTML |", 170, 75); //barone
    text("CSS |", 170, 120); //bartwo
    text("JAVA |", 170, 165); //barthree
    text("WORDPRESS |", 170, 210); //barfour
    text("ILLUSTRATOR |", 170, 255); //barfive
    text("AUDITION |", 170, 300); //barsix
    text("AFTER EFFECTS |", 170, 345); //barseven
    text("PHOTOSHOP |", 170, 390); //bareight
    text("INDESIGN |", 170, 435); //barnine
    text("FINALCUT |", 170, 480); //barten
    text("BLENDER |", 170, 525); //bar eleven

    ///background rectangles

    fill(#4c4c4c) ;
    rect(175, 69, 500, 20, 4) ; //bgone //ADD2
    rect(175, 114, 500, 20, 4) ;  //bgtwo
    rect(175, 160, 500, 20, 4) ; //bgthree
    rect(175, 204, 500, 20, 4) ; //bgfour
    rect(175, 249, 500, 20, 4) ; //bgfive
    rect(175, 294, 500, 20, 4) ; //bgsix
    rect(175, 338, 500, 20, 4) ; //bgseven
    rect(175, 384, 500, 20, 4) ; //bgeight
    rect(175, 429, 500, 20, 4) ; //bgnine
    rect(175, 474, 500, 20, 4) ; //bgten
    rect(175, 519, 500, 20, 4) ; //bgeleven



    //bar one//html
    fill(#a8d06c);
    rect(179, 72, barOne, 14, 3);
    noStroke();
    barOne+=.90;
    if ( barOne > 475) {
      barOne= 475;
    }//endif
    if (percent1 < 190) {
      percent1 += (.4);
    }
    int hundPerc = round(percent1/2);
    textFont(lightitalic, 14) ;
    fill(#FAFAFA) ;
    text(hundPerc + "%", 710, 75);

    //bartwo//css
    fill(#a8d06c);
    noStroke();
    rect(179, 117, barTwo, 14, 3);
    barTwo+= .80;
    if (barTwo>475) {
      barTwo= 475;
    }
    if (percent2 < 190) {
      percent2 += (.4);
    }
    int hundPerc2 = round(percent2/2);
    textFont(lightitalic, 14) ;
    fill(#FAFAFA) ;
    text(hundPerc2 + "%", 710, 120);


    //barthree//java
    fill(#a8d06c);
    noStroke();
    rect(179, 163, barThree, 14, 3);
    barThree+= 1;
    if (barThree>300) {
      barThree= 300;
    }
    if (percent3 < 130) {
      percent3 += (.4);
    }
    int hundPerc3 = round(percent3/2);
    textFont(lightitalic, 14) ;
    fill(#FAFAFA) ;
    text(hundPerc3 + "%", 710, 166);

    //barfour//wordpress
    fill(#a8d06c);
    noStroke();
    rect(179, 207, barFour, 14, 3);
    barFour+=.7;
    if (barFour>400) {
      barFour= 400;
    }
    if (percent4 < 160) {
      percent4 += (.4);
    }
    int hundPerc4 = round(percent4/2);
    textFont(lightitalic, 14) ;
    fill(#FAFAFA) ;
    text(hundPerc4 + "%", 710, 210);


    //barfive//illustrator
    fill(#a8d06c);
    rect(179, 252, barFive, 14, 3);
    barFive+=.90;
    if (barFive>480) {
      barFive= 480;
    }
    if (percent5 < 190) {
      percent5 += (.4);
    }
    int hundPerc5 = round(percent5/2);
    textFont(lightitalic, 14) ;
    fill(#FAFAFA) ;
    text(hundPerc5 + "%", 710, 255);


    //barsix//audtion
    fill(#a8d06c);
    noStroke();
    rect(179, 297, barSix, 14, 3);
    barSix+=.60;
    if (barSix>250) {
      barSix= 250;
    }
    if (percent6 < 120) {
      percent6 += (.4);
    }
    int hundPerc6 = round(percent6/2);
    textFont(lightitalic, 14) ;
    fill(#FAFAFA) ;
    text(hundPerc6 + "%", 710, 300);


    //barseven//aftereffects
    fill(#a8d06c);
    noStroke();
    rect(179, 341, barSeven, 14, 3);
    barSeven+= 1.1;
    if (barSeven>325) {
      barSeven= 325;
    }
    if (percent7 < 140) {
      percent7 += (.4);
    }
    int hundPerc7 = round(percent7/2);
    textFont(lightitalic, 14) ;
    fill(#FAFAFA) ;
    text(hundPerc7 + "%", 710, 344);



    //bareight//photoshop
    fill(#a8d06c);
    noStroke();
    rect(179, 387, barEight, 14, 3);
    barEight+=.90;
    if (barEight>475) {
      barEight= 475;
    }
    if (percent8 < 190) {
      percent8 += (.4);
    }
    int hundPerc8 = round(percent8/2);
    textFont(lightitalic, 14) ;
    fill(#FAFAFA) ;
    text(hundPerc8 + "%", 710, 390);



    //barnine//indesign
    fill(#a8d06c);
    noStroke();
    rect(179, 432, barNine, 14, 3);
    barNine+= 1;
    if (barNine>250) {
      barNine= 250;
    }
    if (percent9 < 120) {
      percent9 += (.4);
    }
    int hundPerc9 = round(percent9/2);
    textFont(lightitalic, 14) ;
    fill(#FAFAFA) ;
    text(hundPerc9 + "%", 710, 435);



    //barten//finalcut
    fill(#a8d06c);
    noStroke();
    rect(179, 477, barTen, 14, 3);
    barTen+=.90;
    if (barTen>450) {
      barTen= 450;
    }
    if (percent10 < 180) {
      percent10 += (.4);
    }
    int hundPerc10 = round(percent10/2);
    textFont(lightitalic, 14) ;
    fill(#FAFAFA) ;
    text(hundPerc10 +"%", 710, 480);



    //bareleven//blender
    fill(#a8d06c);
    noStroke();
    rect(179, 522, barEleven, 14, 3);
    barEleven+= .8;
    if (barEleven>325) {
      barEleven=325;
    }
    if (percent11 < 190) {
      percent11 += (.4);
    }
    int hundPerc11 = round(percent11/2);
    textFont(lightitalic, 14) ;
    fill(#FAFAFA) ;
    text(hundPerc11 + "%", 710, 525);


    break ;
  }///endofswitch
}//end of draw

void mousePressed() {
  if (myState == 0) {
    myState = 1 ;
  }
}



