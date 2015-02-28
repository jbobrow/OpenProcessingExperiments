
// Computing for the Arts with Processing Homework 7
// Copyright 2013 Stephanie Cheung and the whispering forest
// Protect the power lines! Move the gray sheilds to prevent the shapes from damaging the center rectangle. 
// Move the top sheild with your mouse and the bottom sheild with the "a" and "d" keys. You must click the window before attempting to move the bottom sheild.
// Speed up the projectiles to increase your score with the "w" key, or slow them down with the "s" key.
// Five collisions and it's game over! Good luck!


float x1,y1,sz1,dx1,dy1;
float x2,y2,sz2,dx2,dy2;
float x3,y3,sz3,dx3,dy3;
float d;
float score;
float dscore;
int lifecount;

void setup() {
  size(600,600);
  
  x1 = 100;
   y1 = 100;
   sz1 = 20;
   dx1 = 3;
   dy1 = 2;
 
   x2 = 200;
   y2 = 100;
   sz2 = 40;
   dx2 = 2;
   dy2 = 2;
 
   x3 = 100;
   y3 = 500;
   sz3 = 20;
   dx3 = 2;
   dy3 = 2;
   d = width*.5;
   
   score = 0;
   dscore = .1;
   lifecount = 5;
   
   rectMode(CENTER);
   

}

void draw() {
 prepscreen() ;
 fig1() ;
 moveFig1() ;
 
 moveFig2() ;
 fig2() ;
 
 moveFig3() ;
 fig3() ;
 
 sheild1();
 
 sheild2();
 
 keepScore();
 gameover() ;
}

void prepscreen() {
 background(0);
 noStroke();
 fill(2,7,21);
 rect(width*.5,height*.5, width*.85,height*.85);
 fill(3,15,36);
 rect(width*.5,height*.5, width*.65,height*.65);
  fill(4,18,57);
 rect(width*.5,height*.5, width*.55,height*.55);
 fill(3,15,36);
 rect(width*.5,height*.5, width*.45,height*.45);
 fill(2,7,21);
 rect(width*.5,height*.5, width*.35,height*.35);
 fill(0);
 rect(width*.5,height*.5, width*.25,height*.25);
 fill(2,7,21);
 ellipse(width*.5,height*.5, width*.15,height*.15);
 
 fill(255);
 rect(width*.5,height*.5, width,height*.05); 
 fill(255,255,0);
 rect(width*.5,height*.5, width,height*.027);
 fill(0);
 //textSize(15);
 //text ( "Power Lines", width * .4, height*.51);
 fill(255);
 textSize(20);
 text ( "Lives left: " + lifecount, width*.15, height*.9);
 textSize(15);
 text ( "Use the A and D keys to move the bottom sheild.", width*.15, height*.8);
 text ( "Use the W and S keys to speed up and slow down the rocks.", width*.15, height*.85);
 textSize(20);
 text ( "Score:" + int(score) , width*.15, height*.1) ;
}



void sheild1() {
  fill(80);
  arc(mouseX, height*.475, 100,30,PI,2*PI);
  fill(121);
  arc(mouseX, height*.475, 80,20,PI,2*PI);
  fill(150);
  arc(mouseX, height*.475, 60,10,PI,2*PI);
}

void keepScore(){
 score = score + dscore; 
 if (dx1 == 0 || dy1 == 0 || dx2 == 0 || dy2 == 0 || dx3 == 0|| dy3 == 0) {
     dscore = 0; 
    }
}

void keyPressed() {
  if (key == 'd'){
    d += 10;
  }
  if (key == 'a') {
   d -= 10; 
  }
  if (key == 'w') {
    if (dx1 > 0) {
     dx1 += 1; 
    }
    if (dx1 < 0) { 
      dx1 -= 1;
    }
    if (dx1 == 0) {
     dx1 = 1; 
    }
   if (dy1 > 0) {
     dy1 += 1; 
      }
      if (dy1 < 0) { 
      dy1 -= 1;
      }
      if (dy1 == 0) {
     dy1 = 1; 
    }
    if (dx2 > 0) {
     dx2 += 1; 
    }
    if (dx2 < 0) { 
      dx2 -= 1;
    }
    if (dx2 == 0) {
     dx2 = 1; 
    }
    if (dy2 > 0) {
     dy2 += 1; 
    }
    if (dy2 < 0) { 
      dy2 -= 1;
    }
    if (dy2 == 0) {
     dy2 = 1; 
    }
    if (dx3 > 0) {
     dx3 += 1; 
    }
    if (dx3 < 0) { 
      dx3 -= 1;
    }
    if (dx3 == 0) {
     dx3 = 1; 
    }
    if (dy3 > 0) {
     dy3 += 1; 
    }
    if (dy3 < 0) { 
      dy3 -= 1;
    }
    if (dy3 == 0) {
     dy3 = 1; 
    }
  
     dscore += .1; 
  }
  if (key == 's') {
   if (dx1 > 0) {
     dx1 -= 1; 
    }
    if (dx1 < 0) { 
      dx1 += 1;
    }
   if (dy1 > 0) {
     dy1 -= 1; 
      }
      if (dy1 < 0) { 
      dy1 += 1;
      }
    if (dx2 > 0) {
     dx2 -= 1; 
    }
    if (dx2 < 0) { 
      dx2 += 1;
    }
    if (dy2 > 0) {
     dy2 -= 1; 
    }
    if (dy2 < 0) { 
      dy2 += 1;
    }
    if (dx3 > 0) {
     dx3 -= 1; 
    }
    if (dx3 < 0) { 
      dx3 += 1;
    }
    if (dy3 > 0) {
     dy3 -= 1; 
    }
    if (dy3 < 0) { 
      dy3 += 1;
    }
    
    dscore -= .05;
  }
}

