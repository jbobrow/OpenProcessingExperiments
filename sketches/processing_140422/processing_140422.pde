
int num = 48; 
float step, sz = 5, theta;
int mod = 4;

void setup() {
  size(500, 500);
  step = width/(num+1);
  noStroke();
  fill(0);
  colorMode(HSB, 360,100,100);
}

void draw() {
  fill(0,10);
  rect(0,0,width, height);

  translate(width/2, height/2);

  for (int i=0; i<num; i++) {
    fill((i%(mod*2))*(360/(mod*2)),100,100);
    pushMatrix();
    rotate(theta);   
    translate(-width/2, 0);
    float x = step*(i+1) ;
    float y = 0;
    ellipse(x, y, sz, sz);
    popMatrix();
  }
  theta += (TWO_PI/120);
  
  //if (frameCount > 100 && frameCount%4==0 && frameCount<221) saveFrame("image-###.gif");
    
}
