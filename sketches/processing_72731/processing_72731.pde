
//Sarah Anderson, seanders
//ems2, hw5, random vs order
//star coordinates borrowed from "Processing a Handbook"


float x,y,di;

void setup()
{
size(400,400);
background(200);
smooth();
x=50;
y=55;
di=70;
}

void draw()
{
//star(random(0,width),random(0,height),di);

fill(mouseX-70,0,mouseY-70,200);
star(random(0,mouseX),random(0,mouseY),(mouseX+mouseY)/(di/10));
  
}


/*
void starA()
{
beginShape();
vertex(50,18);
vertex(61,37);
vertex(83,43);
vertex(69,60);
vertex(71,82);
vertex(50,73);
vertex(29,82);
vertex(31,60);
vertex(17,43);
vertex(39,37);
endShape(CLOSE);
}
*/

void star(float x, float y, float di)
{
//noStroke();
//fill(random(255),random(255),random(255),200);
beginShape();
vertex(x-(di*0), y-(di*0.32));
vertex(x+(di*0.11),y-(di*0.13));
vertex(x+(di*0.33),y-(di*0.07));
vertex(x+(di*0.19),y+(di*0.1));
vertex(x+(di*0.21),y+(di*0.32));
vertex(x-(di*0),y+(di*0.23));
vertex(x-(di*0.21),y+(di*0.32));
vertex(x-(di*0.19),y+(di*0.1));
vertex(x-(di*0.33),y-(di*0.07));
vertex(x-(di*0.11),y-(di*0.13));
endShape(CLOSE);
}
