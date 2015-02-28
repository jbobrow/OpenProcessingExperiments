
/* @pjs font="PontanoSans-Regular.ttf"; */

int myState = 0 ;
PFont myFont;
PImage bg;
String a = "Aging is not lost youth but a new stage of opportunity and strength. - Betty Friedan ";
String b = "Youth is the gift of nature, but age is a work of art. - Stanislaw Lec" ;
String c = "Age is whatever you think it is. You are as old as you think you are. - Muhammad Ali" ;
String d = "No matter what age you are, or what your circumstances might be, you are special, and you still have something unique to offer. Your life, because of who you are, has meaning. - Barbara de Angelis" ;
String e = "Happy birthday Roz!" ;
String f = "This year seems to be a bad year for gifts, huh? First Jay, now you... But I was able to put together something using some newfound skills I've been learning in school. It's taken me approximately.... two hours to make this start to finish. It'll have to do till I start making the big bucks! =) Anyway, I'm glad I got the chance to spend time with you on your birthday even if it was only for a day. I love you!" ;
String g = "Love,";
String h = "Austin" ;
String i = "Click on the picture to move to each slide!";


void setup()  {
  size(700,700);
  background(#ffffff);
  textAlign(LEFT);
  bg = loadImage("birthday.jpg");
  myFont = createFont("PontanoSans-Regular.ttf", 120);
}



void draw()  {
switch(myState){
case 0:
textAlign(CENTER);
  image(bg, 0, 0, width, height);
 textFont(myFont, 45);
  fill(#031060);
  text(i, 50, 20, 600, 250);  // Textwrap
break;

case 1:
textAlign(LEFT);
  image(bg, 0, 0, width, height);
 textFont(myFont, 36);
  fill(#031060);
  text(a, 5, 10, 600, 250);  // Textwrap
break; 
case 2:
  image(bg, 0, 0, width, height);
  textFont(myFont, 30);
  fill(#222222);
  text(a, 5, 10, 600, 250);  // Textwrap
  
  textFont(myFont, 45);
  fill(#031060);
  text(b, 40, 130, 620, 250);  // Textwrap
break; 
case 3:
  image(bg, 0, 0, width, height);
  textFont(myFont, 30);
  fill(#222222);
  text(a, 5, 10, 600, 250);  // Textwrap
  
  textFont(myFont, 40);
  fill(#222222);
  text(b, 40, 130, 620, 250);  // Textwrap
  
  textSize(40);
  fill(#031060);
  text(c, 10, 260, 680, 250);  // Textwrap
break; 
case 4:
  image(bg, 0, 0, width, height);
  textFont(myFont, 30);
  fill(#222222);
  text(a, 5, 10, 600, 250);  // Textwrap
  
  textFont(myFont, 40);
  fill(#222222);
  text(b, 40, 130, 620, 250);  // Textwrap
  
  textSize(35);
  fill(#222222);
  text(c, 10, 260, 680, 250);  // Textwrap
  
  textSize(35);
  fill(#031060);
  text(d, 20, 375, 600, 400);  // Textwrap
break; 

case 5:
  image(bg, 0, 0, width, height);
  textFont(myFont, 30);
  fill(#222222);
  text(a, 5, 10, 600, 250);  // Textwrap
  
  textFont(myFont, 40);
  fill(#222222);
  text(b, 40, 130, 620, 250);  // Textwrap
  
  textSize(35);
  fill(#222222);
  text(c, 10, 260, 680, 250);  // Textwrap
  
  textSize(30);
  fill(#222222);
  text(d, 20, 375, 600, 400);  // Textwrap
break; 
case 6:
  image(bg, 0, 0, width, height);
  textFont(myFont, 33);
  fill(#031060);
  text(e, 5, 5, 600, 250);  // Textwrap
break; 
case 7:
  image(bg, 0, 0, width, height);
  textFont(myFont, 33);
  fill(#222222);
  text(e, 5, 5, 600, 250);  // Textwrap
  
  textFont(myFont, 30);
  fill(#031060);
  text(f, 25, 55, 600, 600);  // Textwrap
break; 

case 8:
  image(bg, 0, 0, width, height);
  textFont(myFont, 33);
  fill(#222222);
  text(e, 5, 5, 600, 250);  // Textwrap
  
  textFont(myFont, 30);
  fill(#222222);
  text(f, 25, 55, 600, 600);  // Textwrap


  textFont(myFont, 30);
  fill(#031060);
  text(g, 450, 520, 600, 600);  // Textwrap
break; 

case 9:
  image(bg, 0, 0, width, height);
  textFont(myFont, 33);
  fill(#222222);
  text(e, 5, 5, 600, 250);  // Textwrap
  
  textFont(myFont, 30);
  fill(#222222);
  text(f, 25, 55, 600, 600);  // Textwrap


  textFont(myFont, 30);
  fill(#222222);
  text(g, 450, 520, 600, 600);  // Textwrap
  
    textFont(myFont, 30);
  fill(#031060);
  text(h, 470, 560, 600, 600);  // Textwrap
break; 
}
}




void mousePressed()  {
  myState++  ;
  if (myState > 9)  {
    myState = 0 ;
  }

} 



