
//Stephanie Callaghan - My birthday is July 5th
size (300, 300);
background(220);
smooth();

float bday = 5.0;

//red circle
  fill(255,0,0);
  ellipse(width/2,height/2,bday*3,bday*3);

//yellow circle
  fill(255,255,0);
  ellipse(width/2+100,height/2,60,60);
  
//green square
  fill(0,255,0);
  rectMode(CENTER);
  rect(width/bday,height/2,80,80);
 
//vertical line
  stroke(255,150,0);
  strokeWeight(2);
  line(2*width/3,height/2+bday*3,2*width/3,height/2-bday*3);
  //bday*3 is simplified for 1/2 of bday*6
  
//blue triangle
  stroke(0);
  strokeWeight(1);
  fill(0,0,255);
  float x = width/3;
  float y = height/2;
  //x and y represent the coordinates for the center of the triangle
  triangle(x-bday*2,y+bday*2,x+bday*2,y+bday*2,x,y-bday*2);
  //bday*2 is simplified for 1/2 of bday*4

  



