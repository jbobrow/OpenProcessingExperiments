
void setup () {
size (800,800);
background (0);
}

void draw () {
  
for(int i=12; i<900; i+= 10) {
  for(int j=12; j<900; j+=10){
fill (0,255,100);
rect (random (j), random (i),random (3), random (3));

  }
}

for(int i=5; i<900; i+= 80) {
  for(int j=5; j<900; j+=80){
fill (255,130,0);
rect (random (j), random (i),random (20), random (18));


}
}
}


