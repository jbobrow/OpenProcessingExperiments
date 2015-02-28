
int[] d6sum=new int[13];

for (int i=0; i<1000; i++) {
d6sum[int(random(6)+1+int(random(6)+1))]++;
}

size(300, 275);
background (0);

for (int i=0; i<300; i=i+20) {
textAlign(CENTER,CENTER);
text (i,10,250-(i));
stroke(50);
line (20,250-i,300,250-i);
}
for (int i=2; i<13; i++) {
fill(150,100+i*10,20+i*15);
rect (i*20,250,15, d6sum[i]*-1);
fill(255);
text (i,i*20+8,260);
}
