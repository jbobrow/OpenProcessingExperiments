
size(600,600);
background(255);

for(int i=10; i<600; i=i+20) {
strokeWeight(2);
    for (int j=10; j<600; j=j+20) {
        line(i,j,i/0.6,j/0.4);
        
  int r = int(random(0,255));
  int r2 = int(random(0,255));
  int r3 = int(random(0,255));
  int r4 = int(random(0,255));

 stroke(r, r2, r3, r4);
}
}

strokeWeight(3);
for(int m=1; m<600; m=m+5) {
    for (int p=100; p<600; p=p+5) {
        ellipse(m/10,p/10,m/2,p/2);
}
}

strokeWeight(20);
ellipse(60,60,200,200);

strokeWeight(40);
point(60,60);

stroke(r,r2,r3,r4);
strokeWeight(2);
fill(255,255,255,100);
for(int a=10; a<600; a=a+100) {
ellipse(a+50,560,50,50);
ellipse(560,a+50,50,50);
}
