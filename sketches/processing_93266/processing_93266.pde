
//Week 3
//Pattern.


size (100,100);
smooth();

background(186,220,186);
noStroke();

for(int i=6; i<=height; i+=10) {
  for(int q=5; q<=width; q+=10) {
    ellipse(i,q,10-i/8,10-i/8);}}

