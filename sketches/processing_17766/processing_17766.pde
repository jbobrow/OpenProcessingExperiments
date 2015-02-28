
size(250,250);
smooth();

background(255);
strokeWeight(.5);

for(
int i=1000; i>20; i/=1.4)
{
  fill(0,150);
  stroke(255);
ellipse(0,125,i,i);
}


for(
int j=0; j<250; j+=2)
{
line(0,125,j,250);
line(0,125,250,j);
line(0,125,j,0);
line(0,125,255,252);
line(0,125,255,0);
}

strokeWeight(2);
line(20,130,50,100);
line(50,100,90,170);
line(90,170,165,45);
line(165,45,250,250);

line(20,120,50,150);
line(50,150,90,80);
line(90,80,165,205);
line(165,205,250,0);


fill(0);
ellipse(0,125,20,20);

noFill();
rect(0,0,249,249);

