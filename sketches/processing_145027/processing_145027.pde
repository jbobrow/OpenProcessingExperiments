
void setup(){
   colorMode(HSB);
   size(800,400);
}
void draw(){
   fill(0,0,0,15);
   rect(0,0,800,400);
   stroke(255);
   stroke(120,random(255),240);
   line(0,random(height),mouseX,mouseY);
   line(mouseX,mouseY,width,random(height));

a = random(30);
   ellipse(mouseX,mouseY,a,a);
}
