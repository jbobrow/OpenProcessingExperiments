

float x1,x2,y1,y2;

int lin = 10000; // cantidad de lineas
int largo = 500; //largo de las lineas
float a,b,c,n; 

void setup(){
  
  size(600, 600);
  background(255);
  n = 0; 
 
}
  
  
  
void draw(){
      
    
 if (n < lin) { 
    x1 = random (width); //asigo valores aleatorios a 3 de las coordenadas
    x2 = random (width);
    y1 = random (height);
    
    a = x1-x2;
    b = pow (a,2);
    c = pow (largo,2);
    y2 = y1 - sqrt(c-b);
    
    stroke(0);
    line(x1, y1, x2, y2); // calculo la 4ta coordenada por pitagoras
    
    n+=1;
    }


}

