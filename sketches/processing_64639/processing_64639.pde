

void setup () {
  background(255);
  size (400, 400);
  smooth();
  strokeWeight(10);
  
  float space=40;


for ( float y = 15; y < height; y = y + space) {
  for ( float x = 15; x < width; x = x + space  ) {
    if (random(100) > 90){
     stroke(0);
     point(x + random (10, 50),y + random (10, 50));
     
   }else {
     stroke (255,0,0);
     point( x + random (10, 50),y + random (10, 50));
   }
    
  }
}
}

void keyPressed() {
  saveFrame ("PUNKTEGITTER_RANDOM.png");
}




