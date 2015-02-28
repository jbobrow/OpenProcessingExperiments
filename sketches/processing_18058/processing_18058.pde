
size(250,250);
background(#2E2633);
smooth(); 
strokeWeight(.5); 
stroke(250,200);

fill(#EFFFCD,180);
ellipse(40,170,120,120);
ellipse(40,170,90,90);
ellipse(40,170,50,50);

translate(-0.63,0);
rotate(-0.37);

for(int i=0; i<400; i+=4) 
{stroke(255,250);
  line(i,0,i+i/2,350); 
  strokeWeight(2);
 stroke(#99173C,120);
line(i+i/2,0,i*1.0,350);} 



