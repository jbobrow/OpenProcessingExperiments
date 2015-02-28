

// Simple Math based on Ira Greenberg's
/*
title: fun with variables
 description: stepped radial gradient
 created: August 7, 2005
 Changed code from: by: Ira Greenberg
 */
 

// declare some global variables
int xpos;
int ypos;
int epos; 
// we create an interval variable to set the distance between values
int interval;
int gradientWidth; 
int gradientHeight;

void setup() {
  // set the sketch window size and background
  size(500, 500);
  background(135,206,250);
  smooth();
  interval = 255/20;
//  
//  // radial width
//  gradientWidth = width;
//  // radial height
//  gradientHeight = height;
//  
//  //radial center pt
//  // we divide the constant variable by 2 in order to get the center point of the sketch
//  xpos = width/250;
//  ypos = height/400;
//  epos = width/8;
//  //turn off stroke rendering
//  noStroke();
//  //create ellipses
//  //set fill color and render ellipse
//  fill(interval);
//  ellipse(epos, ypos, gradientWidth, gradientHeight);
//  
//  fill(interval*2);
//  ellipse(xpos, ypos, gradientWidth-interval, gradientHeight-interval);
//  
//  fill(interval*3);
//  ellipse(xpos, ypos, gradientWidth-interval*2, gradientHeight-interval*2);
// 
//  fill(interval*4);
//  ellipse(xpos, ypos, gradientWidth-interval*3, gradientHeight-interval*3);
//  
//  fill(interval*5);
//  ellipse(xpos, ypos, gradientWidth-interval*4, gradientHeight-interval*4);//


  //BEIZER VERTEX//
  beginShape();
  fill(141,182,205);
  strokeWeight (2);
  stroke(141,182,215);
vertex(30, 20);
bezierVertex(400, 0, 80, 75, 430, 475);
bezierVertex(50, 400, 60, 25, 430, 420);
endShape();


//Rect//
stroke(173,216,330);
noFill(); // top right blue 
rect(450,0,24,38);

//Rect//
stroke(173,216,330);
noFill(); // top right blue 
rect(450,40,24,38);

//Rect//
stroke(173,216,330);
noFill(); // top right blue 
rect(450,80,24,38);

//Rect//
stroke(173,216,330);
noFill(); // top right blue 
rect(450,120,24,38);

//Rect//
stroke(173,216,330);
noFill(); // top right blue 
rect(450,160,24,38);

//Rect//
stroke(173,216,330);
noFill(); // top right blue 
rect(450,200,24,38);

//Rect//
stroke(173,216,330);
noFill(); // top right blue 
rect(450,240,24,38);

//Rect//
stroke(173,216,330);
noFill(); // top right blue 
rect(450,280,24,38);

//Rect//
stroke(173,216,330);
noFill(); // top right blue 
rect(450,320,24,38);

//Rect//
stroke(173,216,330);
noFill(); // top right blue 
rect(450,360,24,38);

//Rect//
stroke(173,216,330);
noFill(); // top right blue 
rect(450,400,24,38);

//Rect//
stroke(173,216,330);
noFill(); // top right blue 
rect(450,40,440,38);

// Bézier path
  rectMode(CENTER);
  noFill();
  stroke(255);
  strokeWeight (1);
// Bézier curves can also be strung together to form longer continuous curves. The following
noFill();
 
  //LIGHTBLUE LINES//
  noFill();
  strokeWeight (2);
  stroke( 173,216,230); //lightblue
  bezier(500, 450, 350, 50, 25, 150, 0, 50);
  
   //ORANGE LINES /
 noFill();
  strokeWeight (1);
  stroke(255,69,0); //Orange1
  bezier(350, 100, 150, 200, 300, 150, 100, 150);
  
   noFill();
    stroke(255,69,0); //Orange2
  bezier(0, 146, 200, 150, 150, 250, 500, 500);
  
//YELLOW LINES/
strokeWeight (4);
  stroke(255,215,0); //yellow1
  bezier(0, 0, 150, 150, 150, 250, 150, 500);
  
    stroke(255,215,0); //yellow2
  bezier(500, 0, 150, 150, 150, 250, 150, 500);
 
 // fill(173,216,230);
    stroke(255,215,0); //yellow3
  bezier(0, 350, 200, 150, 100, 250, 150, 500);
 
  noFill();
    stroke(255,215,0); //yellow4
  bezier(0, 350, 200, 150, 150, 250, 150, 500);
  
  noFill();
    stroke(255,215,0); //yellow5
  bezier(0, 5, 200, 150, 150, 250, 500, 500);
 
 
 

//STRING ELIPSE With Print equations//
 noStroke();
  float posY = 100;
  float posx = 200;// (DONT UNDERSTAND FLOAT)
  
  posY = posY + 50/2;
  fill(255 - posY);
  ellipse(width/10, posY, 25, 25); //width=250 one half of 500 this is also your x//
  println(posY);
 
   fill(255 - posY);
  ellipse(width/2, posY, 5, 5); //width=250 one half of 500 this is also your x//
  println(posY);
  
  posY = posY + 50;
  fill(255 - posY);
  ellipse(width/3, posY, 5, 5);
  println(posY);
  
   
// posY = posY - 25;
//  fill(255 - posY);
//  ellipse(width/3, posY, 5, 5);
//  println(posY);
  
  posY += 50;
  fill(255 - posY);
  ellipse(width/4, posY, 5, 5);
  println(posY);
  
  posY += 70;
  posY += 1;
  fill(255,69,0);
  ellipse(width/5, posY, 5, 5);
  println(posY);
  
  posY += 50;
  posY += 0;
  fill(255,69,0);
  ellipse(width/6, posY, 5, 5);
  println(posY);
  
   posY += 50;
  posY += 0;
  fill(255,69,0);
  ellipse(width/7, posY, 5, 5);
  println(posY);
  
  //Continual line//
  stroke(173,216,330);
  strokeWeight(1);
  noFill();
  bezier(0,123,231,278,298,260,500,346);
  stroke(173,216,330);
  strokeWeight(1);
  bezier(0,372, 110,370, 120,50, 490, 500);
  
  stroke(173,216,330);
  strokeWeight(1);
  noFill();
  bezier(0,123,231,278,298,260,500,346);
  stroke(173,216,330);
  strokeWeight(1);
  bezier(500,372, 110,370, 120,50, 490, 500);
  
  stroke(173,216,330);
  strokeWeight(1);
  noFill();
  bezier(0,23,231,278,298,260,500,346);
  stroke(173,216,330);
  strokeWeight(1);
  bezier(500,72, 110,370, 120,50, 0, 500);
  
  //ARC x 3 //
//    fill(255,215,0);
//  //First arc
//  arc(150, 150, 100, 100, 0, PI/2); // goes clockwise and starts on right // 
//  
//  // set fill color
//  fill(255, 255, 0);
//  // set the stroke color
//  stroke(255, 0, 200);
//  //Second arc
//  arc(150, 150, 100, 100, PI/2, PI);
  
  // set fill color
  fill(255,215,0);
  // set the stroke color
  stroke(255);
  //Third arc
  arc(50, 50, 75, 75, PI, TWO_PI-PI/2);
  

  fill(255,215,0);
  //Fourth arc
  arc(50, 50, 75, 75, TWO_PI-PI/2, TWO_PI);
  
  String no ="I wish I had 1.5 more time to work on the design but I got too nerdy!";
println("1"); 
print(no);

float point5= 1.5; 
String iWish = "I wish I had "; 
String more= "more time to work on the design but I got too nerdy!";

 println(iWish + point5 +  more);
  
}



//need to addd...
//arc (use color arcs and change colors)....curve...beginSHAPE


