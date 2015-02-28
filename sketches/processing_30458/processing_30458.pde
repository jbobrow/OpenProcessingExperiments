
size (1280,720); // set up window size
background (255);  // define background color
smooth(); // define the render to be smooth (anti-alias)
noStroke();

for ( int i = 0; i < 400; i = i +1)
{
 
    stroke (255,0,0, 1000);
    line(random(width), random(height), random(width), random(height) );

} 

 rectMode(CORNER);
 
 noStroke(); 
fill(255,255,255,50);
rect(0,0, width, height/2); 

noStroke(); 
fill(0,100,200,125);
rect(0,height/2, width, height); 



noStroke();
for ( int i = 0; i < 1000; i = i +1)
{
strokeWeight(random(9)); 
stroke(57,1,1,80);
point ( random(width), random(height) );
}

for ( int i = 0; i < 900; i = i +1)
{
 
    stroke (255,0,0, 10);
    line(random(width), random(height), random(width), random(height) );

}  
for ( int i = 0; i < 1000; i = i +1)
{
 
 
    stroke (255,0,0, 10);
    line(width/1, random(height), width-width/1, random(height) );

}
for ( int i = 0; i < 100; i = i +1)
{
 
 
    stroke (25,0,0,20);
    strokeWeight(random(1)); 
    arc (  random(width), random(height), 50,50, radians(0), radians ( random(360)) );

}  

saveFrame("exame2.png");


