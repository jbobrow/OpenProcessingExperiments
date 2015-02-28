
float x;
float y;

void setup(){
  size(600,400);

frameRate(10);
}
  
  void draw(){

    background(250);
    fill(0,10);
   // strokeWeight(.5);
    stroke(0);
    for( x =20; x < width; x = x+50){
      for( y = 20; y < height; y = y+20){
        ellipse(x,y,random(10,100),random(20));
      }
    }
    if (mousePressed){
      saveFrame( " ####.png");
     // saveFrame("images/export-"+"-#####.png");
//if ( frameCount >= 900 ) {
     // exit();}

    }
  }
