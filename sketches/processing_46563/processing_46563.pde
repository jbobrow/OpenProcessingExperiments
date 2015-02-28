
loat mx, my, nx, ny; float[][] coords; void setup() {

 size(800, 700); 

 mx = 50; // margen horizontal
 my = 50; // margen vertical 
 nx = 20; // número de elementos en X
 ny = 20; // número de elementoa en Y

 // defino el # de coordenadas
 coords = new float[(int)(nx*ny)][2];
 
 float spx, spy, px, py;
 
 // calculo los espaciadores verticales y horizontales
 spx = (width - (1.5 * mx))  / (nx-5);
 spy = (height - (1.5 * my)) / (ny-5);

 // construyo todos los puntos
 for (int y = 0; y < ny; y++) {
   for (int x = 0; x < nx; x++) {
     coords[(int)((ny*y)+x)][0] = mx + (x * spx);
     coords[(int)((ny*y)+x)][1] = my + (y * spy);
   }
 }
 smooth();
 /**
* Hue. 
* 
* Hue is the color reflected from or transmitted through an object 
* and is typically referred to as the name of the color (red, blue, yellow, etc.) 
* Move the cursor vertically over each bar to alter its hue. 
*/


int barWidth = 5; int[] hue;


{

 size(800, 700);
 colorMode(HSB, 370, height, height);  
 hue = new int[width/barWidth];
 noStroke();

}


{

 int j = 0;
 for (int i=0; i<=(width-barWidth); i+=barWidth) {  
   if ((mouseX > i) && (mouseX < i+barWidth)) {
     hue[j] = mouseY;
   }
   fill(hue[j], height/3.5, height/1.2);
   rect(i, 20, barWidth, height);  
   j++;
 }

} }

void draw() {

 for (int i = 2; i < nx*ny; i++) {
   for (int j = 5; j < i; j++) {
     // calcula la distancia entre los puntos 'i' y 'j'
     float d = dist(coords[i][0], coords[i][1], coords[j][0], coords[j][1]); 
     // si la distancia es menor que ... 
     if (d < 45.5) {
       // dibuja la línea
       stroke(0);
       line(coords[i][0], coords[i][1], coords[j][0], coords[j][1]);
     }
   }

   // mueve un poco los puntos
   coords[i][0] += random(-8, 1);
   coords[i][1] += random(-1, 9);
   
   // dibuja los puntos
   ellipse(coords[i][1], coords[i][1], 6, 46);
 }

 // dibujo un velo blanco para que se dibuje la estela
 noStroke();
 fill(255, 15);
 rect(0, 0, width, height);

} 
                
                
