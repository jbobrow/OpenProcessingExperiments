
//Hw 2
//Copyright Samantha Zucker, September 2011, Pittsburgh, PA 15289

size(400,400);
background(255,255,255);
//variables
float x,y,wd,ht;
  x=50;
  y=50;
  wd=300;
  ht=300;
  
  color white = color(255,255,255);
  color peach = color(237,169,105); 
  color yellow = color(250,241,172);
  color green = color(224,245,210);
  color purple = color(161,131,173);
 

 //background circles
   
  smooth();
  noStroke();
  ellipseMode(CORNER);
  

  fill(green);
  ellipse(x-.75*x, y-.75*y, wd+wd*.3, ht+ht*.3); 
  
  fill(yellow);
  ellipse(x-.5*x, y-.5*y, wd+wd*.15, ht+ht*.15);
 
  
  //reference circle
 
 fill(peach);
 noStroke();
 ellipseMode(CORNER);
 ellipse(x,y,wd,ht);
 
 

 
 
 //S
 fill(white);
 stroke(white);
 strokeWeight(2);
 
 
 beginShape();
 
 //reference point
 curveVertex(x+.375*wd, y+.5*ht);
 
 //shape,outside
 curveVertex(x+.35*wd, y+.35*ht);
 curveVertex(x+.3*wd, y+.25*ht);
 curveVertex(x+.25*wd, y+.225*ht);
 curveVertex(x+.2*wd, y+.225*ht);
 curveVertex(x+.15*wd, y+.25*ht);
 curveVertex(x+.1*wd, y+.35*ht);
 curveVertex(x+.113*wd, y+.4*ht);
 curveVertex(x+.15*wd, y+.45*ht);
 curveVertex(x+.2*wd, y+.5*ht);
 
 curveVertex(x+.3*wd, y+.575*ht);
 curveVertex(x+.35*wd, y+.65*ht);
 curveVertex(x+.325*wd, y+.75*ht);
 curveVertex(x+.25*wd, y+.8*ht);
 curveVertex(x+.1*wd, y+.75*ht);
 curveVertex(x+.05*wd, y+.65*ht);
 curveVertex(x+.075*wd, y+.65*ht);
 curveVertex(x+.1*wd, y+.75*ht);
 curveVertex(x+.25*wd, y+.8*ht);
 curveVertex(x+.325*wd, y+.75*ht);
 curveVertex(x+.35*wd, y+.65*ht);
 curveVertex(x+.3*wd, y+.55*ht);
 curveVertex(x+.2*wd, y+.45*ht);
 curveVertex(x+.125*wd, y+.35*ht);
 curveVertex(x+.15*wd, y+.25*ht);
 curveVertex(x+.2*wd, y+.225*ht);
 curveVertex(x+.25*wd, y+.225*ht);
 curveVertex(x+.3*wd, y+.275*ht);
 curveVertex(x+.325*wd, y+.35*ht);
 curveVertex(x+.35*wd, y+.35*ht);
 curveVertex(x+.35*wd, y+.35*ht);
 
 endShape();
 
 
 //r
 beginShape();
 
 //reference point
 curveVertex(x+.35*wd, y+.2*ht);
 
 //shape
 curveVertex(x+.4*wd, y+.25*ht);
 curveVertex(x+.45*wd, y+.45*ht);
 curveVertex(x+.45*wd, y+.55*ht);
 curveVertex(x+.45*wd, y+.8*ht);
 curveVertex(x+.475*wd, y+.8*ht);
 curveVertex(x+.45*wd, y+.55*ht);
 curveVertex(x+.45*wd, y+.45*ht);
 curveVertex(x+.5*wd, y+.3*ht);
 curveVertex(x+.55*wd, y+.25*ht);
 curveVertex(x+.6*wd, y+.3*ht);
 curveVertex(x+.65*wd, y+.3*ht);
 curveVertex(x+.625*wd, y+.25*ht);
 curveVertex(x+.575*wd, y+.225*ht);
 curveVertex(x+.5*wd, y+.3*ht);
 curveVertex(x+.45*wd, y+.45*ht);
 curveVertex(x+.45*wd, y+.35*ht);
 curveVertex(x+.45*wd, y+.25*ht);
 curveVertex(x+.4*wd, y+.25*ht);
 //reference point
 curveVertex(x+.4*wd, y+.25*ht);
 
 endShape();

//z
beginShape();
//reference point
curveVertex(x+.525*wd, y+.35*ht);
//shape
curveVertex(x+wd*.675, y+ht*.275);
curveVertex(x+wd*.875, y+ht*.275);
curveVertex(x+wd*.75, y+ht*.45);
curveVertex(x+wd*.65, y+ht*.6);
curveVertex(x+wd*.6, y+ht*.75);
curveVertex(x+wd*.6, y+ht*.8);
curveVertex(x+wd*.625, y+ht*.775);
curveVertex(x+wd*.7, y+ht*.75);
curveVertex(x+wd*.8, y+ht*.75);
curveVertex(x+wd*.8, y+ht*.775);
curveVertex(x+wd*.625, y+ht*.775);
curveVertex(x+wd*.6, y+ht*.8);
curveVertex(x+wd*.6, y+ht*.75);
curveVertex(x+wd*.65, y+ht*.55);
curveVertex(x+wd*.725, y+ht*.45);
curveVertex(x+wd*.875, y+ht*.275);
curveVertex(x+wd*.75, y+ht*.275);
curveVertex(x+wd*.675, y+ht*.3);
curveVertex(x+wd*.675, y+ht*.275);

curveVertex(x+wd*.675, y+ht*.275);

endShape();
 
 
 
                
