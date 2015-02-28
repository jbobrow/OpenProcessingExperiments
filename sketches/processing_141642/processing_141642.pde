
int slices = 20;
float pie_slice = TWO_PI/slices;
float x, y, szX, szY, theta, sw;
color[] palette = {#2D112C, #530031, #820233, #CA293E ,#EF4339};

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(#F2D79F);
  float edge = height/10;
  y = map(sin(theta),-1,1, -30, -150);
  szY = height/2-abs(y)-edge;
  szX = 200; 
  for (int i=0; i<slices; i++) {
    fill(palette[i%5]);
    pushMatrix();
    translate(width/2,height/2);   
    rotate(i*pie_slice);
    arc(0, y, szX, szY*2, (PI*1.5)-(pie_slice/2), (PI*1.5)+(pie_slice/2));
    popMatrix();
  }   
  theta += 0.0523;

  
}

