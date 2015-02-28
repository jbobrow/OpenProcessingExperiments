
//Homework # 6
//Copyright Information: Samantha Zucker, Pittsburgh, PA, September 2011


 
  color white  = color(255,255,255);
  color peach  = color(237,169,105);
  color yellow = color(250,241,172);
  color gree   = color(224,245,210);
  color purple = color(161,131,173);

float x;
float y;
float wd;
float ht;


void setup()
{
 size (400 , 400);
smooth();
background(200,150,200);

}

void draw()
{
 

  
  while( x < width + 20)//allow for the width the last row to fill in. 
  
  {
  //1st stripe
  initials(x - 120, y - 20 , wd, ht);
  initials(x - 160, y - 20, wd, ht);
  initials(x - 200, y - 20, wd, ht);
  
  
  //2nd stripe
  initials( x, y - 20, wd, ht);
  initials (x +  40, y - 20, wd, ht);
  initials (x +  80, y - 20, wd, ht);
  initials (x + 120, y - 20, wd, ht);
  
  //3rd stripe
  initials (x + 280, y - 20, wd, ht);
  
 // initials( width -x, y, wd, ht);
  x = x + 20;
  y = y + 20;
  wd = 20;
  ht = 20;
  }
while (x < width)
   {
    initials ( x, y, 20, 20);
    x = x - 50;
    y = y - 10; 
   }
 
 
  
  
  
  
 
  
}


void initials( float x, float y, float wd, float ht)
{//function to draw initlals and background circles
//backgrond circles
  noStroke();
  
  fill(gree);
  ellipse(x + wd/2,  y + ht/2,  wd+.5*wd, ht+.5*ht);
    
  fill(yellow);
  ellipse(x + wd/2,  y + ht/2,  wd+.25*wd,  ht+.25*ht);   
   
  fill(peach);
  ellipse(x + wd/2,  y + ht/2,  wd,     ht);
   
   
   
 //S
 fill(255,255,255);
 stroke(255,255,255);
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

}
