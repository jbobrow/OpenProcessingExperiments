
void setup()
{
size (1000,1000);

background(255);

noStroke();
}
void draw() {
for (int y=0; y <= height; y += 15){
for ( int x=0; x <= width; x += 15){
fill( int(random(25)), int(random(130)), int(random(199)));
rect (x, y, 4, 15);
rect (x,y,22,73);
 
}
}
}
