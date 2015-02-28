
size(485,485);
background(135,206,250,200);

for(int i=0;i<550;i=i+5)
{if (i<=300) 
{strokeWeight(2);
stroke(218,165,32);
fill(255,215,0,12);
ellipse(i,i,1.65*i,1.65*i);}
else {stroke(139,136,120);
line(i-300,i+250,300,300);}}


for(int i=296;i<550;i=i+5)
{if (i>300)
{stroke(139,136,120);
line(i+300,i-250,300,300);}
else {fill(0);
noStroke();
ellipse(i-140,i+10,i/6,i/6);}}

fill(0);
noStroke();
ellipse(330,165,50,50);
