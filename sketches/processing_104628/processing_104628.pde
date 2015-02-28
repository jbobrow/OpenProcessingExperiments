
int px;                    

void setup() { 
   size (600,350);
background (87,111,183);  
   px=0;        
}

void draw()  {
  background(82,124,165);
  noStroke ();

fill (4,19,62);
ellipse (90,100,80,80);
rect (0,200,320,240);
rect(320,240,50,200);
rect (370,300,25,80);
rect (395,220,60,130);
rect (455,270,50,80);
rect (505,300,35,60);
rect (540,140,60,220);
rect (50,100,80,250);
rect (150,170,40,30);
rect (210,80,80,270);
rect (87,40,6,20);


if (mouseX>100) {
  fill (255);
  int x; 
for (x=65; x<120; x=x+35) rect (x,100,15,15);
for (x=65; x<120; x=x+35) rect (x,140,15,15);
for (x=65; x<120; x=x+35) rect (x,180,15,15);
for (x=65; x<120; x=x+35) rect (x,220,15,15);
for (x=65; x<120; x=x+35) rect (x,260,15,15);

for (x=225; x<280; x=x+35) rect (x,100,15,15);
for (x=225; x<280; x=x+35) rect (x,140,15,15);
for (x=225; x<280; x=x+35) rect (x,180,15,15);
for (x=225; x<280; x=x+35) rect (x,220,15,15);
for (x=225; x<280; x=x+35) rect (x,260,15,15);

for (x=549; x<600; x=x+30) rect (x,160,13,13);
for (x=549; x<600; x=x+30) rect (x,195,13,13);
for (x=549; x<600; x=x+30) rect (x,230,13,13);
for (x=549; x<600; x=x+30) rect (x,265,13,13);

  }
else {
  fill (255,234,0);
  int x; 
for (x=65; x<120; x=x+35) rect (x,100,15,15);
for (x=65; x<120; x=x+35) rect (x,140,15,15);
for (x=65; x<120; x=x+35) rect (x,180,15,15);
for (x=65; x<120; x=x+35) rect (x,220,15,15);
for (x=65; x<120; x=x+35) rect (x,260,15,15);

for (x=225; x<280; x=x+35) rect (x,100,15,15);
for (x=225; x<280; x=x+35) rect (x,140,15,15);
for (x=225; x<280; x=x+35) rect (x,180,15,15);
for (x=225; x<280; x=x+35) rect (x,220,15,15);
for (x=225; x<280; x=x+35) rect (x,260,15,15);

for (x=549; x<600; x=x+30) rect (x,160,13,13);
for (x=549; x<600; x=x+30) rect (x,195,13,13);
for (x=549; x<600; x=x+30) rect (x,230,13,13);
for (x=549; x<600; x=x+30) rect (x,265,13,13);

}
   px++;                               
  fill (242,20,38);
rect (px+30,323,50,17);
rect (px+40,310,30,20);
fill(3,3,3);
rect (px+40,313,13,10);
rect (px+57,313,13,10);
ellipse (px+43,340,17,17);
ellipse (px+69,340,17,17); 
}
