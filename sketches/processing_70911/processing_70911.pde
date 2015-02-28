
/*****************************************
 * Assignment  #2
 * Name:    Yunqi Chen (Angie)
 * E-mail:  ychen07@brynmawr.edu
 * Course:      CS 110 - Section 01
 * Submitted:   
 * 
 * This is a simple program of the popular game - Tic Tac Toe
 * Several methods in chapter 1 - 7 have been applied, 
 * including conditionals such as if-else, for, switch, 
 * as well as a few variables to run the program efficiently
 *
 ***********************************************/
int n = 0;

void setup() {
  size(600, 600);
  smooth();
  frameRate(5);
  drawBackground();
  println("WELCOME TO TIC TAC TOE");
  println("PRESS ANY KEY TO RESTART");
  println("Programmed by Angie Yunqi Chen");
}


void draw() {
}


void drawBackground() {  
 
   // draw the 9 random-colored rectangles
  for (int p = 100; p <= 500; p+= 200) {
    for (int q = 100; q <= 500; q += 200) {
      noStroke();
      rectMode(CENTER);
      fill(0, random(150, 255), random(100, 255));
      rect(p, q, 190, 190);
    }
  }
 
  //draw the 'skeleton' of the background
  for (int a = 200; a <= 400; a+= 200) {
    stroke(0);
    strokeCap(ROUND);
    strokeWeight( random(20, 25));
    line(a, 10, a, height-10);
    line(0, a, width, a);
  }


  //draw the 'logo' of Tic Tac Toe -- TTT
  int k = floor (random(50, 400));
  int b = floor (random(50, 500));
  drawT (k, b);
  drawT (k+80, b);
  drawT (k+160, b);
}


//Draw the Logo of three Ts
void drawT(int i, int j) {
  strokeCap(ROUND);
  strokeWeight(20);
  stroke(random(255), random(255), random(80, 255), 200);
  line(i, j, i, j + 100);
  strokeWeight(20);
  line(i - 40, j, i + 40, j);
  strokeWeight(5);
}


//Now start programming the game!
void mousePressed() {

  if (n % 2 == 0)
  {    
    drawPlayer1();
    n ++;
  } 
  else {
    drawPlayer2();
    n ++;
  }
}


//Directions for drawing 'o' in designated area
void drawPlayer1() {
  float x = mouseX/200;
  float y = mouseY/200;
  strokeWeight(20);
  strokeCap(ROUND);
  noFill(); 
  ellipseMode(CENTER);  
  rectMode(CENTER); 
  switch(ceil(x) + 3* ceil(y)) {
  case 0: 
    stroke(255, 0, 0);
    ellipse(100, 100, 120, 120);
    break;
  case 2: 
    stroke(255, 0, 0);
    ellipse(500, 100, 120, 120);
    break;
  case 4: 
    stroke(255, 0, 0);
    ellipse(300, 300, 120, 120); 
    break;
  case 6: 
    stroke(255, 0, 0);
    ellipse(100, 500, 120, 120);
    break;
  case 8: 
    stroke(255, 0, 0);
    ellipse(500, 500, 120, 120);
    break;
  case 1:
    stroke (12, 19, 196);
    ellipse(300, 100, 120, 120);
    break;
  case 3:
    stroke (12, 19, 196);
    ellipse(100, 300, 120, 120);
    break;
  case 5:
    stroke (12, 19, 196);
    ellipse(500, 300, 120, 120);
    break;
  case 7:
    stroke (12, 19, 196);
    ellipse(300, 500, 120, 120);
    break;
  }
}


//directions for drawing 'x' 
void drawPlayer2() {
  float x = mouseX/200;
  float y = mouseY/200;
  strokeWeight(20);
  strokeCap(ROUND);
  noFill(); 
  switch(ceil(x) + 3* ceil(y)) {
  case 0: 
    stroke(255, 0, 0);
    line(50, 50, 150, 150);
    line(50, 150, 150, 50);
    break;
  case 2: 
    stroke(255, 0, 0);
    line(450, 50, 550, 150);
    line(550, 50, 450, 150);
    break;
  case 4: 
    stroke(255, 0, 0);
    line(250, 250, 350, 350);
    line(350, 250, 250, 350);
    break;
  case 6: 
    stroke(255, 0, 0);
    line(50, 450, 150, 550);
    line(150, 450, 50, 550);
    break;
  case 8: 
    stroke(255, 0, 0);
    line(450, 450, 550, 550);
    line(550, 450, 450, 550);
    break;
  case 1:
    stroke (12, 19, 196);
    line(250, 50, 350, 150);
    line(350, 50, 250, 150);
    break;
  case 3:
    stroke (12, 19, 196);
    line(50, 250, 150, 350);
    line(150, 250, 50, 350);
    break;
  case 5:
    stroke (12, 19, 196);
    line(450, 250, 550, 350);
    line(550, 250, 450, 350);
    break;
  case 7:
    stroke (12, 19, 196);
    line(250, 450, 350, 550);
    line(350, 450, 250, 550);
    break;
  }
}

//restart the game
void keyPressed() {
  drawBackground();
}


