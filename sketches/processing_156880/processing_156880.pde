
int diam =35;


void setup()
{
size (700,700);
}
void draw() {
for (int y=0; y < height; y +=0){
for ( int x=0; x < width; x += 0){
fill( int(random(255)), int(random(0)), int(random(23)));
stroke(3);
ellipse(x, y, diam, diam);

x+=30;}
y+=30;

}
}
 


