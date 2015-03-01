
float x;
float y;

void setup(){
size(300,400);
background(0);
}

void mousePressed(){
background(mouseX*255/300,mouseY*255/400,255*dist(0,0,mouseX,mouseY)/500);
}

void mouseReleased(){
x=round(random(255));
fill(x,x+50,x-50);
rectMode(CENTER);
rect(mouseX,mouseY,abs(150-mouseX),abs(200-mouseY));
}

void keyPressed(){
background(0);
}

