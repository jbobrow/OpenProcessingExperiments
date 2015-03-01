
void setup(){
size(600,600);
background (25);
colorMode(HSB);
}

void draw(){
for (int i=0; i<mouseX; i=i+20) {
//println(i);
fill(i/3,255,255);
ellipse(300,300,width-i,width-2);
}
}
