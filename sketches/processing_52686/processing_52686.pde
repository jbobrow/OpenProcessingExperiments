
/*****************************************
 * Assignment # 3
 * Name: Ilana Mittleman
 * E-mail:imittleman@brynmawr.edu
 * Course:CS 110 - Section # 2
 * Submitted: 2/14/2012
 * This sketch is of an ocean with magical fish that change color
 * The sketch has two functions: the goldfish and the jellyfish, both of which change colors!
 ***********************************************/

//gradient code thanks to Dianna Xu
//set up size, background 
void setup(){
  size(600, 600);
  background(0);
  smooth();
  noStroke();

  int steps = 100;
  float x = 0.0;
  float y = 0.0;
  float w = width/steps;
  float h = height;

  println(w);
  
  color startC, endC;
  //startC = color(255, 50, 50); // red
  //endC = color(10, 100, 10); // green
  //startC = color(255, 255, 0); // yellow
  //endC = color(120, 0, 155); // purple
  startC = color(152, 212, 234); // blue
  endC = color(6, 43, 88); // orange

  float startR, startG, startB;
  float endR, endG, endB;
  float deltaR, deltaG, deltaB;

  startR = red(startC);
  startG = green(startC);
  startB = blue(startC);

  endR = red(endC);
  endG = green(endC);
  endB = blue(endC);
  
  deltaR  = (endR - startR)/(steps-1);
  deltaG  = (endG - startG)/(steps-1);
  deltaB  = (endB - startB)/(steps-1);
  
  int i = 0;
  while (i<steps){
    fill(startC);
    rect(x, y, w, h);
    startR += deltaR;
    startG += deltaG;
    startB += deltaB;
    startC = color(startR, startG, startB);
    x += w;
    i++;
  }
}
//draw the fish
void draw (){
  drawfish(200, 200, 50);
  
  drawfish(100, 100, 40);
  
  drawfish(350, 400, 60);
  
  drawfish(470, 470, 80);
  
  drawfish(470, 50, 45);
  
  drawjellyfish(100, 300, 70, 20, 30);
  
  drawjellyfish(200, 450, 80, 20, 30);
  
  drawjellyfish(400, 100, 50, 20, 30);
  
  drawjellyfish(425, 250, 100, 30, 30);
}
//function of goldfish
void drawfish (int xfish, int yfish, int radiusfish){
   for(int i=0;i<=255;i++){
    frameRate(2);
  fill(random(255),random(255), random(255));
  }
  stroke(0);
  smooth();
  ellipse(xfish, yfish, radiusfish, radiusfish);
  triangle(radiusfish/2+xfish, yfish, xfish+radiusfish, yfish-radiusfish/2, xfish+radiusfish, yfish+radiusfish/2);
  fill(255);
  ellipse(xfish-10, yfish-2, radiusfish/4, radiusfish/4);
}
//function of jellyfish
//code thanks to Hao Wang
void drawjellyfish(int x, int y, int radiuswidth, int radiusheight, int wL){
  for(int i=0;i<=255;i++){
    frameRate(2);
  fill(random(15)+150,random(25)+150, 255);
  }
  ellipse(x, y, radiuswidth, radiusheight);
  line(x, y+radiuswidth/7, x, y+radiuswidth/7+wL);
  line(x+radiusheight/2, y+radiuswidth/7, x+radiusheight/2, y+radiuswidth/7+wL);
  line(x+radiusheight/2+radiusheight/2, y+radiuswidth/7, x+radiusheight/2+radiusheight/2, y+radiuswidth/7+wL);
  line(x-radiusheight/2, y+radiuswidth/7, x-radiusheight/2, y+radiuswidth/7+wL);
  line(x-radiusheight/2-radiusheight/2, y+radiuswidth/7, x-radiusheight/2-radiusheight/2, y+radiuswidth/7+wL);
}



