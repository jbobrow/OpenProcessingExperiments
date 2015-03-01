
int x=0;
void setup() {
size(600,400);
background(150,200,150);
}
void draw(){
if (mousePressed == true && mouseButton == LEFT)
{fill(255,100,100);
stroke(255,255,255);
rect(x,100,20,20);
x = x + 40;
mousePressed = false;
}

if (mousePressed == true && mouseButton == RIGHT)
{fill(255,255,0); 
stroke(0,200,100);
rect(x,100,20,20);
x = x + 40;
mousePressed = false;
}}

