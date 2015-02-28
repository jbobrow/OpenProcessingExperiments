

//Try cintinu ellipse drawing
//Su Hsiu Pai

void setup() {
size(480,120);
background(50);
smooth();
}


void draw(){
stroke(100,222,0,40);
line(mouseX,mouseY,mouseX+60,mouseY+100);
if (mousePressed)
stroke(255,255,0,200);
line(mouseX,mouseY,mouseX-60,mouseY-100);

}


