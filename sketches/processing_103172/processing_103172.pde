
void setup()
{
size (500,500);
}
void draw() {
for (int y=0; y < height; y += 0){
for ( int x=0; x < width; x += 0){
fill( int(random(255)), int(random(255)), int(random(255)));
noStroke();
rect(x, y, 100, 100);
x+=100;}
y+=100;
 
}
}
