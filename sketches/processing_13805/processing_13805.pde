
size(400,400);
                
for (float g=500; g>1; g=g-5)
{strokeWeight (g*0.01);
ellipse(200,200,1000000%g,g);}
   
   
for(float b=500; b>1; b=b-5)
{
strokeWeight (b*0.01);

ellipse(200,200,b,100%b);


}                           
