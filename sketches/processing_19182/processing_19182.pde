
size(250,250);
background(#7ED3CE);
smooth();

for(int k=95; k<160; k+=10)
{stroke(#8FE8AD,100);
strokeWeight(4);
line(0,k,255,k);}
//background lime green horizontal lines

strokeWeight(3); 
for(int i=45; i<200; i+=20) 
{stroke(i,40,120,50);
line(i,45,i+10,200);} 
for(int i=45; i<200; i+=20) 
{stroke(i,40,120,50);
line(i+10,45,i,200);} 
for(int i=45; i<200; i+=20) 
{stroke(i,40,120,50);
line(i+20,45,i,200);} 
for(int i=45; i<200; i+=20) 
{stroke(i,40,120,50);
line(i,45,i+20,200);} 
//blue to purple cross-wire lines

noStroke();
fill(#E0D4C7,150);
rect(85,85,80,80);
//white rectangle center

for(int k=75; k<185; k+=10)
{stroke(25,47,36,50);
line(85,k,165,k);}
//green lines above white center

noStroke();
fill(#7ED3CE,190);
rect(105,105,40,40);
//middle square

