
void setup()
{
size (700,700);
}
void draw() {
for (int y=0; y < height; y +=0){
for ( int x=0; x < width; x += 0){
fill( int(random(255)), int(random(255)), int(random(255)));
noStroke();
rect(x, y, 40, 40);
x+=40;}
y+=40;

}
}


