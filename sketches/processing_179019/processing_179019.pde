
float t=0;
float dt=0.15;

void setup()
{
 size(500,500);
 noStroke();
 background(0);
}

void draw()
{
 background(0);
 fill(255,0,0);
 ellipse(mouseX+25*cos(t),mouseY+25*sin(t),15,15);
 fill(255,255,0);
 ellipse(mouseX+45*cos(1-t/2),mouseY+45*sin(1-t/2),25,25);
 fill(0,255,255);
 ellipse(mouseX+75*cos(1+t/4),mouseY+75*sin(1+t/4),35,35);
 t=t+dt;
}


