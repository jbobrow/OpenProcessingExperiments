
int Xpos=200;
int Ypos=200;

void setup(){size(400,400);background(255);}

void draw(){background(255);
line(100,Ypos,300,100);Ypos=Ypos+20;
if (Ypos>400){Ypos=-400;}
line(200,Ypos,100,300);Ypos=Ypos+20;
if (Ypos>400){Ypos=-400;}
}
