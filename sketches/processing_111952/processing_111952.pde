
void setup()
{
size (600,600);
background(255);
smooth();
noStroke();
}
void draw() {
for (int y=0; y <= height; y += 10){
for ( int x=0; x <= width; x += 10){
fill( int(random(67)), int(random(20)), int(random(70)));
ellipse(x, y, 8, 7);
ellipse(x,y,10,80);

}
}
}