void sheild2() {
  fill(80);
  arc(d, height*.525, 150,30,0,PI);
  fill(121);
  arc(d, height*.525, 120,20,0,PI);
  fill(150);
  arc(d, height*.525, 100,10,0,PI);
}

void moveFig1() {
 x1 += dx1;
  y1 += dy1;
 if (y1 > height || y1 < 0) {
  dy1 = -dy1;
 } 
 else if (height*.45 < y1 && y1 < height*.55) {
   dy1 = -dy1;
   fill (255,0,0);
   ellipse(x1,y1, 50,50);
   lifecount -= 1;

 }
 if (x1 > width || x1 < 0) {
  dx1 = -dx1; 
 }
 if ( dist(x1,y1, mouseX,height*.478) < 50 && y1 > (height*.5)-42){
  dy1 = -dy1; 

 }
}

void fig1() {
  fill(255);
  ellipse( x1,y1, sz1,sz1);
  fill(219,22,22);
  ellipse( x1,y1, sz1*.75,sz1*.75);
  fill(245,93,42);
  ellipse( x1, y1, sz1*.5, sz1*.5);
}

void moveFig2() {
 x2 += dx2;
  y2 += dy2;
 if (y2 > height) {
  y2 = 0;
 } 
 if (y2 < 0) {
  y2 = height; 
  x2 = width;
 }
 if (x2 > width) {
  x2 = 0; 
 }
 if (x2 < 0) {
  x2 = width; 
 }
 if (height*.45 < y2 && y2 < height*.5) {
  y2 = height *.6; 
  fill(255,0,0);
  ellipse(x2,y2, 100,100);
  lifecount -= 1;

 }
 if (y2 < height*.55 && y2 > height*.5) {
  y2 = height * .4 ;
  fill(255,0,0);
  ellipse(x2,y2, 100,100);
  lifecount -= 1;

 }
 if ( dist(x2,y2, d,height*.525) < 75 && y2 < (height*.5)+60 && y2 > (height*.5)){
  dy2 = -dy2; 

 }
 if ( dist(x2,y2, mouseX,height*.425) < 50 && y2 > (height*.5)-60){
  dy2 = -dy2; 

 }
}

void fig2() {
 fill(255);
  rect(x2,y2,sz2,sz2); 
  fill(219,22,22);
  rect( x2,y2, sz2*.75,sz2*.75);
  fill(245,93,42);
  rect( x2, y2, sz2*.5, sz2*.5);

}

void moveFig3() {
 x3 += dx3;
  y3 += dy3;
 if (y3 > height || y3 < 0) {
  dy3 = -dy3;
 } 
 else if (height*.45 < y3 && y3 < height*.55) {
   dy3 = -dy3;
   fill (255,0,0);
   ellipse(x3,y3, 50,50);
   lifecount -= 1;

 }
 if (x3 > width || x3 < 0) {
  dx3 = -dx3; 
 }
 if ( dist(x3,y3, d,height*.525) < 75 && y3 < (height*.5)+40){
  dy3 = -dy3; 
 }
}

void fig3() {
 fill(255);
  ellipse( x3,y3, sz3,sz3);
  fill(219,22,22);
  ellipse( x3,y3, sz3*.75,sz3*.75);
  fill(245,93,42);
  ellipse( x3, y3, sz3*.5, sz3*.5);
}

void gameover() {
 if (lifecount <= 0) {
   dscore = 0;
   fill(0);
  rect(width*.5, height*.5, width, height);
  fill(255);
  textSize(34);
  text("Game Over! :(" , width*.35, height*.5);
  text("Score: " + int(score), width*.28, height*.4);
  rect(width*.5, height*.7, 200,75);
  fill(0);
  text("Restart?" , width* .4, height*.72);
  if (mousePressed && mouseX < (width*.5+100) && mouseX > (width*.5 -100) && mouseY < (height*.7+37) && mouseY > (height*.7 -37)) {
   lifecount = 5; 
   score = 0;
   dscore = .1;
   x1 = 100;
   y1 = 100;
   sz1 = 20;
   dx1 = 3;
   dy1 = 2;
 
   x2 = 200;
   y2 = 100;
   sz2 = 40;
   dx2 = 2;
   dy2 = 2;
 
   x3 = 100;
   y3 = 500;
   sz3 = 20;
   dx3 = 2;
   dy3 = 2;
   d = width*.5;
  }
 } 
}




