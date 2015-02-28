
void setup(){
size(600,600);
smooth();
background(255);

}

void draw (){
frameRate (100);

stroke(random(0,255),random(0,160),random(0,100));
line(mouseX,mouseY,random(300,600),random(0,500));

}


