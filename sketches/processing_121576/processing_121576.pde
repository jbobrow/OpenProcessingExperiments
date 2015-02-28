
//light-sabers
int counter;
color strokeA, strokeB;
// lil sis minion
float x, y, dia;
float xdist, ydist;
float easingCoef;
color bgc, ellipseColor;

void setup()
{

  size( 1000, 1000);
  
 strokeWeight( 11);
 //light sabers color
  strokeA = color( random( 255 ), random( 255 ), random( 255 ) );
  strokeB = color( random( 255 ), random( 255 ), random( 255 ) );
  // lil sis minion
  easingCoef = .05;  // "pull" of the mouse
  bgc = color( 0, 0, 255, 5 );
  ellipseColor = color( 0 );
  noStroke( );
  frameRate( 200 ); //"frameRate" is the approximate frame rate of a running sketch..frames per second
  dia = 50; //diameter
 

}

void draw()
{
  background( 168, 103, 103);
  //left hand
  arc( 308, 417, 80, 70, PI / 4, 4 * PI / 2);

  //right hand
  arc( 640, 495, 90, 70, -PI+HALF_PI, CHORD);

 //legs of litte sister (left)
 ellipse( 470, 720, 100, 150);
 //legs of little sister (right)
 ellipse( 580, 700, 100, 150);
  //body of little sister
  
  fill( 191, 191, 191);
  beginShape(); 
  vertex( 410, 420);
  vertex( 340, 390);
  vertex( 305, 450);
  vertex( 370, 480);
  vertex( 410, 700);
  vertex( 630, 665);
  vertex( 565, 500);
  vertex( 620, 530);
  vertex( 650, 460);
  vertex( 550, 440);
  endShape(CLOSE);
  noFill();
  //head of little sister
  fill( 120, 120, 120 );
  ellipse( 500, 300, 300, 300);
  noFill();
  fill( 255, 0, 0);
  //left eye of little sister
  ellipse( 425, 320, 50, 50);

  //right eye of little sister
  ellipse( 515, 368, 50, 50);

  //right horn of little sister
  beginShape();
  vertex( 620, 390);
  vertex( 790, 415);
  vertex( 900, 250); //mousex 900, mousey, 250
  vertex( 750, 380);
  vertex( 640, 360);
  endShape(CLOSE);

  //left horn of little sister
  beginShape();
  vertex( 358, 350);
  vertex( 200, 300);
  vertex( 170, 130);
  vertex( 242, 282);
  vertex( 350, 320);
  endShape(CLOSE);
  noFill();

  //mouth of little sister
  fill( 255);
  arc( 445, 400, 85, 85, 0, PI+QUARTER_PI, CHORD);
  noFill(); 

  //teeth of little sister
  triangle( 425, 378, 425, 390, 430, 380);
  triangle( 440, 385, 440, 395, 445, 385);
  triangle( 460, 395, 460, 405, 470, 400);
  
  int rightY = mouseY;
  if(mouseY>550)
  {
  //then
  rightY=550;
  }
  
  if(mouseY<490)
  {
  //then
  rightY = 490;
  }
  

  //claws of little sister (right side)
  fill( 255, 0, 0);
  strokeWeight(1);
  triangle( 670, 475, 750, 490, 670, 490); //mouseX is 750, mouseY is 490
  triangle( 670, 499, 750, rightY, 665, 515); //mouseX is 750, mouseY is 510
  triangle( 650, 530, 730, 550, 665, 515); //mouseX is 730, mouseY is 550

int leftY = mouseY;
if(mouseY>550)
{
//then
leftY = 410;
}

if(mouseY<490)
{
//then
leftY = 360;
}

  //claws of little sister (left side)
  triangle( 305, 385, 200, 360, 290, 400);
  triangle( 290, 400, 200, leftY, 290, 420); //leftY is 380
  triangle( 290, 420, 200, 410, 290, 435);

  //bow of little sister(left side)
  fill(115, 83, 60);
  triangle( 402, 170, 340, 90, 325, 120);
  fill( 209, 56, 56);
  ellipse( 415, 150, 50, 50);
  ellipse( 375, 180, 50, 50);

  //bow of little sister(right side)
  fill( 115, 83, 60);
  triangle( 630, 200, 720, 160, 730, 190);
  fill( 209, 56, 56);
  ellipse( 625, 180, 50, 50);
  ellipse( 655, 220, 50, 50);

  //hair of little sister
  stroke( 115, 83, 60);
  line(355, 300, 390, 250);
  line( 390, 250, 600, 350);
  line( 600, 350, 610, 400);
  //top haird of little sister
  strokeWeight( 13);
  line( 420, 180, 390, 250);
  line( 390, 215, 363, 275);
  line( 460, 160, 420, 260);
  line( 490, 155, 440, 265);
  line( 520, 163, 465, 282);
  line( 550, 168, 487, 290);
  line( 580, 185, 520, 307);
  line( 600, 200, 540, 315);
  line( 620, 220, 570, 328);
  line( 640, 250, 590, 340);
  line( 648, 269, 615, 380);
  stroke(0);
  noFill();
  //ellipse and triangle on shirt
  fill(245, 212, 27);
    strokeWeight( 6);
   triangle( 430, 600, 480, 500, 560, 600);
  strokeWeight( 5);
 ellipse(490, 560, 65, 30); 
 fill( 255);
 
 //lines on little siser legs
 strokeWeight( 17);
  line( 425, 720, 520, 700);
  stroke( 255, 0, 0);
  line( 430, 750, 510, 730);
  stroke(0);
  line( 540, 700, 620, 690);
  stroke( 255, 0, 0);
  line( 540, 730, 620, 720);
  stroke(0);
  strokeWeight( 10);
  //illuminati eye
  ellipse( 490, 560, 10, 30);
// TEXT

fill(0);
PFont f;
f=createFont("Impact", 45, true);
textFont(f, 45);
text("Little Sister", 700, 50);

//hug me button and font
fill(0);
stroke(0);
strokeWeight(1);
ellipse( 420, 480, 50, 50);
fill(242, 70, 128);
f=createFont("Times New Roman", 10, true);
textFont(f, 10);
text("Free Hugs", 401, 480);

//body fill
fill(255);
stroke(0);

//lil sis minion
  fill( bgc);
   
  xdist = mouseX - x;
  ydist = mouseY - y;
   
  x = x + ( xdist * easingCoef );
  y = y + ( ydist * easingCoef );
  
  
  fill( ellipseColor );
  ellipse( x, y, dia, dia ); //dia is 50
strokeWeight(11);

//light-sabers
  fill( 0, 20 );
  
    translate(700, 500 );
    rotate( radians( frameCount) ); //"frame count" is  the number of frames that have been displayed since the program started
    stroke( strokeA );
    line( 0, 0, 100, 100 );
    stroke( strokeB );
    line( 0, 0, -100, -100 );
    
    stroke(0);
    fill(255);

}




