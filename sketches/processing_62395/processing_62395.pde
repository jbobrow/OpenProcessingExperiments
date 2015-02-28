


int x,y; // coordenadas punto
float r,g,b;// colores
int cuad; // tamaño de los cuadrados

void setup(){
  
  size(600, 600);
  //background(0);
  x= 0;
  y= 0;
  cuad = 30; //tamaño de los cuadrados
}


void draw(){
    if (x < width){
  
    r= random (255);
    g= random (255-r);
    b= random (255-g);

    noStroke();
    fill(r,g,b);
    rect(x, y, cuad, cuad); // dibujo cuadrado
    
    x += cuad;
        
    } else {
        x=0;
        y+=cuad;
}
}


