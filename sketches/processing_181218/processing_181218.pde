
int l = 30;
float sx = 0;
float sy = 0;
float easing = 0.06;

void setup() {
  background(0);
  size(600, 600);
  stroke(255);
  }
void draw() {
  background(0);
  
  sx += (mouseX - sx) * easing;
  sy += (mouseY - sy) * easing;
//ellipse(sx,sy,10,10);
  
  strokeWeight(2);
 
  for (int i = 100; i < 500; i+= 20) {
    for ( int y=100; y <500; y += 20) {
      float d = dist(i,y,sx,sy);
      float f = l / d;
      float dx = sx - i;
      float dy = sy - y;
         if( mousePressed ){
        dx *= -1;
        dy *= -1;
      }
      noFill();
      curve(i, y, i+ dx*f, y+dy*f, i+ dx*f, y+dy*f, sx, sy);
     //arc(i, y, abs(dx*f), abs(dy*f), HALF_PI, PI);
    }
  }
}


