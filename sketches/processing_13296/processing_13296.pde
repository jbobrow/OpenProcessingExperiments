
size(200,200);


background(155,120,5);


noStroke();
for(int x=10; x<200; x=x+20)
for(int y=10; y<200; y=y+20)
{
ellipse(x,y,5,5);
} 


fill(255,255,25);
stroke(1);
strokeWeight(1);

fill(255,200,155);
ellipse(100,100,150,140);


//cheek
fill(255,100,20);
ellipse(60,110,35,35);
ellipse(140,110,35,35);

//nose
fill(255,0,0);
ellipse(100,110,45,40);


//eye
fill(0);
ellipse(75,75,10,15);
ellipse(125,75,10,15);

//mouth
strokeWeight(2);
line(80,140,120,140);
                
                
