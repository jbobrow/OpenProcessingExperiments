
float x = 100;
float y = 100;
float angle = 0.0;
float xspeed = 1;
float yspeed = 3.3;

void setup()
{
size(800, 800);
smooth();
background (0);
}


void draw(){

pushMatrix();
translate(mouseX, mouseY);
rotate(angle);
x = x * xspeed;
y = y + yspeed;


stroke (15,255,25,60);
strokeWeight (15);

scale (.20);
rect(mouseX,mouseY,50,50);

line (30,30,30,500);
popMatrix();

angle+=0.3;
}

void mousePressed() {
background(0);

translate(mouseX,mouseY);
stroke(15,255,25,30);
for(int x = 0; x<360; x ++){
rotate (radians(1));
line(0,0,500^2,1000);
}
}


