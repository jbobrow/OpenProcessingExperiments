
size(350,350);
background(195,233,195,100);

noFill();
for (int i=10; i<900; i=i+10) {
if (i<250)
{
noStroke();
fill(176,23,31,200-i);
ellipse(200+.25*i,150,i,i);
}
}

for (int x=5; x<900; x=x+5) {
if (x<300)
{
stroke(200);
strokeWeight(1+2.5/i);
stroke(176,23,31);
line (60+x,300,x,x);
}
}
