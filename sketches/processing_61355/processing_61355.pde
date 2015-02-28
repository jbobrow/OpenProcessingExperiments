
float xPos = 150;
float yPos = 100;
int q1 = 120;
int w1 = 180;

void setup() {
  size(300, 300);
  frameRate(8);
  smooth();
  background(255);
}
 
void draw() {
   float a = random (80, 110);
   float b = random (130, 170);
   float c = random (80, 110);
   float d = random (200,260);
   float e = random (195, 220);
   float f = random (130, 170);
   float g = random (195, 220);
   float h = random (200, 260);
   fill(255);
   noStroke();
   rect( 0, 0, 300, 300);//hintergrund
   fill(0);
   ellipse(xPos, yPos, 80, 80);//kopf
   stroke(0);
   fill(255);
   strokeWeight(1);
   ellipse(120, 96,30, 35);//auge links
   ellipse(180, 96, 30, 35);//auge rechts
   fill(0);
   
   
  if (mousePressed) {
       strokeWeight(3);
       line(q1, q1, a, b);//linker oberschenkel
       line(a, b, c, d);//rechter oberschenkel
       line(w1, q1, e, f);//linker unterschenkel
       line(e, f, g ,h);//rechter unterschenkel
       ellipse(125, 96, 6, 6);//linkes auge
       ellipse(175, 96, 6, 6);//rechtes auge
       ellipse(c-5,d,20,10);//linker fuß
       ellipse(g+5, h, 20, 10);//rechter fuß
       stroke(255);
       bezier(140, 120, 145, 125, 155, 125, 160, 120);//mund glücklich
     }else{
    strokeWeight(3);
    line(q1, q1, 95, 150);
    line(w1, q1, 205, 150);
    line(95, 150, 95, 230);
    line(205, 150, 205, 230);
    ellipse(115, 90, 6 ,6);//linkes auge
    ellipse(185, 107, 6, 6);//rechtes auge
    ellipse(90, 230, 20, 10);//linker fuß
    ellipse(210, 230, 20, 10);//rechter fuß
    stroke(255);
    line(140, 120, 160, 120);//mund normal
  }
}
