
/*Tarea 1- Author: mauricio varela
*******this is version 0********
***not only has bugs but lots of zombies***
Crear un código donde múltiples círculos (o cualquier otra figura geométrica),
se muevan a diferentes velocidades. 

Cuando cualquier círculo se acerca a otro, a un radio menor predefinido, 
entonces dibujar una línea entre ambos círculos.

Tips: utilizar random() para definir cuanto se mueve un círculo en cada paso. 
      Checkear los bordes para que n se salgan los círculos*/
      
int minX, minY, maxX, maxY;
int shapeRadius = 100;
int shapeQty = 10;
float [][] shapes = new float[shapeQty][2];


void setup() {
  size(600, 600);
  colorMode(RGB,255);
  //noCursor();
  smooth();
  //colorMode(HSB, 255, 255, 255);
  //x = width/2;
  //y = height/2;
  //set the min and max values for positioning the shapes
  minX = shapeRadius;
  minY = shapeRadius;
  maxX = width - shapeRadius;
  maxY = height - shapeRadius;
  
  
  for (int i=0; i < shapeQty; i++) {
    //initial shape positions
    //random between min and max to respect the borders
    shapes[i][0]=random(minX, maxX);
    shapes[i][1]=random(minY,maxY);
    
   
  }
  
 
}

void draw(){
  background(255);
  noStroke();
  
  
 //shapes must move randomly
 for(int i = 0; i < shapeQty; i++){
   
   //draw shapes at their starting point
   stroke(0,100,0);
   fill(0,100,0,50);
   ellipse(shapes[i][0], shapes[i][1],shapeRadius, shapeRadius);
   
   //draw point in the center of the shape
   noStroke();
   ellipse(shapes[i][0], shapes[i][1],3,3);
   
   //shapes must move randomly
   shapes[i][0]+=(random(minX,maxX)-shapes[i][0])/(i*250);
   shapes[i][1]+=(random(minY,maxY)-shapes[i][1])/(i*250);
   
   //TODO:draw line between centers if shapes get closer than stablished
 }

 
}


