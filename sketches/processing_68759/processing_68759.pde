
//homework 3
//Isla Hansen ihansen@andrew.cmu.edu
//copyright 2012


float x, y, wd, ht;

void setup()
{
  size (400,400);
  smooth();
  x=150;
  y=30;
  wd=100;
  ht=100;
  textSize(24);
 
  
}

void draw()

{
  background(225,215,200);
  noStroke();
  fill(200,0,0);
  triangle(frameCount*.2,y+(.3*wd),x+(.4*wd),frameCount*.2,wd*.7,ht*.7);
  
  fill(0,0,0);
  text("CLICK / DRAG", frameCount%width,70);
  text("TO",frameCount%width,110);
  text("PUT",frameCount%width,150);
  text("THE",frameCount%width,190);
  text("CHEESE",frameCount%width,230);
  text("ON",frameCount%width,270);
  text("THE",frameCount%width,310);
  text("PIZZA",frameCount%width,350);

  
 
  //CHEESES!

if(mousePressed == true){
   fill(240,230,0);
 } else{
   fill(225,215,200);
 }
 
  ellipse(mouseX-(wd*.6),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(mouseX-(wd*.4),mouseY+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX-(wd*.2),mouseY+(wd),wd*.08,ht*.08);
  ellipse(mouseX,mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.2),mouseY+(wd*1.4),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.4),mouseY+(wd*1.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.6),mouseY+(wd*1.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.8),mouseY+(wd*2),wd*.08,ht*.08);
  ellipse(mouseX+(wd),mouseY+(wd*2.2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.2),mouseY+(wd*2.4),wd*.08,ht*.08);
  
  ellipse(mouseX-(wd*.6),y+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX-(wd*.4),y+(wd),wd*.08,ht*.08);
  ellipse(mouseX-(wd*.2),mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(mouseX,y+(wd*1.4),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.2),y+(wd*1.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.4),mouseY+(wd*1.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.6),y+(wd*2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.8),mouseY+(wd*2.2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1),y+(wd*2.4),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.2),y+(wd*2.6),wd*.08,ht*.08);
  

  ellipse(mouseX-(wd*.6),y+(wd),wd*.08,ht*.08);
  ellipse(mouseX-(wd*.4),mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(mouseX-(wd*.2),y+(wd*1.4),wd*.08,ht*.08);
  ellipse(mouseX,y+(wd*1.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.2),y+(wd*1.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.4),mouseY+(wd*2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.6),y+(wd*2.2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.8),y+(wd*2.4),wd*.08,ht*.08);
  ellipse(mouseX+wd,y+(wd*2.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.2),mouseY+(wd*2.8),wd*.08,ht*.08);
  
  ellipse(mouseX-(wd*.2),mouseY+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX,y+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+wd,y+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.2),y+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.4),mouseY+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.6),y+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.8),mouseY+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd),y+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.2),y+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.4),y+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.6),mouseY+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.8),mouseY+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*2),y+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*2.2),mouseY+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*2.4),y+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*2.6),mouseY+(wd*.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*2.8),y+(wd*.8),wd*.08,ht*.08);
  
  ellipse(mouseX-(wd*.2),mouseY+(wd),wd*.08,ht*.08);
  ellipse(x,mouseY+(wd),wd*.08,ht*.08);
  ellipse(x+(wd*.2),mouseY+(wd),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.4),mouseY+(wd),wd*.08,ht*.08);
  ellipse(x+(wd*.6),mouseY+(wd),wd*.08,ht*.08);
  ellipse(x+(wd*.8),mouseY+(wd),wd*.08,ht*.08);
  ellipse(mouseX+(wd),mouseY+(wd),wd*.08,ht*.08);
  ellipse(x+(wd*1.2),mouseY+(wd),wd*.08,ht*.08);
  ellipse(x+(wd*1.4),mouseY+(wd),wd*.08,ht*.08);
  ellipse(x+(wd*1.6),mouseY+(wd),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.8),mouseY+(wd),wd*.08,ht*.08);
  ellipse(x+(wd*2),mouseY+(wd),wd*.08,ht*.08);
  ellipse(x+(wd*2.2),mouseY+(wd),wd*.08,ht*.08);
  ellipse(mouseX+(wd*2.4),mouseY+(wd),wd*.08,ht*.08);
  
  ellipse(x-(wd*.4),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(mouseX-(wd*.2),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(x,mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(x+(wd*.2),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(x+(wd*.4),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(x+(wd*.6),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.8),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(x+(wd),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(x+(wd*1.2),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.4),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(x+(wd*1.6),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.8),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(x+(wd*2),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*2.2),mouseY+(wd*.6),wd*.08,ht*.08);
  ellipse(x+(wd*2.4),mouseY+(wd*.6),wd*.08,ht*.08);
  
  ellipse(x+(wd*.2),mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.4),mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(x+(wd*.6),mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(x+(wd*.8),mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(mouseX+(wd),mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(x+(wd*1.2),mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.4),mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(x+(wd*1.6),mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.8),mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(x+(wd*2),mouseY+(wd*1.2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*2.2),mouseY+(wd*1.2),wd*.08,ht*.08);
  
  ellipse(mouseX+(wd*.4),y+(wd*1.4),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.6),mouseY+(wd*1.4),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.8),y+(wd*1.4),wd*.08,ht*.08);
  ellipse(mouseX+(wd),y+(wd*1.4),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.2),mouseY+(wd*1.4),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.4),y+(wd*1.4),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.6),mouseY+(wd*1.4),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.8),y+(wd*1.4),wd*.08,ht*.08);
  ellipse(mouseX+(wd*2),mouseY+(wd*1.4),wd*.08,ht*.08);
  
  ellipse(mouseX+(wd*.6),y+(wd*1.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*.8),mouseY+(wd*1.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1),y+(wd*1.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.2),mouseY+(wd*1.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.4),y+(wd*1.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.6),mouseY+(wd*1.6),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.8),y+(wd*1.6),wd*.08,ht*.08);
  
  ellipse(mouseX+(wd*.8),mouseY+(wd*1.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1),y+(wd*1.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.2),mouseY+(wd*1.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.4),y+(wd*1.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.6),mouseY+(wd*1.8),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.8),y+(wd*1.8),wd*.08,ht*.08);
  
  ellipse(mouseX+(wd*1),y+(wd*2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.2),mouseY+(wd*2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.4),y+(wd*2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.6),mouseY+(wd*2),wd*.08,ht*.08);
  
  ellipse(mouseX+(wd*1.2),y+(wd*2.2),wd*.08,ht*.08);
  ellipse(mouseX+(wd*1.4),mouseY+(wd*2.2),wd*.08,ht*.08);
  

 
 
}
