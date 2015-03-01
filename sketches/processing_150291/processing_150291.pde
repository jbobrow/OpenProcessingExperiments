
float[] x = new float[20];
float[] y = new float[20];
float segLength = 10;

void setup() {
size(700, 700);
smooth();
background(0, 300, 0)
}

void draw() {
dragSegment(0, mouseX - 8, mouseY - 8);
  for(int i=0; i < x.length-1; i++) {
    dragSegment(i+5, x[i], y[i]);
  }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  //stroke(23, 79, 4, 220);
  
  pushMatrix();
  translate(x[i], y[i]);
  rotate(angle);
  
  color c;
  
  if ( i % 3 == 1 )
    c = color(0, 0, 0, 255);
  else if ( i % 3 == 2 )
    c = color(255, 255, 0, 255);
  else
    c = color(255, 0, 0, 255);

  stroke( c );
  strokeWeight(10);
  line(0, 0, segLength, 0);
  
  if ( i == x.length - 1 )
  {
    fill( c );
    noStroke();
    beginShape(TRIANGLES);
    vertex(0, 5);
    vertex(-2 * segLength, 0);
    vertex(0, -5);
    endShape();
  }
  
  if ( i == 0 )
  {
   // stroke(0, 255);
   noStroke();
   fill(0, 255);
   ellipse(segLength, -2, 3, 3);
   ellipse(segLength, 2, 3, 3);
    //point(segLength, -2);
    //point(segLength, 2);
  }
  
  popMatrix();
}
