
float circulox;
int circuloy;
int dim;
float velocidad=0.90;
float r=0.40;
int b=60;
int g=30;

void setup(){
  size(500,400);
  background(255);
  circulox=0.60;
  circuloy=300;
  dim=110;
}

void draw(){
  
  //fill(255,5);
  //rect(0,0,width,height);
  float dim2=random(20);
  noStroke();
  fill(r,g,b);
  fill (random(0,100), random(0,160), random (0,255), random (0,100));
  ellipse (mouseX+random(100), mouseY+random(100), dim, dim);
  //ellipse (circulox+1, circuloy+1, dim/2, dim/2);
  ellipse (random(width),random(height), dim2, dim2);

}  
void mousePressed(){
  background(0);

}//fin del draw
