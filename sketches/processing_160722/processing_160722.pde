
void setup(){
  size(800,800);
}

void draw(){
  drawstickFigure(width/2,height/2);
}

void drawstickFigure(int x, int y){
line(500,400,500,200);
ellipseMode(CENTER);
ellipse(500,200,70,90);
line(500,300,300,200);
ellipseMode(CENTER);
ellipse(300,200,20,20);
line(500,300,570,270);
line(570,270,600,150);
ellipseMode(CENTER);
ellipse(600,150,20,20);
line(500,400,400,600);
line(500,400,600,600);
ellipseMode(CENTER);
ellipse(400,600,30,20);
ellipseMode(CENTER);
ellipse(600,600,30,20);
}
