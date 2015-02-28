
//Concentric Ellipses
//using FOR loops

smooth();
noFill();
size(500,500);

for(int d=10; d<= width; d+=10)
{
   ellipse(width/2,height/2, d,d); 
}

