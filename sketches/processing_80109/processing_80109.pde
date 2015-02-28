
void setup () {
size (800, 600);
background (7);
noStroke();

for(int i=0; i<height; i+=20) {
for (int a= 0; a<width; a+=20){
frameRate(5);
noStroke();
fill(random (255),random (255),random (255),random(100));
rect(a, i, 10, 10);
}
}
}


