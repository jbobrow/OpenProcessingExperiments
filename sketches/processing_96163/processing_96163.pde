

PImage img;// definicio de imatges
PImage space;
PImage sat;
void setup(){
 
  size(500,500);
   img=loadImage("earth.jpg");
   sat=loadImage("sat.jpg");
   space=loadImage("space.jpg");
  background(0);
  noStroke();
  rectMode(CENTER);
  noCursor();

  
}
//definició de variables
float x=200;
float y=200;
float a=0;
float i=0.15;
float x0=200;
float y0=200;
float r=50;
float y1;
float x1;
float b=PI;
float j=0.23;

void draw(){
  //si mantens clicat el mouse, el radi de les orbites creix fins a 200
  if (mousePressed==true){
    r=1.05*r;
    if(r>200){
    r=200;
    }
  }else{
      r=50;
  }
  fill(255);
 
//imatge de fons
 image(space,0,0,width,height);
  x0=mouseX;
  y0=mouseY;
 /* guarda el sistema de referència, trasllada el origen al centre i gira els dibuixos un angle a que s'incrementa a cada loop */
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(a/2);
  scale(0.2);
  image(img,-64,-64); //la terra centrada al origen
  scale(5);

image(sat,r,r); //el satèlit
  popMatrix();//torna el sistema de coordenades d'abans de pushmatrix
  x=x0+r*cos(0.5*a); //incrementa les coordenades dels cenres de les ellipses perquè es moguin
  y=y0+r*sin(0.6*a);
   x1=x0+r*cos(0.5*b);
  y1=y0+r*sin(b+0.2*PI);

ellipses(x,y);//dibuixa 3 ellipses de diferent color
ellipses(x1,y1);
 /* ellipse(x,y,20,20);
  fill(21,54,211);
  ellipse(x,y,15,15);
  fill(44,215,229);
  ellipse(x,y,8,8);
  
   fill(144,141,48);
  ellipse(x1,y1,20,20);
  fill(21,54,211);
  ellipse(x1,y1,15,15);
  fill(44,215,229);
  ellipse(x1,y1,10,10);
  */
 
  a=a+i;  //2 increments dels angles que determinen la velocitat de gir
  b=b+j;
}

void ellipses(float xx,float yy){ //definicio del subprograma ellipses
  fill(249,255,93);

  ellipse(xx,yy,10,10);
  fill(255,190,93);
  ellipse(xx,yy,7,7);
  fill(255,0,0);
  ellipse(xx,yy,5,5);
}


