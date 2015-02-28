
//genera arboles "recursivos" y "fractalizados"
 
//pinta la semilla
//genera un numero parametrizado de hijos (child)
//genera un numero parametrizado de profundidad (deep)
//los colores de cada rama son aleatorios (de 0 a 200)
//el angulo de crecimiento es aleatorio dentro de los parametros
 
int Maxchilds = 3; 
int MaxDeep = 5;
 
void setup() {
  size(700, 400); 
  smooth();
  noLoop();  
  strokeWeight(1);  
}
 
void draw() {
 background(255);
 //draw the seed
 Vector seed = new Vector(width/2, height, random(20,50), 270);
 fractalize(seed, MaxDeep);
}
 
void mousePressed(){    
    draw();
}
 
/***Custom functions***/
void fractalize(Vector v, int deep){
 //break the recursive function
 if(deep <= 0 ){ return; }
 deep--;
 
 v.Render(); 
 for(int i=0; i<Maxchilds;i++){
  //create new vector
  Vector vChild = new Vector(v.getEndPointX(), v.getEndPointY(),   
                             random(50,100), random(180, 360));  
                             
  //renderize and fractalize recursive
  vChild.Render();                          
  fractalize(vChild, deep); 
 }
}
 
/***Custom classes***/
class Vector {
 float x, y, r, theta;
 float EndX, EndY;
 
 Vector (float _x, float _y, float _r, float _theta) {
  this.x = _x;
  this.y = _y;
  this.r = _r;
  this.theta = radians(_theta);
  
  //calculate endX and endY
  EndX = getEndPointX();
  EndY = getEndPointY();
 }
 
 //return x coordinate (polar coordinate)
 float getEndPointX() {
  return (x + r*cos(theta));
 }
 
 //return y coordinate (polar coordinate) 
 float getEndPointY() {
  return (y + r*sin(theta));
 }
 
 void Render(){  
  //draw the line with random colors
  stroke(random(200), random(200), random(200));  
  //text("X:"+round(EndX)+" Y:"+round(EndY), EndX, EndY );  
  line(x,y, getEndPointX(), getEndPointY() );
  
  //triangle(x,y, 150, 5);
  noFill();
  //ellipse(EndX,EndY, 5, 5);
  ellipse(x,y, 5, 5);
 } 
}
