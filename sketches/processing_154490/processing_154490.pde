
//Rosalie Sowers rsowers
//Copyright 2014

float x;
float y;
float wd;
float ht;
float ec = .1;

void setup()
{
  size(400, 400);
  smooth();
  rectMode(CENTER);
}

void draw()
{
  //background(255);
  
  fill(0, 10);
  rect(width*.5, height*.5, width, height);
  
  x += ec*(mouseX-x);
  y += ec*(mouseY-y);
  wd = 100;
  ht = 100;
  
  fill(255);
  noStroke();
  
  ellipse(x, y, 5 + pow(abs((x-y)), .75), 5 + pow(abs((x-y)), .75));
  fill(255, 0, 0);
  ellipse(y, x, 5 + pow(abs((x-y)), .75), 5 + pow(abs((x-y)), .75));
  
  //translate(width/2, height/2);
  //rotate(PI/3.0);
  
//  fill(0, 255, 255);
//  rect(x, y, 1.5*wd, 1.5*ht);
//  
//  if (frameCount % 120 <60)
//   fill( 139, 137, 137);
//  else
//    fill(255, 255, 255);
//  quad(x-.75*wd, y, x, y-.75*ht, x+.75*wd, y, x, y+.75*ht); 
//  
//  if (frameCount % 120 >= 60)
//   fill( 139, 137, 137);
//  else
//    fill(255, 255, 255);
//  stroke(49, 79, 79);
//  strokeWeight(4);
//  ellipse(x, y, wd, ht);
//  strokeWeight(1);
//  
//  fill(90, 60, 120);
//  stroke(0, 0, 0);
//  arc(x, y+wd*.15, wd*.4, ht*.38, 0, PI, PIE); 
//  
//  fill(200, 0, 0);
//  rect(x-.20*wd, y-.20*ht, .15*wd, .15*ht);
//  rect(x+.20*wd, y-.20*ht, .15*wd, .15*ht);
//  
//  fill(0, 0, 255);
//  triangle(x, y-.08*ht, x+.05*wd, y+.02*ht, x-.05*wd, y+.02*ht);
}  







