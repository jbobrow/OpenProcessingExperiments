
float x = 20;            // starting positions
float y = 300;
float xspeed = 1;
float yspeed = 1;



void setup() {
// To create a font for use in processing, save your program and then use Tools/font
// The font file will be saved in the sketch's "data" directory
size (600,600);
//  background(100,100,100);


}

void draw() {

  PFont Blackout;
Blackout = loadFont("Blackout-Midnight-48.vlw");
  textFont(Blackout, 45);  
  
 int s = second();
 int m = minute();
 int h = hour();
 
 /*x = x + xspeed;
 y = y + yspeed;
  */
text(h, x, y);
text(m, x, y);
text(s, x, y);
/*
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;              
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
*/

//background ( random(255), random(255), random(255), random(255)); 
//frameRate (500);

background (0);
if ((h==1)) text("ONE, ");
if ((h==2)) text("TWO, ");
if ((h==3)) text("THREE, ");
if ((h==4)) text("FOUR, ");
if ((h==5)) text("FIVE, ");
if ((h==6)) text("SIX, ");
if ((h==7)) text("SEVEN, ");
if ((h==8)) text("EIGHT, ");
if ((h==9)) text("NINE, ");
if ((h==10)) text("TEN, ");
if ((h==11)) text("ELEVEN, ");
if ((h==12)) text("TWELVE, ");
if ((h==13)) text("ONE, ");
if ((h==14)) text("TWO, ");
if ((h==15)) text("THREE, ");
if ((h==16)) text("FOUR, ");
if ((h==17)) text("FIVE, ");
if ((h==18)) text("SIX, ");
if ((h==19)) text("SEVEN, ");
if ((h==20)) text("EIGHT, ");
if ((h==21)) text("NINE, ");
if ((h==22)) text("TEN, ");
if ((h==23)) text("ELEVEN, ");
if ((h==24)) text("TWELVE, ");

textFont(Blackout, 30); 
 if ((m==1)) text("O'ONE, ");
 if ((m==2)) text("O'TWO, ");
 if ((m==3)) text("O'THREE, ");
 if ((m==4)) text("O'FOUR, ");
 if ((m==5)) text("O'FIVE, ");
 if ((m==6)) text("O'SIX, ");
 if ((m==7)) text("O'SEVEN, ");
 if ((m==8)) text("O'EIGHT, ");
 if ((m==9)) text("O'NINE, ");
 if ((m==10)) text("TEN, ");
 if ((m==11)) text("ELEVEN, ");
 if ((m==12)) text("TWELVE, ");
 if ((m==13)) text("THIRTEEN, ");
 if ((m==14)) text("FOURTEEN, ");
 if ((m==15)) text("FIFTEEN, ");
 if ((m==16)) text("SIXTEEN, ");
 if ((m==17)) text("SEVENTEEN, ");
 if ((m==18)) text("EIGHTEEN, ");
 if ((m==19)) text("NINETEEN, ");
 if ((m==20)) text("TWENTY, ");
 if ((m==21)) text("TWENTY-ONE, ");
 if ((m==22)) text("TWENTY-TWO, ");
 if ((m==23)) text("TWENTY-THREE, ");
 if ((m==24)) text("TWENTY-FOUR, ");
 if ((m==25)) text("TWENTY-FIVE, ");
 if ((m==26)) text("TWENTY-SIX, ");
 if ((m==27)) text("TWENTY-SEVEN, ");
 if ((m==28)) text("TWENTY-EIGHT, ");
 if ((m==29)) text("TWENTY-NINE, ");
 if ((m==30)) text("THIRTY, ");
 if ((m==31)) text("THIRTY-ONE, ");
 if ((m==32)) text("THIRTY-TWO, ");
 if ((m==33)) text("THIRTY-THREE, ");
 if ((m==34)) text("THIRTY-FOUR, ");
 if ((m==35)) text("THIRTY-FIVE, ");
 if ((m==36)) text("THIRTY-SIX, ");
 if ((m==37)) text("THIRTY-SEVEN, ");
 if ((m==38)) text("THIRTY-EIGHT, ");
 if ((m==39)) text("THIRTY-NINE, ");
 if ((m==40)) text("FOURTY, ");
 if ((m==41)) text("FOURTY-ONE, ");
 if ((m==42)) text("FOURTY-TWO, ");
 if ((m==43)) text("FOURTY-THREE, ");
 if ((m==44)) text("FOURTY-FOUR, ");
 if ((m==45)) text("FOURTY-FIVE, ");
 if ((m==46)) text("FOURTY-SIX, ");
 if ((m==47)) text("FOURTY-SEVEN, ");
 if ((m==48)) text("FOURTY-EIGHT, ");
 if ((m==49)) text("FOURTY-NINE, ");
 if ((m==50)) text("FIFTY, ");
 if ((m==51)) text("FIFTY-ONE, ");
 if ((m==52)) text("FIFTY-TWO, ");
 if ((m==53)) text("FIFTY-THREE, ");
 if ((m==54)) text("FIFTY-FOUR, ");
 if ((m==55)) text("FIFTY-FIVE, ");
 if ((m==56)) text("FIFTY-SIX, ");
 if ((m==57)) text("FIFTY-SEVEN, ");
 if ((m==58)) text("FIFTY-EIGHT, ");
 if ((m==59)) text("FIFTY-NINE, ");
 
 
textFont(Blackout, 15); 
  if ((s==1)) text("ONE");
 if ((s==2)) text("TWO");
 if ((s==3)) text("THREE");
 if ((s==4)) text("FOUR");
 if ((s==5)) text("FIVE");
 if ((s==6)) text("SIX");
 if ((s==7)) text("SEVEN");
 if ((s==8)) text("EIGHT");
 if ((s==9)) text("NINE");
 if ((s==10)) text("TEN");
 if ((s==11)) text("ELEVEN");
 if ((s==12)) text("TWELVE");
 if ((s==13)) text("THIRTEEN");
 if ((s==14)) text("FOURTEEN");
 if ((s==15)) text("FIFTEEN");
 if ((s==16)) text("SIXTEEN");
 if ((s==17)) text("SEVENTEEN");
 if ((s==18)) text("EIGHTEEN");
 if ((s==19)) text("NINETEEN");
 if ((s==20)) text("TWENTY");
 if ((s==21)) text("TWENTY-ONE");
 if ((s==22)) text("TWENTY-TWO");
 if ((s==23)) text("TWENTY-THREE");
 if ((s==24)) text("TWENTY-FOUR");
 if ((s==25)) text("TWENTY-FIVE");
 if ((s==26)) text("TWENTY-SIX");
 if ((s==27)) text("TWENTY-SEVEN");
 if ((s==28)) text("TWENTY-EIGHT");
 if ((s==29)) text("TWENTY-NINE");
 if ((s==30)) text("THIRTY");
 if ((s==31)) text("THIRTY-ONE");
 if ((s==32)) text("THIRTY-TWO");
 if ((s==33)) text("THIRTY-THREE");
 if ((s==34)) text("THIRTY-FOUR");
 if ((s==35)) text("THIRTY-FIVE");
 if ((s==36)) text("THIRTY-SIX");
 if ((s==37)) text("THIRTY-SEVEN");
 if ((s==38)) text("THIRTY-EIGHT");
 if ((s==39)) text("THIRTY-NINE");
 if ((s==40)) text("FOURTY");
 if ((s==41)) text("FOURTY-ONE");
 if ((s==42)) text("FOURTY-TWO");
 if ((s==43)) text("FOURTY-THREE");
 if ((s==44)) text("FOURTY-FOUR");
 if ((s==45)) text("FOURTY-FIVE");
 if ((s==46)) text("FOURTY-SIX");
 if ((s==47)) text("FOURTY-SEVEN");
 if ((s==48)) text("FOURTY-EIGHT");
 if ((s==49)) text("FOURTY-NINE");
 if ((s==50)) text("FIFTY");
 if ((s==51)) text("FIFTY-ONE");
 if ((s==52)) text("FIFTY-TWO");
 if ((s==53)) text("FIFTY-THREE");
 if ((s==54)) text("FIFTY-FOUR");
 if ((s==55)) text("FIFTY-FIVE");
 if ((s==56)) text("FIFTY-SIX");
 if ((s==57)) text("FIFTY-SEVEN");
 if ((s==58)) text("FIFTY-EIGHT");
 if ((s==59)) text("FIFTY-NINE");
 
}

