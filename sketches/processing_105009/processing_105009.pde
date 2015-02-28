
void setup(){
  size (800,800);
  background(255);
}


color red = color(255,0,0);
color blue = color (0,0,255);
color green = color (0,255,0);
color yellow = color (255,255,0);
color aqua = color (0,255,255);
color coral = color (240, 128, 128);
color maincolor = color (0);
color black = color(0);
int brushsize=0;

void draw(){
  
  smooth();
  
  fill(maincolor);
  noStroke();
  ellipse (mouseX, mouseY, 5+brushsize, 5+brushsize);
  
  fill(255);
  rect(0,0,800,100); //top bar;
  stroke(maincolor);
  line(20,100,780,100);
  
  fill(255);
  rect(0,600,800,800); //bottom bar;
  stroke(maincolor);
  line(20,100,780,100);

  
  //color boxes
  noStroke();
  fill (red); //red color selection
  rect (50, 50, 20, 20);
  fill (blue); //blue color selection
  rect (100, 50, 20, 20);
  fill (yellow); //yellow color selection
  rect (150, 50, 20, 20);
  fill (aqua); //aqua color selection
  rect (200, 50, 20, 20);
  fill (coral); //aqua color selection
  rect (250, 50, 20, 20);
  fill (black); //black color selection
  rect (300, 50, 20, 20);
  
  //size ellipses
  
  fill(maincolor);
  noStroke();
  ellipse (600,50,5,5);
  
  fill(maincolor);
  noStroke();
  ellipse (650,50,10,10);
  
  fill(maincolor);
  noStroke();
  ellipse (700,50,20,20);
  
  fill(maincolor);
  noStroke();
  ellipse (750,50,30,30);
  
  
  //colour changes
 
  if ( (mouseX>50) && (mouseX<70) && (mouseY>50) && (mouseY<70) )
  maincolor=red;
  
 
  if ( (mouseX>100) && (mouseX<120) && (mouseY>50) && (mouseY<70) )
  maincolor=blue;
  
 
  if ( (mouseX>150) && (mouseX<170) && (mouseY>50) && (mouseY<70) )
  maincolor=yellow;
  

  if ( (mouseX>200) && (mouseX<220) && (mouseY>50) && (mouseY<70) )
  maincolor=aqua;
  
 
  if ( (mouseX>250) && (mouseX<270) && (mouseY>50) && (mouseY<70) )
  maincolor=coral;
  

  if ( (mouseX>300) && (mouseX<320) && (mouseY>50) && (mouseY<70) )
  maincolor=black;
  
  //sizechanges
  
  if ( (mouseX>590) && (mouseX<615) && (mouseY>35) && (mouseY<65) )
  brushsize=0;
  
  
  if ( (mouseX>640) && (mouseX<670) && (mouseY>30) && (mouseY<70) )
  brushsize=10;
  
  
  if ( (mouseX>690) && (mouseX<730) && (mouseY>20) && (mouseY<80) )
  brushsize=20;
  
  
  if ( (mouseX>740) && (mouseX<790) && (mouseY>10) && (mouseY<90) )
  brushsize=30;
  
  //eraser

  if ( (mouseX>0) && (mouseX<800) && (mouseY>600) && (mouseY<800) )
  {background(255);
  }
  
  
}


