
size(500,500);
background(195,233,195,100);

noFill();
for (int i=10; i<300; i=i+10) {
if (i<250)
{
noStroke();
fill(176,23,31,200-i);
ellipse(80,80,i,i);
}
else {
stroke(255);
strokeWeight(1+1/i);
stroke(176,23,31);
line (100,100,i,i);
}
}
