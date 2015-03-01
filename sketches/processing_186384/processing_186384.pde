
void setup(){
size(600,600);
background (25);
colorMode(HSB);
}

void draw(){
for (int i=0; i<mouseX; i=i+20) {
//println(i);
fill(i/3,255,255);
ellipse(300,300,150-i,150-2);
}
for (int i=0; i<mouseX; i=i+20) {
//println(i);
fill(i/3,255,255);
ellipse(200,200,150-i,150-2);
}

for (int i=0; i<mouseX; i=i+20) {
//println(i);
fill(i/3,255,255);
ellipse(100,100,150-i,150-2);
}

for (int i=0; i<mouseX; i=i+20) {
//println(i);
fill(i/3,255,255);
ellipse(50,50,150-i,150-2);
}

for (int i=0; i<mouseX; i=i+20) {
//println(i);
fill(i/3,255,255);
ellipse(400,400,150-i,150-2);
}
for (int i=0; i<mouseX; i=i+20) {
//println(i);
fill(i/3,255,255);
ellipse(500,500,150-i,150-2);
}
for (int i=0; i<mouseX; i=i+20) {
//println(i);
fill(i/3,255,255);
ellipse(600,600,150-i,150-2);
}

}

