
void setup(){
size(600,350);
strokeWeight(50);
strokeCap(SQUARE);
frameRate(30);}

void draw(){
  background(255);
  float w = random(width);
line( w,0, w ,height);
line( 0,height/6,w,height/6);
line( 0,height-50,w,height-50);
line( w,5, width ,5);
line( w,height-5, width ,height-5);
//saveFrame("images/export-"+"-#####.jpeg");
//if ( frameCount >= 900 ) {
    //  exit();}
}


