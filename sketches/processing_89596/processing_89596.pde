
/*
EX2_Draw
Jamarius Herbert
1/29/13

This is a drawing program that we will use to try
different functions in an interactive environmen
*/
void setup(){
size (400,400);
smooth();
}

void draw(){

if (mousePressed ==true){//draw a line with mouse while button pressed
line(mouseX,mouseY,pmouseX,pmouseY);
}
}

void mouseReleased(){//when I release mouse color will change
stroke(random(0,255),random(0,255),random(0,255),120);
}
