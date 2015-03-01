
size(800,600); 
background(254,255,64); 
strokeWeight(500); 
stroke(255,0,0);
point(400,300);
strokeWeight(20);
stroke(0,0,255,200);
line(200,100,300,400);

for(int i=1; i<=100; i=i+1)
{
  stroke(random(0,255),random(100,200),random(80,150),random(100,200));
  point(i*10+100,100);
}
strokeWeight(10);
stroke(219,64,255,150);
fill(0,255,0,150);
rect(180,350,200,90);



