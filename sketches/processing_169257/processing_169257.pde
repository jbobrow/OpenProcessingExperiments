

int radius = 20;

void setup() {
  frameRate(15);
  size(1280, 720); 
}
 
void draw() {  
  background(255);
  for (int i = 0; i < height / radius; i++){
    for (int j = 0; j < width / radius; j++){
      
      float hexHeight = radius * 2;
      float hexWidth = sqrt(3) / 2 * hexHeight;
      
      float xSpacing = hexWidth * j;
      float ySpacing = hexHeight * .75 * i;
      
      pushMatrix();
      if ( (i % 2) == 0 ){
        translate(xSpacing, ySpacing);
      }else{
        translate(xSpacing + hexWidth / 2, ySpacing);
      }
      strokeWeight(2);
      fill( 0, map(noise(millis()/1000 * i * j), 0, 1, 0, 255));
      hexagon(radius, true); 
      popMatrix();
    }
  }
}

void hexagon(int radius, boolean vertical) {
  float angle = TWO_PI / 6;
  
  float d = 0.0;
  if (vertical) d = 0.5;
  
  beginShape();
  for (int i=0; i <= 6; i++){
    float x = 0 + cos(angle * i + d) * radius;
    float y = 0 + sin(angle * i + d) * radius;
    vertex(x, y);
  }
  endShape();
}


