
int maVariable;

void setup() {
maVariable=10;
size(1000,1000);
frameRate(50);
}

void draw(){
maVariable=maVariable+10;

stroke(random(200),random(200),random(200),50);
line(50+mouseX,50+mouseY,150+mouseX,50+mouseY);
line(50+mouseX,50+mouseY,50+mouseX,150+mouseY);
line(150+mouseX,50+mouseY,150+mouseX,150+mouseY);
line(50+mouseX,150+mouseY,150+mouseX,150+mouseY);
line(50+mouseX,50+mouseY,120+mouseX,20+mouseY);
line(150+mouseX,50+mouseY,220+mouseX,20+mouseY);
line(150+mouseX,150+mouseY,220+mouseX,120+mouseY);
line(120+mouseX,20+mouseY,220+mouseX,20+mouseY);
line(220+mouseX,120+mouseY,220+mouseX,20+mouseY);
}
void mouseClicked(){
  maVariable=0;
}

