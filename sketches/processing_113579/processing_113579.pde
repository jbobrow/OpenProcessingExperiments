
int transparency = 1;

void setup() {
  size( 600, 600 );
  background( 255 );
}

void draw(){
  
float circleSize = map( mouseX, 0, width, 0, 60 );
   for (int x = 0; x < width; x += 30) {
    for (int y = 0; y < height; y +=30) {
      strokeWeight(2);
      stroke( 33, 48, 209, transparency );
      ellipse(x, y, circleSize, circleSize);
    } 
  }
}

void mousePressed() {
transparency +=2;
}

void keyPressed() {
 if( key == ' ') {
 stop();} 
}
