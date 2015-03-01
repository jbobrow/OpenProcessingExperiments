
void setup () {
size (600,600);
background (255);
frameRate(50);
}
 
void draw () {
   
for(int x=0; x<=600; x+= 50) {
  for(int y=0; y<=600; y+= 50){
stroke(#C0FAF5);
    fill (#06C1C0,40);
rect (random (y), random (x),random (30), random (30));
 
  }
}
 
for(int x=0; x<=600; x+= 80) {
  for(int y=0; y<=600; y+= 80){
fill (#FAFC75,60);
noStroke();
rect (random (y), random (x),random (50), random (50));
 
 
  }
}

for(int x=0; x<=700; x+= 40) {
  for(int y=0; y<=700; y+= 40){
strokeWeight(2);
    fill (#56287C,80);
ellipse (random (y), random (x),random (50), random (50));
  }
}
}

