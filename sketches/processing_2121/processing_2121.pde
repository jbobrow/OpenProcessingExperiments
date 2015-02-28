
//variables
//PImage bg;

    //circulo rojo. Test the cursor over the red circle
    float bx;
    float by;
    int bs = 150;
    boolean bover = false;
    boolean locked = false;

int rectanguloamarilloX = -200;
int rectanguloamarilloY =-125;

int cruzverticalX = 30;
int cruzverticalY =  -299;

int cruzhorizontalX = 5;
int cruzhorizontalY = -280;

int cuadradoazulX = 123;
int cuadradoazulY = -100;

int poligono1X = 123;
int poligono1Y = -100;

//atributos del archivo
void setup() 
{

size(530,775);
background(255);
noStroke();
smooth();
 //red circle
  bx = width/4.0;
  by = height/5.0;
 
}

//objects
void draw() 
{
//background
  //g = loadImage("rag_papel.jpg");
 // image(bg,0,0);

//red circle
  // Test if the cursor is over the box 
  if (mouseX > bx-bs && mouseX < bx+bs && 
      mouseY > by-bs && mouseY < by+bs) {
    bover = true;  
    if(!locked) { 
      stroke(#141DC1); 
      
    } 
  } else { 
    noStroke();
    bover = false;
  }
  
  // Draw all objects
  fill(#CE0000);
  ellipse(bx, by, bs, bs);
  
  

//rectangulo amarillo
  fill(#E0B402);
        //rotar rectangulo amarillo
        pushMatrix();
        translate(width/2, height/2);
        rotate(PI/-25.0);
        rect(rectanguloamarilloX,rectanguloamarilloY,450,30);
        popMatrix();
 
//cruz orizontal
  fill(#040E6F);
        //rotar cruz horizontal
        pushMatrix();
        translate(width/2, height/2);
        rotate(PI/-25.0);
        rect(cruzhorizontalX, cruzhorizontalY,60,12);
        popMatrix();
        
//poligono3 (x1, y1, x2, y2, x3, y3, x4, y4);
  fill(#CDCDD3);
       quad(276,490, 341,490, 297, 640, 232, 640);

//cruz vertical
  fill(#040E6F);
        //rotar cruz vertical
        pushMatrix();
        translate(width/2, height/2);
        rotate(PI/-25.0);
        rect( cruzverticalX, cruzverticalY,12,580);
        popMatrix();
 
 //rectangulo azul
  fill(#0F0E39);
 //rotar rectangulo amarillo
        pushMatrix();
        translate(width/2, height/2);
        rotate(PI/-3.0);
        rect(cuadradoazulX,cuadradoazulY,150,150);
        popMatrix();
 
//poligono1 (x1, y1, x2, y2, x3, y3, x4, y4);
  fill(#E0B402);

        quad(180,500, 200,500, 120,775, 100,775);
 
//poligono2 (x1, y1, x2, y2, x3, y3, x4, y4);
  fill(#CE0000);
        quad(206,480, 251,480, 196,673, 150,673);
 
//poligono4 (x1, y1, x2, y2, x3, y3, x4, y4);
  fill(#E0B402);
        quad(420,715, 515,665, 515,685, 420,735);
 
//poligono5 (x1, y1, x2, y2, x3, y3, x4, y4);
  fill(#CE0000);
        quad(330,700, 480,620, 480,665, 350,735);
 
} 
 
  

