
int myState = 0 ;
int zeroCtr = 60*4;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12 ;
PImage img13 ;
PImage img14;
PImage img15 ;
PImage img16;
PImage img17;
PImage img18;
PImage img19 ;
PImage img20;
PImage img21;
PImage img22;
PImage img23;
PImage img24;
PImage img25;
PImage img26;
PImage img27 ;
PImage img28;
PImage img29;
PImage img30 ;
PImage img31;
PImage img32;
PImage img33;
PImage img34;
PImage img35;
PImage img36 ;
PImage img37;
PImage img38;
PImage img39;
PImage img40;
PImage img41;
PImage img42;
PImage def;


void setup(){
  size(300,502);
img1 = loadImage("1.jpg");
img2 = loadImage("2.jpg");
img3 = loadImage("3.jpg");
img4 = loadImage("4.jpg");
img5 = loadImage("5.jpg");
img6 = loadImage("6.jpg");
img7 = loadImage("7.jpg");
img8 = loadImage("8.jpg");
img9 = loadImage("9.jpg");
img10 = loadImage("1b.jpg");
img11 = loadImage("2b.jpg");
img12 = loadImage("3b.jpg");
img13 = loadImage("4b.jpg");
img14 = loadImage("5b.jpg");
img15 = loadImage("6b.jpg");
img16 = loadImage("7b.jpg");
img17 = loadImage("8b.jpg");
img18 = loadImage("9b.jpg");
img19 = loadImage("1c.jpg");
img20 = loadImage("2c.jpg");
img21 = loadImage("3c.jpg");
img22 = loadImage("4c.jpg");
img23 = loadImage("5c.jpg");
img24 = loadImage("6c.jpg");
img25 = loadImage("7c.jpg");
img26 = loadImage("8c.jpg");
img27 = loadImage("9c.jpg");
img28 = loadImage("1d.jpg");
img29 = loadImage("2d.jpg");
img30 = loadImage("3d.jpg");
img31 = loadImage("4d.jpg");
img32 = loadImage("5d.jpg");
img33 = loadImage("6d.jpg");
img34 = loadImage("7d.jpg");
img35 = loadImage("8d.jpg");
img36 = loadImage("9d.jpg");
img37 = loadImage("1e.jpg");
img38 = loadImage("2e.jpg");
img39 = loadImage("3e.jpg");
img40 = loadImage("4e.jpg");
img41 = loadImage("5e.jpg");
img42 = loadImage("6e.jpg");
def = loadImage("default.jpg");



}
// END OF VOID SETUP


void draw()  {

   background(0);
  
   
 switch(myState){
  case 0:
 image(def, 0, 0);
  zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = myState + 1;
  zeroCtr = 60*2 ;

  }
  // END OF IF
  break ;
  
  
  
  case 1:
  background(img1);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 2;
  zeroCtr = 60*2 ;
  }
  break;
  case 2:
  background(img2);
      zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 3;
  zeroCtr = 60*2 ;
  }
  break;

case 3:
background(img3);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 4;
  zeroCtr = 60*2 ;
  }
break;

case 4:
background(img4);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 5;
  zeroCtr = 60*2 ;
  }
break;
case 5:
background(img5);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 6;
  zeroCtr = 60*2 ;
  }
break;
case 6:
background(img6);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 7;
  zeroCtr = 60*2 ;
  }
break;
case 7:
background(img7);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 8;
  zeroCtr = 60*2 ;
  }
break;
case 8:
background(img8);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 9;
  zeroCtr = 60*2 ;
  }
break;
case 9:
background(img9);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 10;
  zeroCtr = 60*2 ;
  }
break;
case 10:
background(img10);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 11;
  zeroCtr = 60*2 ;
  }
break;
case 11:
background(img11);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 12;
  zeroCtr = 60*2 ;
  }
break;
case 12:
background(img12);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 13;
  zeroCtr = 60*2 ;
  }
break;
case 13:
background(img13);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 14;
  zeroCtr = 60*2 ;
  }
break;
case 14:
background(img14);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 15;
  zeroCtr = 60*2 ;
  }
break;
case 15:
background(img15);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 16;
  zeroCtr = 60*2 ;
  }
break;
case 16:
background(img16);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 17;
  zeroCtr = 60*2 ;
  }
break;
case 17:
background(img17);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 18;
  zeroCtr = 60*2 ;
  }
break;
case 18:
background(img18);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 19;
  zeroCtr = 60*2 ;
  }
break;
case 19:
background(img19);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 20;
  zeroCtr = 60*2 ;
  }
break;
case 20:
background(img20);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 21;
  zeroCtr = 60*2 ;
  }
break;
case 21:
background(img21);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 22;
  zeroCtr = 60*2 ;
  }
break;
case 22:
background(img22);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 23;
  zeroCtr = 60*2 ;
  }
break;
case 23:
background(img23);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 24;
  zeroCtr = 60*2 ;
  }
break;
case 24:
background(img24);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 25;
  zeroCtr = 60*2 ;
  }
break;
case 25:
background(img25);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 26;
  zeroCtr = 60*2 ;
  }
break;
case 26:
background(img26);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 27;
  zeroCtr = 60*2 ;
  }
break;
case 27:
background(img27);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 28;
  zeroCtr = 60*2 ;
  }
break;
case 28:
background(img28);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 29;
  zeroCtr = 60*2 ;
  }
break;
case 29:
background(img29);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 30;
  zeroCtr = 60*2 ;
  }
break;
case 30:
background(img30);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 31;
  zeroCtr = 60*2 ;
  }
break;
case 31:
background(img31);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 32;
  zeroCtr = 60*2 ;
  }
break;
case 32:
background(img32);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 33;
  zeroCtr = 60*2 ;
  }
break;
case 33:
background(img33);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 34;
  zeroCtr = 60*2 ;
  }
break;
case 34:
background(img34);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 35;
  zeroCtr = 60*2 ;
  }
break;
case 35:
background(img35);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 36;
  zeroCtr = 60*2 ;
  }
break;
case 36:
background(img36);
    zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = 37;
  zeroCtr = 60*2 ;
  }
break;
case 37:
background(img37);
  zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = myState + 1;
  zeroCtr = 60*2 ;

  }
break;
case 38:
background(img38);
  zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = myState + 1;
  zeroCtr = 60*2 ;

  }
break;
case 39:
background(img39);
  zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = myState + 1;
  zeroCtr = 60*2 ;

  }
break;
case 40:
background(img40);
  zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = myState + 1;
  zeroCtr = 60*2 ;

  }
break;
case 41:
background(img41);
  zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = myState + 1;
  zeroCtr = 60*2 ;

  }
break;
case 42:
background(img42);
  zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = myState + 1;
  zeroCtr = 60*2 ;

  }
break;
/*
case 43:
background(img43);
  zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = myState + 1;
  zeroCtr = 60*2 ;

  }
break;
case 44:
background(img44);
  zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = myState + 1;
  zeroCtr = 60*2 ;

  }
break;
case 45:
background(img45);
  zeroCtr-- ;
  if (zeroCtr < 0 ) {
   myState = myState + 1;
  zeroCtr = 60*2 ;

  }
break;

*/
 }
 // END OF SWITCH


 }
 // END OF VOID DRAW




 void mousePressed() {

   background(255, 255, 255);
  if (myState > 42) {
   myState = 0;

  }
  // END OF IF


}
// END OF MOUSEPRESSED 


