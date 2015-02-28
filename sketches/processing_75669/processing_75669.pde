
//Rachel
//Introduction to Digital Media Fall 2012
//Section A
//09-11-12

float randomDiameter=200;
float stroke=0;
boolean invertedColors = false;
color color1=color(24, 223, 240);//blue
color color2=color(174.240, 24);//grey
color tempColor=color1;

void setup() {
  size (1200, 600);
  smooth();
  frameRate(10000);
}

void draw() {
  background (81,98,63,200);//green
  
  for(int i=50; i<800; i++)
  {
    stroke(197,230,250); //light blue
    strokeWeight(1);
    strokeCap(SQUARE);
    smooth();
    line(i*i,i^500,i*i,i/100);
  }
  
  for(int i=0;i<5000; i++)
  {
    stroke(150,255,220,60); //teal
    strokeWeight(1);
    strokeCap(SQUARE);
    smooth();
    line(i^100, sin(300), i*3,i*2);
  }
  
  if (invertedColors==true) {
    color1=color(24, 223, 240, 150);//blue
    color2=color(191,255,3, 75);//green
//    tempColor = color1;
//    color1 = color2;
//    color2 = tempColor;
  }
  else {
    color1=color(174, 240, 24,200);//green
    color2=color(240,197, 24,100);//yellow
  }

 randomDiameter=random(100);
  smooth ();
  stroke (color1);
  strokeWeight (10);
  fill (color2);
  ellipse (mouseX, mouseY, randomDiameter, randomDiameter);


  smooth ();
  stroke (color2);
  strokeWeight (10);
  fill (color1);
  ellipse (mouseX, 200, randomDiameter, randomDiameter);

 randomDiameter=random(30);
  smooth ();
  stroke (color1);
  strokeWeight (2);
  fill (color2);
  ellipse (800, mouseY, randomDiameter, randomDiameter);

  smooth ();
  stroke (color2);
  strokeWeight (2);
  fill (color1);
  ellipse (400, mouseY, randomDiameter, randomDiameter);
  
 randomDiameter=random(300);
  smooth ();
  stroke (color1);
  strokeWeight (20);
  fill (color2);
  ellipse (600, mouseY, randomDiameter, randomDiameter);

  smooth ();
  stroke (color2);
  strokeWeight (20);
  fill (color1);
  ellipse (300, mouseY, randomDiameter, randomDiameter);
  
  for(int i=10;i<1200;i++)
  {
    stroke(255,50); //white
    strokeWeight(.5);
    strokeCap(SQUARE);
    smooth();
    line(mouseX,i-400,cos(100),i/500);
  }
  
  for(int i=10;i<1200;i++)
  {
    stroke(255,65); //white
    strokeWeight(1);
    strokeCap(SQUARE);
    smooth();
    line(i-500, mouseY,i-200, sin(100));
  }
  
  for(int i=10;i<1200;i++)
  {
    stroke(255,80); //white
    strokeWeight(1);
    strokeCap(SQUARE);
    smooth();
    line(i+200, mouseY,mouseX, i^3);
  }
}

void mouseClicked() {
  invertedColors = !invertedColors;
  println(invertedColors);
}



