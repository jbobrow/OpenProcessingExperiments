
float winkel = 0.0;
float radius = 400.0;


void setup() {
  size(800, 800);
  background(0);
} 

void draw() {
  noLoop();


  //-----------------------------------------------------------

  for ( int j = 1; j<=800; j +=2) {

    winkel +=0.1; //0.005 erhöhung des winkelwertes

   
    //-----------------------------------------------------------

    float xx = (width/2 - radius * cos(winkel));
    float yy = (height/2 + radius * sin(winkel));
    //ellipse ( xx,yy,30,30);
    strokeWeight(1);
    stroke(255);
    line(width/2, height/2, xx, yy);

  }
}





