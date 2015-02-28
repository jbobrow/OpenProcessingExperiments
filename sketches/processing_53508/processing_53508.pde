
int a=100;

size (250,250);

background(255);
strokeWeight(1);
smooth();

for(a=10; a<=125; a+= 20) {
  line (125,a+130,a,125);
  line (125,a,a+130,125);
  line (125,a,120-a,125);
  line (125,130+a,250-a,125);
}

