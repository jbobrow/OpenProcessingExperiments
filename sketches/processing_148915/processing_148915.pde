
PImage meninas;
Cuadro cuadros[][];
 
 float velocidad = 5.0;
int  radio= 10;
float x = radio+1;
 
void setup(){
  size(540, 790,P2D);
  background(255);
  stroke(255);
  smooth();
  fill(255);
  frameRate(15);
  meninas= loadImage("5.jpg");
  cuadros = new Cuadro[meninas.width][meninas.height];
  for(int i = 0; i< meninas.width; i++){
    for(int j= 0; j< meninas.height; j++){
      color c1 = meninas.get(i,j);//extraer el valor de color del pixel (i,j)
 
      float r= red(c1);
      float g= green(c1);
      float b= blue(c1);
      float h = 70;
      cuadros[i][j]= new Cuadro(color(r,g,b), i*1.3, j*1.3);
    }
  }
}
 
void draw(){
   background(0);
  for (float i = 0; i< width; i+= 3){
    point(i, height/2);
      x += velocidad;
  ellipse(x, height/2, radio, radio);
}
    for(int i = 0; i< meninas.width; i++){
    for(int j= 0; j< meninas.height; j++){
      cuadros[i][j].dibuja();
      cuadros[i][j].mueve();
     cuadros[i][j].cambiaColor();
    }
  }
}

 
 

 
 
class Cuadro{
  float ancho=34 ;
  int largo= 5;
  float x, y;
  color col;
  float t = 3;
  float incremento = random(45)/7;
  float rad1;
  float rad2;
  int magnet = 10;
  float xInic, yInic;
 
  Cuadro(color col, float x, float y){
    this.col = col;
    this.x = x;
    this.y = y;
    this.rad1 = rad1;
    this.rad2 = rad2;
    this.xInic = x;
    this.yInic = y;
  }
  void mueve(){
    //x += random(4)-2;
    //y += random(4)-2;
    float forcex = 0;
    float forcey = 0;
    float x0 = x;
    float y0 = y;
    float x1 = mouseX;
    float y1 = mouseY;
    float distX = x1-x0;
    float distY = y1-y0;
 
    //float distancia = sqrt((distX * distX) + (distY * distY));
    float distancia = dist(x0,y0,x1, y1);
    t += incremento;
    float tx = sin(t/20)*rad1;
    float ty = sin(t/10)*rad2;
 
    float powerx = x-(distX/distancia)*magnet/distancia;
    float powery = y-(distY/distancia)*magnet/distancia;
 
    forcex += ((xInic-x0)/2)/10;
    forcey += ((yInic-y0)/2)/0.66;
 
    x = powerx+forcex+tx;
    y = powery+forcey+ty;
  }
  void cambiaColor(){
    
   float h = hue(this.col);
   float s = saturation(this.col);
   float b = brightness(this.col);
   h = dist(this.x, this.y, mouseX, mouseY);
   
   this.col = color(h,s,b);
   
  }
  void dibuja(){
    //noStroke();
    colorMode(HSB);
    stroke(this.col);
    point(x,y);
  }
}


