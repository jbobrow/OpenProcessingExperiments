
size(250,250);
 
 
for(float e=400; e>1; e=e-10 )
for(float a=100; a>1; a=a-10 )
 
{
 
strokeWeight(e*0.01);
ellipse(125,125,e,e);
 
   
 
 
fill(random(255),random(255),random(255));
 
}

