
size(250,250);
background(0);

for(int x=0;x<100;x+=10)
{stroke(25,x,54);
fill(0);
bezier(0,x,150,x,210,x-5,250,x);}
//blue to green lines starting from the top

for(int y=-100;y<500;y+=25)
{stroke(200,225);
strokeWeight(0.25);
fill(0,0);
line(0,0,250,y);
line(0,0,y,250);
line(250,250,y+10,10-y);
//array of white lines coming from the top left corner and bottom right corner
stroke(157,235,y);
ellipse(15,15,y,y);}
//green to blue circles from top left corner to lower right corner

for(int y=-100;y<5000;y+=25)
{stroke(156,86,y,255);
strokeWeight(0.25);
fill(255,0);
line(250,250,y+10,y+10);}
//orange to purple line from top left corner to bottom right corner

for(int i=10;i<500;i+=50)
{fill(255,0);
stroke(150,100);
strokeWeight(5);
ellipse(145,145,i,i);}
//background grey circular rings

for(int i=10;i<500;i+=50)
{fill(255,0);
stroke(0,200);
strokeWeight(15);
ellipse(145,145,i,i);}
//black transparent rings of circles on top of lines

for(int y=-100;y<800;y+=25)
{strokeWeight(0.25);
fill(0,0);
stroke(157,235,y,100);
ellipse(15,15,y,y);}
//green to blue circles from top left corner to lower right corner

