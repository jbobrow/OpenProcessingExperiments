
void setup() {
  
  background(145);
  size(400, 600);
  
}

float wobble = 0;

void draw(){
  
 for( int x = 50; x < 351; x = x + 50){
  for ( int y = 50; y < 551; y = y + 50){
    if (x > 200 && y > 300){
      wobble = wobble * 1.5;
    }
   
    float dice = random (0, 10);
    if ( x > 300  && y > 500){
     noLoop();
   }
    if ( dice > 5){
      wobble = wobble + random(-0.5, 0.5);
    }
   ellipse( x + wobble, y + wobble, 50, 50);
   
  }
 }  
  
}
