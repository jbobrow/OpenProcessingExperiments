

size (800,600); 
background (0);  
smooth();
noStroke();
/*
for ( int i = 0; i < 10000; i = i +1)
{
 
strokeWeight(random(5));

stroke(255,100);
point (random(width), random(height/2-80,height/2+80));
stroke(255,255,0,100);
point (random(width), random(height/2-250,height/2-100));
stroke(255,0,0,100);
point (random(width), random(height/2+100,height/2+250));

}
*/


for ( int i = 0; i < 1000; i = i +1)
{
  strokeWeight(1);
  stroke(255,random (100));
line(random(width), random(height/2+100,height/2+300),
random(width), random(height/2+100,height/2+300));
stroke(255,0,0,100);
line(random(width), random(height/2-300,height/2-100),
random(width), random(height/2-300,height/2-100));
stroke(255,255,0,100);
line(random(width), random(height/2-110,height/2+110),
random(width), random(height/2-110,height/2+110));
}


