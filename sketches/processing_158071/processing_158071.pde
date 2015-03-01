
int tono=0;
float px=0;
void setup() {
  colorMode(HSB);//Define el modo de color
   size (800,600);
 }
 
 void draw() {
   tono++; //tono=x=1 - Aumenta uno por uno
   if(tono>255) { //Condicion de llegar solo hasta 255 en rgb
     tono=0;}
 if(mousePressed) {
   px++;
   noStroke();
   fill(tono,255,255);
   ellipse(mouseX,mouseY,random(250),random(250));
 }
 }
