
//Homework 3 
//Amy Friedman
//amyfried
//Copyright Amy Friedman September 2013

float x, y, wd, ht;
color stro;

void setup()
{
  size(400,400);
  x= width*.5;
  y= height*.5;
  wd= width*.375;
  ht= height*.375;
  
  stro=color(random(255),random(255),random(255));
  colorMode(HSB,360,125,150);
frameRate(15);  
}

void draw()
{
  fill(mouseX, 20, mouseY);//background changes based on location of mouse
 rect(0,0,width,height);

//headphones//
  noFill();
  stroke(stro);
  strokeWeight(5);
  arc(mouseX,mouseY,x-wd*.33,y,PI,TWO_PI);
  fill(stro);
  ellipse(mouseX-75,mouseY,mouseX*.5-mouseY*.75,mouseY*.5-mouseX*.75);
  ellipse(mouseX+75,mouseY,mouseX*.5-mouseY*.75,mouseY*.5-mouseX*.75);
}

void mouseMoved()
{ 
  noFill();
  stroke(random(255));
  strokeWeight(abs(mouseX-pmouseX));//line weight gets wider the faster you move mouse
  arc( x-wd*.5,       y, random(50,100), random(50,100),   HALF_PI, PI+HALF_PI);
  arc(x-wd*.66,       y,random(100,200),random(100,200),   HALF_PI, PI+HALF_PI);
  arc(    x-wd,       y,random(200,300),random(200,300),   HALF_PI, PI+HALF_PI);
  arc( x+wd*.5,       y,  random(0,100),  random(0,100),PI+HALF_PI, TWO_PI+HALF_PI);
  arc(x+wd*.66,       y,random(100,200),random(100,200),PI+HALF_PI, TWO_PI+HALF_PI);
  arc(    x+wd,       y,random(200,300),random(200,300),PI+HALF_PI, TWO_PI+HALF_PI);
}
  
void mousePressed()
{
   stro=color(random(255),random(255),random(255));  
}
  
  


