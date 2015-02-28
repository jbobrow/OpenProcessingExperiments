
void setup()
{
size (600,600);
}




void draw() {
for (int y=0; y < height; y += 0){
for ( int x=0; x < width; x += 0){
fill( int(random(255)), int(random(255)), int(random(255)));


noStroke();

rect(x, y, 50, 50);
x+=40;}
y+=40;}


}
