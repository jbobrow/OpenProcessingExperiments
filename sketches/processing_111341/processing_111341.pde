

PImage fj;

void setup(){
   size(600,600); 
   fj = loadImage("finnjake.jpg");
}
void draw(){
   image(fj, 0,0, 10+mouseX, 10+mouseY); 
}






