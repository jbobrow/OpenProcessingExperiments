
Estrella[] m = new Estrella[300];
PImage tierra;
PImage saturn;
PImage neptu;
float xPlaneta=0;
float yPlaneta=random(0,600);
float xSaturn=0;
float ySaturn=random(50,550);
float xNeptu=0;
float yNeptu=random(50,550);
float xVel=0;

void setup(){
  size (600, 600);
   tierra =loadImage("imagen1.png");
   saturn =loadImage("imagen2.png");
   neptu =loadImage("imagen3.png");
  for (int i = 0; i < m.length;i++){
    m[i] = new Estrella(random(width), random(height), random(2,10));
  }
}
void draw(){
    background(0);
    for (int i = 0; i < m.length;i++){
    m[i].dibuixa();
    m[i].moure();
    }  
    xVel=1.2;
    xPlaneta = (xPlaneta+xVel);
    yPlaneta = 80;
    if (xPlaneta <0) xPlaneta = 0;
    if (yPlaneta <0) yPlaneta = 0;
    if (xPlaneta >width) xPlaneta = (0+xVel);
    if (yPlaneta >height-100) yPlaneta = height-100;
    xVel=2.2;
    xSaturn = (xSaturn+xVel);
    ySaturn = 270;
    if (xSaturn <0) xSaturn = 0;
    if (ySaturn <0) ySaturn = 0;
    if (xSaturn >width-100) xSaturn = (0+xVel);
    if (ySaturn >height-100) ySaturn = height-100;
    xVel=3.2;
    xNeptu = (xNeptu+xVel); 
    yNeptu = 450; 
    if (xNeptu <0) xNeptu = 0;
    if (yNeptu <0) yNeptu = 0;
    if (xNeptu >width-100) xNeptu = (0+xVel);
    if (yNeptu >height-100) yNeptu = height-100;
  image(tierra,xPlaneta,yPlaneta,100, 100);
  image(saturn,xSaturn,ySaturn,180, 180);
  image(neptu,xNeptu,yNeptu, 100,100);
 
}

