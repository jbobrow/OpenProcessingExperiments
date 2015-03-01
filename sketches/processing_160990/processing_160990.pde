
void setup(){
  size(400,400);
}

void draw(){
  drawStickfigure(mouseX,mouseY);
}
int x=50;
void drawStickfigure(int x, int y){
line(x,y,50,75);
ellipse(x,y,20,20);
line(x,y-30,40,60);
line(x,y-30,60,60);
line(x,y-75,40,90);
line(x,y-75,60,90);
}

//Paul, struggled with this one... dont know what i did wrong?
