
/* @pjs font="OpenSans-Light.ttf, OpenSans-LightItalic.ttf"; */
     
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
  size(800, 525);
  smooth();
  
  
  light = loadFont("OpenSans-Light.ttf", 18) ;
  lightitalic = loadFont("OpenSans-LightItalic.ttf", 18) ;
  
  percent1 = 0 ;

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
    text("HTML |", 170, 25); //barone
    text("CSS |", 170, 70); //bartwo
    text("JAVA |", 170, 115); //barthree
    text("WORDPRESS |", 170, 160); //barfour
    text("ILLUSTRATOR |", 170, 205); //barfive
    text("AUDITION |", 170, 250); //barsix
    text("AFTER EFFECTS |", 170, 295); //barseven
    text("PHOTOSHOP |", 170, 340); //bareight
    text("INDESIGN |", 170, 385); //barnine
    text("FINALCUT |", 170, 431); //barten
    text("BLENDER |", 170, 475); //bar eleven


    fill(#4c4c4c) ;
    rect(175, 15, 500, 20, 4) ; //bgone //ADD2
    rect(175, 60, 500, 20, 4) ;  //bgtwo
    rect(175, 106, 500, 20, 4) ; //bgthree
    rect(175, 150, 500, 20, 4) ; //bgfour
    rect(175, 194, 500, 20, 4) ; //bgfive
    rect(175, 240, 500, 20, 4) ; //bgsix
    rect(175, 284, 500, 20, 4) ; //bgseven
    rect(175, 330, 500, 20, 4) ; //bgeight
    rect(175, 375, 500, 20, 4) ; //bgnine
    rect(175, 420, 500, 20, 4) ; //bgten
    rect(175, 465, 500, 20, 4) ; //bgeleven

    textFont(lightitalic, 14) ;
    fill(#98d06c) ;
    text("%", 710, 25);
    text("%", 710, 70);
    text("%", 710, 116);
    text("%", 710, 160);
    text("%", 710, 205);
    text("%", 710, 250);
    text("%", 710, 294);     
    text("%", 710, 340);
    text("%", 710, 385);
    text("%", 710, 430);
    text("%", 710, 475);
    
    break ;



  case 1:
    background(#2d2d2d); 
    noStroke() ;

    fill(#FAFAFA);
    textAlign(RIGHT, CENTER) ;
    textFont(light, 18) ;
    textSize(14) ;
    text("HTML |", 170, 25); //barone
    text("CSS |", 170, 70); //bartwo
    text("JAVA |", 170, 115); //barthree
    text("WORDPRESS |", 170, 160); //barfour
    text("ILLUSTRATOR |", 170, 205); //barfive
    text("AUDITION |", 170, 250); //barsix
    text("AFTER EFFECTS |", 170, 295); //barseven
    text("PHOTOSHOP |", 170, 340); //bareight
    text("INDESIGN |", 170, 385); //barnine
    text("FINALCUT |", 170, 431); //barten
    text("BLENDER |", 170, 475); //bar eleven

    ///background rectangles

    fill(#4c4c4c) ;
    rect(175, 15, 500, 20, 4) ; //bgone //ADD2
    rect(175, 60, 500, 20, 4) ;  //bgtwo
    rect(175, 106, 500, 20, 4) ; //bgthree
    rect(175, 150, 500, 20, 4) ; //bgfour
    rect(175, 194, 500, 20, 4) ; //bgfive
    rect(175, 240, 500, 20, 4) ; //bgsix
    rect(175, 284, 500, 20, 4) ; //bgseven
    rect(175, 330, 500, 20, 4) ; //bgeight
    rect(175, 375, 500, 20, 4) ; //bgnine
    rect(175, 420, 500, 20, 4) ; //bgten
    rect(175, 465, 500, 20, 4) ; //bgeleven



    //bar one//html
    fill(#a8d06c);
    rect(179, 18, barOne, 14, 3);
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
    text(hundPerc + "%", 710, 25);

    //bartwo//css
    fill(#a8d06c);
    noStroke();
    rect(179, 63, barTwo, 14, 3);
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
    text(hundPerc2 + "%", 710, 70);


    //barthree//java
    fill(#a8d06c);
    noStroke();
    rect(179, 109, barThree, 14, 3);
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
    text(hundPerc3 + "%", 710, 116);

    //barfour//wordpress
    fill(#a8d06c);
    noStroke();
    rect(179, 153, barFour, 14, 3);
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
    text(hundPerc4 + "%", 710, 160);


    //barfive//illustrator
    fill(#a8d06c);
    rect(179, 198, barFive, 14, 3);
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
    text(hundPerc5 + "%", 710, 205);


    //barsix//audtion
    fill(#a8d06c);
    noStroke();
    rect(179, 243, barSix, 14, 3);
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
    text(hundPerc6 + "%", 710, 250);


    //barseven//aftereffects
    fill(#a8d06c);
    noStroke();
    rect(179, 287, barSeven, 14, 3);
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
    text(hundPerc7 + "%", 710, 294);



    //bareight//photoshop
    fill(#a8d06c);
    noStroke();
    rect(179, 333, barEight, 14, 3);
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
    text(hundPerc8 + "%", 710, 340);



    //barnine//indesign
    fill(#a8d06c);
    noStroke();
    rect(179, 378, barNine, 14, 3);
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
    text(hundPerc9 + "%", 710, 385);



    //barten//finalcut
    fill(#a8d06c);
    noStroke();
    rect(179, 423, barTen, 14, 3);
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
    text(hundPerc10 +"%", 710, 430);



    //bareleven//blender
    fill(#a8d06c);
    noStroke();
    rect(179, 468, barEleven, 14, 3);
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
    text(hundPerc11 + "%", 710, 475);


    break ;
  }///endofswitch
}//end of draw

void mouseOver() {
  if (myState == 0) {
    myState = 1 ;
  }////endif///
}////endofmouseover



