
int perro=10;
void setup (){size(600,600);
background(225,255,0,0);}
void draw (){perro=perro+10;
background (perro++,255,perro++);
background(perro,100,255,0);
ellipse(800-perro,100,100,100);
ellipse(perro+0.11175,100,mouseX,mouseY);
frameRate(24);
}

