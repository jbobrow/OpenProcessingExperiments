
int x=30;
int y= 0;
PImage img1;



void setup (){
  size(800, 400 );
  
  
 img1 = loadImage("Test.png");
 
  
  

  
  background (255);
  
  noStroke();
  smooth();
 
  
  
 
};

 
void draw(){
  textSize(15);
  fill(0,102,153,80);
  text("Pard Morrison's remade by J Kim", 520, 390);
  
  //image
  
  image (img1, 10, 20, 790, 380);
  filter(GRAY);
  
  
  
  
  
  
  
 
  
  
  
 noStroke();
  
  
   // Right Side
  
  fill(#F2C053);
  quad (390, 150, 390, 250, 480, 180, 480, 80);
  fill(#73DDFC);
  quad (430, 150, 400, 170, 390, 170, 390, 150);
 
  
  
  //Left and quads
  fill (180);
  quad (300, 170, 360, 130, 260, 130, 200, 170);
  fill(#A573FC);
  quad (300, 170, 200, 170, 140, 210, 240, 210);
  rectMode(CORNER);
  fill(#73FCF9);
  rect (140, 210, 100, 50);
  fill(#D8CF99);
  rect (140, 260, 100, 50);
  fill(#BF6528);
  triangle( 240, 210, 300, 220, 240, 260);
  fill(#F5408F);
  triangle( 240, 260, 300, 220, 300, 270);
  fill (#A7A781);
  triangle (300, 270, 240, 260, 240, 310);
  
  
  //Left top
  rectMode(CORNER);
  fill(#CECEB3);
  rect (260, 60, 100, 70);
  fill(#A7A781);
  quad (200, 170, 100, 170, 40, 210, 140, 210);
  rectMode(CORNER);
  fill(0);
  rect (40, 210, 100, 50);
  
  
  //middle two boxes
  fill(#A7A781);
  triangle(300, 170, 240, 210, 300, 220);
  fill (#46AA74);
  triangle(300, 170, 360, 170, 360, 130);
  fill (#2E51A7);
  rect (300, 170, 100, 50); 
  fill (#E83C36);
  rect (300, 220, 100, 50);
  smooth();
  fill (#36B1E8);
  quad (400, 170, 400, 220, 430, 200, 430, 150);
  fill (#18B9B0);
  quad (400, 220, 400, 270, 430, 250, 430, 200);

//beziers

  fill (#E8A349); 
  bezier (480, 80, 490, 50, 570, 50, 580, 80);
  rect (480, 80, 100, 100);
  fill(255);
  bezier (480, 180, 480, 150, 570, 150, 580, 180);


//far right
//quad (580, 80, 580, 180, 610, 210, 610, 110);
//quad (580, 80, 610, 110, 660, 110, 630, 80);
//rect (610, 110, 50, 100);
 
  fill(#E8F539);
  quad (580, 80, 550, 110, 550, 210, 580, 180);
  fill (#1D71B4);
  rect ( 550, 110, 70, 100);
  fill (#3BC191);
  rect ( 550, 110, 70, 70);
  fill(50);
  quad (620, 110, 620, 210, 590, 240, 590, 140);
  fill(#E77FF7);
  rect (590, 140, 70, 100);
  fill(#BACE9E);
  rect (590, 140, 35, 100);
  
//far far right
  fill(#F02465);
  rect ( 660, 140, 70, 100);
  fill (#2699A5);
  rect ( 660, 140, 70, 50);
  fill(#1317D3);
  quad (660, 140, 730, 140, 760, 110, 690, 110);
  fill(70);
  quad (590, 240, 660, 240, 630, 270, 560, 270);
  
  

  
  
  stroke(#CFD194);
x=x+5;
y=y+5;
  line (0, 0 , 800, 0);
  line (y-400, y, 1600, 0);
  stroke(#D1B194);
  line (0, 400, 1600-y, 400-y);
 
  
};
  
  


