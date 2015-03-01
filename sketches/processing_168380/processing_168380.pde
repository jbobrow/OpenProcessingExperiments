
int x=0;
int y=250;

void setup()
{
size(800,500);
background(#ffffff);
strokeWeight(2);
fill(#E81717,200);
triangle(0,0,250,0,0,250);
fill(#006213,200);
triangle(800,800,200,800,800,200);

 strokeWeight(2);
stroke(#623D00);
 ellipse(235,350,30,20);
 ellipse(265,350,30,20);
 
 stroke(#000000);
fill(#FFEBC6);
  rect(279,250,10,80);
   rect(212,250,10,80);
 
 stroke(#000000);
fill(#00C401);
  triangle(250,260,180,350,320,350);
  
 
  
  stroke(#E81717);
  strokeWeight(3);
  line(198,330,303,330);
  
  stroke(#ffffff);
  strokeWeight(3);
  line(203,325,297,325);
  
  stroke(#006213);
  strokeWeight(3);
  line(206,320,294,320);
  
  stroke(#000000);
  fill(#ffffff);
    rect(228,220,45,70);
   
  
    
  ellipse(250,250,100,20);
  triangle(250,200,200,250,300,250);
  
  stroke(#E81717);
  strokeWeight(3);
  line(208,245,293,245);
  
  stroke(#006213);
  strokeWeight(3);
  line(200,250,300,250);

stroke(#000000);
fill(#FFEBC6);
ellipse(250,150,150,150);
fill(50);
ellipse(250,195,40,30);
noStroke();
fill(#FFEBC6);
ellipse(250,180,40,30);
stroke(#000000);
strokeWeight(3);

fill(#FA00EE);
rect(315,125,20,150);
line(315,140,335,125);
line(315,145,335,160);
line(315,180,335,165);
line(315,185,335,200);
line(315,220,335,205);
line(315,225,335,240);
line(315,260,335,245);

rect(170,125,20,150);
line(170,140,190,125);
line(170,145,190,160);
line(170,180,190,165);
line(170,185,190,200);
line(170,220,190,205);
line(170,225,190,240);
line(170,260,190,245);


strokeWeight(2);
ellipse(290,100,110,90);
ellipse(210,100,110,90);

fill(#E81717);
triangle(350,255,320,265,350,275);
triangle(305,255,330,265,305,275);

triangle(200,255,170,265,200,275);
triangle(155,255,180,265,155,275);

fill(#000000);
stroke(#ffffff);
ellipse(230,150,30,50);
ellipse(230,150,25,45);
ellipse(270,150,30,50);
ellipse(270,150,25,45);
strokeWeight(3);
stroke(#000000);
line(245,150,255,150);
}

void draw()

{

background(#ffffff);

strokeWeight(2);
fill(#E81717,200);
triangle(0,0,250,0,0,250);
fill(#006213,200);
triangle(800,800,200,800,800,200);

 strokeWeight(2);
stroke(#623D00);
 ellipse(x+235,350,30,20);
 ellipse(x+265,350,30,20);
 
 stroke(#000000);
fill(#FFEBC6);
  rect(x+279,250,10,80);
   rect(x+212,250,10,80);
 
 stroke(#000000);
fill(#00C401);
  triangle(x+250,260,x+180,350,x+320,350);
  
 
  
  stroke(#E81717);
  strokeWeight(3);
  line(x+198,330,x+303,330);
  
  stroke(#ffffff);
  strokeWeight(3);
  line(x+203,325,x+297,325);
  
  stroke(#006213);
  strokeWeight(3);
  line(x+206,320,x+294,320);
  
  stroke(#000000);
  fill(#ffffff);
    rect(x+228,220,45,70);
   
  
    
  ellipse(x+250,250,100,20);
  triangle(x+250,200,x+200,250,x+300,250);
  
  stroke(#E81717);
  strokeWeight(3);
  line(x+208,245,x+293,245);
  
  stroke(#006213);
  strokeWeight(3);
  line(x+200,250,x+300,250);

stroke(#000000);
fill(#FFEBC6);
ellipse(x+250,150,150,150);
fill(50);
ellipse(x+250,195,40,30);
noStroke();
fill(#FFEBC6);
ellipse(x+250,180,40,30);
stroke(#000000);
strokeWeight(3);

fill(#FA00EE);
rect(x+315,125,20,150);
line(x+315,140,x+335,125);
line(x+315,145,x+335,160);
line(x+315,180,x+335,165);
line(x+315,185,x+335,200);
line(x+315,220,x+335,205);
line(x+315,225,x+335,240);
line(x+315,260,x+335,245);

rect(x+170,125,20,150);
line(x+170,140,x+190,125);
line(x+170,145,x+190,160);
line(x+170,180,x+190,165);
line(x+170,185,x+190,200);
line(x+170,220,x+190,205);
line(x+170,225,x+190,240);
line(x+170,260,x+190,245);


strokeWeight(2);
ellipse(x+290,100,110,90);
ellipse(x+210,100,110,90);

fill(#E81717);
triangle(x+350,255,x+320,265,x+350,275);
triangle(x+305,255,x+330,265,x+305,275);

triangle(x+200,255,x+170,265,x+200,275);
triangle(x+155,255,x+180,265,x+155,275);

fill(#000000);
stroke(#ffffff);
ellipse(x+230,150,30,50);
ellipse(x+230,150,25,45);
ellipse(x+270,150,30,50);
ellipse(x+270,150,25,45);
strokeWeight(3);
stroke(#000000);
line(x+245,150,x+255,150);

x=x+5;

}
