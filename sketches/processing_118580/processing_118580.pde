
int canvasWidth;
int canvasHeight;
int rectWidth;
int rectHeight;

void setup() {
size (200,200);
background(0);
}

void draw() {
}

void mousePressed() {
  background(0);
rectWidth = int (random(3, width/10));
rectHeight = int (random(3, height/10));
for (int y=0; y < 10; y+=1){
  for ( int x=0; x < 10; x+=1){
    fill( int(random(255)), int(random(255)), int(random(255)));
    strokeWeight(1);
    rect(x+x*rectWidth,y+y*rectHeight,rectWidth,rectHeight);
}


}
}



