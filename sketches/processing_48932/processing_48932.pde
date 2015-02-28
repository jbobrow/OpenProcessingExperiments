
//White Squid
 
 
boolean egocritter, shadows, wiggle=true;
int n = 3, l = 50, d = 50;
float zoom = 16, s = .1;
color c1 = 255, c2 = 255;
 
float w, h, mx, my, rx, ry, vv, zz;
int t, b;
 
void setup() {
  size(500, 500, P3D);
  w = width/10;
  h = height/10;
 
}
 
void draw() {
   
  if(egocritter) noCursor(); else cursor(ARROW);
     
  mx = lerp(mx, mouseX, s);
  my = lerp(my, mouseY, s);
  rx = lerp(rx, (w-mouseY)/w + (egocritter ? 5 : PI), s);
  ry = lerp(ry, (mouseX-w)/w, s);
  vv = lerp(vv, wiggle?.05:-.5, s);
  
  noStroke();
  background(random(255),random(255),random(255));
 
  
   
  translate(mx, my, 8 * zz * (sin(t*.05) -1));
  rotateY(ry);
  rotateX(rx);
  
   
  randomSeed(5);
  for(int i=-n; i<=n; i++)
    for(int j=-n; j<=n; j++) {
      pushMatrix();
      translate(i, j, 0);
      float d = random(vv, 1);
      float s = 5;
      for(float k=l; k>0; k--) {
        translate(0, 0, s);
        fill(noise(i, j, k+b)>.5 ? c1 : c2);
        box(1,1, s);
        rotateY(d * sin(t*.05 + PI*k/l));
        scale(1);
        s /= 1;
      }
      popMatrix();
  }
   
  t++;
   
}
 
void keyPressed() {
  
  switch(key) {
    case 'e': egocritter = !egocritter; break;
    case 'r': background(random(255), random(255), random(255));
    case 'w': wiggle = !wiggle; break;
    
    
    
  }
  
}
//thanks to bitcraft for "bitcritter 1"

