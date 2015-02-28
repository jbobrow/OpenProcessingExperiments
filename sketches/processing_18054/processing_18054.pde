
size(250, 250);
background(0);
 
smooth();
strokeWeight(8); 

rotate(0.09);
for(int i=0; i<400; i+=20) 
{stroke(i,100,150);
line(i,0,i+60,80);} 

for(int i=60; i<400; i+=20) 
{stroke(150,150,i);
line(i,80,i-60,180);} 

for(int i=0; i<400; i+=20) 
{stroke(i,100,150);
line(i,180,i+60,260);}

