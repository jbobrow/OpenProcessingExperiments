
float ex, ey;

void setup() {
   size(480, 360);  // size della finestra (detta 'canvas')
   frameRate(60);
   smooth();        // attivazione dell'anti-alias
   ex = ey = 0;  
}
void draw() {
   float r = frameCount%256;
   float g = ( (float)mouseX/width * 255);
   float b = ( (float)mouseY/height * 255);
   
   //println("valore r = " + r);

   background(r, g, b);

   noFill();
   strokeWeight(5);
   stroke(0, 255, 0);
   ellipse(ex, ey, 100, 150);

}

void mouseMoved() {
   ex = width - mouseX;
   ey = height - mouseY;
}
