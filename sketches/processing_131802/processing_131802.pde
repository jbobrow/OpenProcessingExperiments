
line(x,200,300,200);


fill(255,239,213); 
noStroke();
ellipse(200,x,x,x);



stroke(140); 
strokeWeight(10);

for(int i=0;i<450;i=i+100)
{
  line(i,1,i,400); 
}

fill(255,239,213); 
noStroke();

for(int g=100;g<400;g=g+200)
{
  ellipse(g,200,40,50);
}
