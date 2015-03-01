
void setup(){
size(400,400);

}

void draw(){
background(255);

noFill();
ellipse(100,200,70,70);
ellipse(300,200,70,70);

fill(0,0,0);
float x1 = map (mouseX,0,399,100-25,100+25);
float y1 = map (mouseY,0,399,200-25,200+25);
ellipse(x1,y1,20,20);

float x2 = map (mouseX,0,399,300+25,300-25);
float y2 = map (mouseY,0,399,200-25,200+25);
ellipse(x2,y2,20,20);
//map(value, start1, stop1, start2, stop2)


}
