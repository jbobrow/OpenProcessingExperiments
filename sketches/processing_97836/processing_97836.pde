
size(500,500);
background(25,25,112);


for(int a=0; a<=510; a=a+250) {
for(int b=0; b<=510; b=b+250) {
noStroke();
fill(93,71,139,60);
rect(a,b,250,250);}
}


for(int i=10; i<=500; i=i+20) {
for(int j=10; j<=500; j=j+20) {
stroke(139,0,139,255-.5*i);
strokeWeight(5);
point(i,j);}
}

stroke(72,118,255);
strokeWeight(1);
for(int y=0; y<=500; y=y+5) {
line(495,495-y,y,y);
}

for (int x=5; x<300; x=x+5) {
if (x<220)
{
stroke(200);
strokeWeight(1+2.5/i);
stroke(191,239,255);
line (60+2*x,500,x,x);
}
}
