
void setup()
{
size (400,400);
frameRate(2);
}
void draw() {

for (int y=0; y < height; y +=0){
    for ( int x=0; x < width; x += 0){
        fill( int(random(100, 200)), int(random(0,100)), int(random(200, 255)));
        noStroke();
        rect(x, y, 40, 40);
        x+=40;
    }
    y+=40;
}

}


