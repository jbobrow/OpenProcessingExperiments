
void setup ()
{
 
 size(500,500);
background(#FFFFFF);
noLoop();
  
}

void draw ()

{
noFill();


triangle(125,375,250,125,375,375);

triangle (125,125,250,375,375,125); 
strokeWeight(10);
triangle(187.5,250,125,125,125,375);
triangle(312.5,250,375,125,375,375);


triangle(187.5,250,125,125,125,375);
triangle(312.5,250,375,125,375,375);
strokeWeight(30);  
triangle(187.5,125,250,250,312.5,125);
triangle(187.5,375,250,250,312.5,375);

noStroke();


triangle(125,375,250,125,375,375);

 
 
  
}



