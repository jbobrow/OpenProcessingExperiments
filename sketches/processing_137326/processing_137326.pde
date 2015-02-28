
void setup()
{
size (200,200);
}
void draw() {
for (int y=0; y < height; y += 0){
for ( int x=0; x < width; x += 0){
fill( int(random(255)));
noStroke();
rect(x, y, 10, 10);
x+=10;}
y+=10;
  
}
}

