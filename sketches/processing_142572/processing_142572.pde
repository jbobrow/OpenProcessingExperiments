
size (600,600);
noStroke();
background (114, 170, 168)
colorMode (HSB, 360,100,100);
rectMode (CENTER);
float angolo=0;
for (int y=0; y<=height; y+=20)
{
for (int x=0; x<=width; x+=60)
{
angolo += 0.100;
resetMatrix();
translate (x,y);
rotate (angolo);
fill (random(21,360), random(0,50), random (90,100),240);
bezier (50,10,95,70,5,70,50,10);
}
}
