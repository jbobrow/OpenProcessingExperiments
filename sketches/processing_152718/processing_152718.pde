
float i, x, y, fase=0;
void setup() {
  size(1000, 1000);
  frameRate(30);
}
void draw() {
  if(mousePressed) {
    background(random(255), random(255), random (255));//Fondo de colores
    fase=fase-2;//Giro en sentido contrario
  }
  else{
    background(0);
    fase=fase+2;
  }
  for (i=0; i<=100; i=i+0.1) {
    fill (random(255), random(255), random (255));//Bolas de colores
    //x = width/2 + cos(angle) * scalar;
    x = width/2+(cos(i*3.1+PI/19*fase)/sqrt(sq(i)+1)*(width/2));
    //y = height/2 + sin(angle) * scalar;
    y = height/2+(sin(i*3.1+PI/19*fase)/sqrt(sq(i)+1)*(height/2));
    ellipse(x, y, 15, 15);
  }
}



