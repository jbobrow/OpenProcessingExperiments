
void setup(){
size(1024,768);
background(0, 0, 0);
frameRate(1000);
smooth();
}

void draw(){
fill(255,255,255, random(70));


translate(width/2, height/2);
rotate(random(360));
scale(random(3));
rect(mouseX, mouseY, 30, 30);
}





