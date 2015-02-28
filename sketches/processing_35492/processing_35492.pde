
float x=0;
float y=0;
float vx=0;
float vy=0;
float a=0.01;
float fric=0.95;
 
 
void setup() {
  size (screen.width,screen.height,P3D);
  colorMode(HSB,100);
  frameRate(30);
  strokeWeight(1);
  background(0);
 
}
 
void draw() {
  vx += a * (mouseX-x);
  vy += a * (mouseY-y);
  vx *= fric;
  vy *= fric;
   
   //println(frameCount);
  fill(frameCount%100,80,100,50);
  stroke(frameCount%100,80,100);
  rect(x,y,3*vx,3*vy);
   
  x += vx;
  y += vy;
  if (mousePressed){
    save("wanatta_RETANGULOS_coloridos.tif");
  }
}

