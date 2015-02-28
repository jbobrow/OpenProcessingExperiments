
float angle = 0;
  
   void setup() {
     size(600, 600);
     smooth();
}
   void draw() {
     background(0);
     fill(255, 62, 62);
     float xOff = (cos(angle*7.5)*30) * 10;
     float yOff = (sin(angle*6)*20) * 10;
     float x = mouseX;
     float y = mouseY;
     int w = width/2;
     int h = height/2;
     triangle(w + xOff, h + yOff, w + 90 + xOff, h + yOff, w + 90 + xOff, h + 90 + yOff);
     angle += .01;
     
}
