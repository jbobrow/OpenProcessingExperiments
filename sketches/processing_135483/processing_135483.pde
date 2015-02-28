
float i = 0;
void setup() {
  size(800, 800);
}
void draw() {
 //background(255);
i=i+0.09;
float posicionX = 400*sin(i);
float posicionY = 85*cos(i);
float copia=posicionY*4;
float otraPosicionY =10*sin(i+0.1);
float otraPosicionX =200*cos(i+0.01);

  ellipse(width/2+posicionX, height/2+posicionY, 80, 80);
   ellipse(width/2+posicionX, height/2+posicionY, 30, 30);

 ellipse(width/2+posicionY, height/2+posicionX, 50, 50);
rect(width/2+posicionX, height/2+posicionX, 50, 10);
noFill();
ellipse(width/2+posicionY, height/2+posicionX, 10, 10);
   ellipse(width/2+posicionY, height/2+posicionX, 100, 100);
ellipse(width/2+posicionX, height/2+posicionX, 10, 10);
strokeWeight(0.1);

}
