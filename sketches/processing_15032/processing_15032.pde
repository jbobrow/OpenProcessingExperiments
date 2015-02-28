
void setup() {
  size(200,200);
  background(255);
  smooth();
}

void draw() {
  strokeWeight(1);
  stroke(255,210,0);
  for(int x=0; x<360; x=x+5) {
    float a= sin(radians(x))*80+100;
    float b= cos(radians(x))*80+100;
    line(100,100,a,b);
  }
 
  noStroke();
  ellipse(100,100,110,110);

  strokeWeight(1);
  stroke(255,140,0);
  for(int x=0; x<360; x=x+5) {
    float a= sin(radians(x+10))*40+100;
    float b= cos(radians(x+10))*40+100;
    line(100,100,a,b);
  }

  noStroke();
  ellipse(100,100,40,40);
  
}

                
                                
