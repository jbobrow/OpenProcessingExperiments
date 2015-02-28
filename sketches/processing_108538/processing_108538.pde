
void setup(){
size(600,350);
strokeWeight(50);
strokeCap(SQUARE);
frameRate(5);}

void draw(){
  background(255);
  float w = random(width);
  float h = random(height);
  stroke(0);
line( w,height/2, width ,height/2);
line( width/2,0,width/2,h);
line( 0,height/3,w,height/3);
line( width/5,h, width/5 ,height);
line( width-100,h, width-100 ,height);
stroke(255,0,0);
line( width,h, 0 ,h);
//saveFrame("images/export-"+"-#####.jpeg");
//if ( frameCount >= 900 ) {
    //  exit();}
}

