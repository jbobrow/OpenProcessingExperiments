
final int bgShade =  23;
final int fgShade = 180;

void setup() {
  size(300, 600, P2D);
  smooth();
  background(23);
  
  strokeWeight(30);
  
  int range = min(width, height);

  float Scale = 15;
  
  for (int n=2, r=range; n<=300; ++n, r=range/n ) { // go from the outside in; r is the radius
    for(float t=0; t<=PI; t+=TWO_PI/n) {  // t is theta
      drawRay(0, height/2, r*Scale, r*2*Scale,  t+PI);
      drawRay(0, height/2, r*Scale, r*2*Scale, -t+PI);
    }
  }
}

void drawRay(int cX, int cY,      // Centre co-ordinates
 float ray_start, float ray_end,  // Distances (radii) from the centre
 float angle) {                   // The angle it is going away from the centre
  beginShape(LINES);  
    stroke(bgShade,20);
    vertex(cX+ray_start*cos(angle), 
           cY+ray_start*sin(angle)
    );
    stroke(fgShade,20);
    vertex(cX+ray_end*cos(angle), 
           cY+ray_end*sin(angle)
    );
  endShape();
 }
 
 void draw() { }

