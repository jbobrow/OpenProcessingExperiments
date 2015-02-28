
int[] d6sum=new int[13];


size(300, 275);
background (0);

for (int i=0; i<300; i=i+20) {
textAlign(CENTER,CENTER);
text (i,10,250-(i));
stroke(50);
line (20,250-i,300,250-i);
}
for (int ii=0; ii<3000; ii++){
for (int r=0; r<1000; r++) {
   d6sum[int(random(6)+1+int(random(6)+1))]++;
}

  for (int i=2; i<13; i++) {
    stroke(255,1);
    line(i*20,250-d6sum[i],i*20+15,250-d6sum[i]);
    fill(255);
  text (i,i*20+8,260);
}
for (int r=0; r<13; r++) {
   d6sum[r]=0;
}
}
