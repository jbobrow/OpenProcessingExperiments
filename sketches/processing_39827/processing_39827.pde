
void setup(){
size (600,300);
}

void draw()
{
stroke(200,0,0);
//background(150);
line(mouseX,mouseY,50,100);
line(mouseX,mouseY,400,200);
stroke(50,180,200);
strokeWeight(3);
line(width,height,mouseX-10,mouseY-10);
stroke(200);
line(width,height,mouseX+10,mouseY+30);
}




