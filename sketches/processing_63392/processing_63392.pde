
int step;
color c;

void setup() {
  size(400, 400);
  background(20,20,255);
  smooth();
  noFill();
  strokeWeight(0.5);

  noStroke();
  fill(0);
  colorMode(RGB, 255);

  step = (width - 40) / 10;
  println(step);

  for (float gridY = step; gridY <= width - step; gridY = gridY += step) {
    for (float gridX = step; gridX <= width - step; gridX = gridX += step) {

      float rGridX = (gridX - step) + step * random(-1.4, 1.4);
      float rGridY = (gridY - step) + step * random(-1.4, 1.4);
      
      float distSize = 64 - dist(gridX, gridY, rGridX, rGridY) * .8;
      
      
       
      createGradient(rGridX, rGridY, distSize, color(255,20,255),color(20,20,255));
//      ellipse(rGridX, rGridY, distSize, distSize);
    }
  }
}



// Nicht von mir
void createGradient (float x, float y, float radius, color c1, color c2){
  float px = 0, py = 0, angle = 0;

  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
  // hack to ensure there are no holes in gradient
  // needs to be increased, as radius increases
  float gapFiller = 8.0;

  for (int i=0; i< radius; i++){
    for (float j=0; j<360; j+=1.0/gapFiller){
      px = x+cos(radians(angle))*i;
      py = y+sin(radians(angle))*i;
      angle+=1.0/gapFiller;
      color c = color(
      (red(c1)+(i)*(deltaR/radius)),
      (green(c1)+(i)*(deltaG/radius)),
      (blue(c1)+(i)*(deltaB/radius)) 
        );
      set(int(px), int(py), c);      
    }
  }
  // adds smooth edge 
  // hack anti-aliasing
  noFill();
  strokeWeight(3);
  ellipse(x, y, radius*2, radius*2);
}


