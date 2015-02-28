
int width = 0;
void setup(){   size(640,680);  background(255);}
void draw(){  strokeWeight(width);}
void mouseDragged(){  line(mouseX,mouseY,pmouseX,pmouseY);  width = width >= 20 ? width/10 : width+1;}


