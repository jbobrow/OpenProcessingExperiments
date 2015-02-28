
void setup() {
  size(500, 500);
  background(0);
  smooth();
 
}


void draw() {
   float speed = 0.1;
  //noStroke();
  background(30);
  translate(width/2, height/2);
  
  rotate ( millis() / 1000.0 * TWO_PI  * speed);
  speed = speed + 0.5;
  
  
  for (int i=0; i<width; i++){
    
    fill(255, 255, random(200));
    rect(i, i, 50, 50);
    rotate(radians(20));
    
  }
  for ( int t=0; t<360; t++){
    rotate(radians(t));
    //if (t == 359){
    //  t = 0;
   // }
    
      
  }
}

