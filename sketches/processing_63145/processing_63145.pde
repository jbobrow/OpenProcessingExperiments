
size (600, 600);
background (0);
smooth();
noFill();

for(int d=10; d<= width+.5*width; d+=50)
{
  stroke (255,50);
  fill (43, 55, 80,100);
  strokeWeight (.5*d+15); 
  float x=d+.5*d;
  ellipse((width/2+.2*x)-200,(height/2+1.1*d)-250, .9*x+5,.9*x+5);
}


