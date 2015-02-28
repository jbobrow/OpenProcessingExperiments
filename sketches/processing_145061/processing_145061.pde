
void setup()
{
size( 480,480 );
background( 0 );
stroke( 255,50 );
}

int diametro1 = 40;
int diametro2 = 20;
void draw()
{
translate(mouseX,mouseY);
rotate(frameCount/10.0);
if (mousePressed) {

if (key == '+') {
if (diametro2 < 180) {
 diametro1 = diametro1 + 2;
 diametro2 = diametro2 + 2;
 } 
} 
else if (key == '-') {
if (diametro2 > 2) {
 diametro1 = diametro1 - 2;
 diametro2 = diametro2 - 2;
 } 
}

noFill();
stroke( random(100, 250), random(100, 250), random(100, 250)); 
  ellipse(50,50, diametro1,diametro2);
}
}

void keyReleased()
{
if (key=='c' || key=='C') {
background(0);
}
}

