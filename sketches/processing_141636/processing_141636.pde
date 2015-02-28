
int slices = 40;
float pie_slice = TWO_PI/slices;

float x, y, szX, szY, theta;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  fill(20);
  float edge = height/10;
  y = map(sin(theta),-1,1, -20, -150);
  //y = -30;
  szY = height/2+y ;
  szX = 200; 
  for (int i=0; i<slices; i++) {
    pushMatrix();
    translate(width/2,height/2);   
    rotate(i*pie_slice);
    arc(0, y, szX, szY, (PI*1.5)-(pie_slice/2), (PI*1.5)+(pie_slice/2));
    popMatrix();
  }   
  theta += 0.0523;
  
}
