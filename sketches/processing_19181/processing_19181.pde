
size(250,250); 
background(0);
smooth(); 
strokeWeight(2); 

for(int i=-30; i<300; i+=10) 
{stroke(i,i*4,i*2,200);

//zigzag lines
line(i,0,i,60);
line(i+10,60,i-30,80);
line(i-30,80,i+10,90);
line(i+10,90,i+10,110);
line(i+10,110,i+30,120);
line(i+30,120,i+10,140);
line(i+10,140,i-10,150);
line(i-10,150,i+20,160);
line(i+20,160,i-10,170);
line(i-10,170,i-10,180);
line(i-10,180,i+30,200);
line(i+30,200,i,220);
line(i,220,i,250);} 

//vertical lines
for(int i=00; i<400; i+=10) 
{stroke(150,i,120,200);
line(i,0,i,250);}

//outer circle
stroke(0);
strokeWeight(70);
fill(0,0);
ellipse(125,125,280,280);

//middle circle
stroke(0);
fill(0,0);
strokeWeight(20);
ellipse(125,125,150,150);

//inner circle
stroke(0);
fill(0,0);
strokeWeight(10);
ellipse(125,125,100,100);
ellipse(125,125,40,40);



