
int numLines = 12;
float[] x = new float[numLines]; 
float[] vel = new float[numLines]; 
float offset = 8; //Establece el espacio entre las líneas 

void setup() {
size(500, 500); 
smooth();
strokeWeight(10);

for (int i = 0; i < numLines; i++) {
x[i] = i; 
//Establece posición inicial
vel[i] = 0.1 + (i / offset); //Establece la velocidad inicial
 }
}

void draw() {
background(204); 
for (int i = 0; i < x.length; i++) {
  x[i] += vel[i];  
  if (x[i] > (width + offset)) {
 x[i] = -offset * 2; 
} 
float y = i * offset;  //Establece la coordenada-y
line(x[i], y, x[i]+offset, y+offset); //Dibuja la línea

}
}
