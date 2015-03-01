
int Xpos=200;
int Ypos=200;

void setup(){size(400,400);background(255);}

void draw(){background(255);
line(Xpos,300,300,100);Xpos=Xpos+20;
if (Xpos>400){Xpos=-400;}
line(Xpos,200,300,300);Xpos=Xpos+20;
if (Xpos>400){Xpos=-400;}
}
