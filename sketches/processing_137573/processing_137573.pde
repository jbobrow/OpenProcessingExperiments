
void setup()
{
size (360,360);
}
void draw() {
for (int y=5; y < height; y += 0){
for ( int x=5; x < width; x += 0){
fill( (random(280)));
noStroke();
rect(x, y, 20, 20);
x+=10;}
y+=10;
 
}
}

