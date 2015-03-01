
int l = 30;
float sx = 0;
float sy = 0;
float easing = 0.06;
 
void setup() {
  background(0);
  size(800, 800);
  stroke(0);
  }
void draw() {
  background(255);
   
  sx += (mouseX - sx) * easing;
  sy += (mouseY - sy) * easing;
//ellipse(sx,sy,10,10);
   
  strokeWeight(2);
  ellipse(10,10,10,10);
  
  for (int i = 200; i < 600; i+= 60) {
    for ( int y=200; y <600; y += 60) {
      float d = dist(i,y,sx,sy);
      float f = l / d;
      float dx = sx - i;
      float dy = sy - y;
         if( mousePressed ){
        dx *= -1;
        dy *= -1;
      }
      noFill();
//      curve(i, y, i+ dx*f, y+dy*f, i+ dx*f, y+dy*f, sx, sy);
//     arc(i, y, abs(dx*f), abs(dy*f), HALF_PI, PI);
    ellipse(i, y, sx, sy);  
  }
  }
}



