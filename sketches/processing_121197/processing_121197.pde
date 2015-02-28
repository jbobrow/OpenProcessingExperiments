
float xpos = random(0, 300);
float ypos = 300;
int counter = 30;
void setup(){
size(300, 300);
}
void draw(){
background(255);
while(counter >= 1){
fallingPixel();
}
}
void fallingPixel(){
ellipse(xpos, ypos, 10, 10);
ypos++;
}

