
void setup(){
  size(600,600);  
  stroke(0);
    background(255);
    noCursor();
}
void draw(){
//cordenadas  
float x1=mouseX;
float y1=mouseY;
float x2=mouseX/0.85;
float y2=mouseY*0.85;
float x3= mouseX/2;
float y3=mouseY*2;
//-------------------------------
fill(255, 255, 205, 10);
rect(0, 0, width, height);
//-------------------------------
//triangulos blancos que siguen a los circulos blancos
fill(255, 50);
triangle(200, 600, 300, 600, width-x1-150, height-y1/2);
triangle(300, 600, 400, 600, height-y2/2, height-y2-150);
triangle(600, 300, 600, 400, height-y2-150, width-x2/2);
triangle(600, 200, 600, 300, width-x2/2, width-x2-150);
triangle(200, 0, 300, 0, x1+150, y1/2);
triangle(300, 0, 400, 0, y2/2, y2+150);
triangle(0, 300, 0, 400, y2+150, x2/2);
triangle(0, 200, 0, 300, x2/2, x2+150);
//-------------------------------
fill(255, 255, 205, 20);
rect(0, 0, width, height);
//----------------------------------------------------
//triangulos en las esquinas
fill(255, 0, 0, 50);//sigue al circulo rojo
triangle(0, 500, 0, 600, x1, y1);
fill(255, 255, 0, 50);//sigue al circulo amarillo
triangle(0, 600, 100, 600, y2, y2);
fill(0, 255, 0, 50);//sigue al circulo verde
triangle(500, 600, 600, 600, y2, x2);
fill(255, 0, 255, 50);//sigue al circulo magenta
triangle(600, 600, 600, 500, x2, x2);
//---------------------------------------------
//triangulos en las esquinas --- estos se mueven en sentido contrario a los otros
fill(0, 0, 255, 50);//sigue al circulo azul
triangle(500, 0, 600, 0, width-x1, height-y1);
fill(0, 255, 255, 50);//sigue al circulo cian
triangle(600, 0, 600, 100, height-y2, height-y2);
fill(0, 255, 0, 50);//sigue al circulo verde opuesto
triangle(0, 0, 100, 0, height-y2, width-x2);
fill(255, 0, 255, 50);//sigue al circulo magenta opuesto
triangle(0, 0, 0, 100, width-x2, width-x2);
//-------------------------------
fill(255, 255, 205, 20);
rect(0, 0, width, height);
//---------------------------------------------
//circulos blancos
fill(255, 100);
ellipse(x2/2, x2+150, 20, 20);
ellipse(y2+150, x2/2, 30, 30);
ellipse(y2/2, y2+150, 40, 40);
ellipse(x1+150, y1/2, 50, 50);
//circulos blancos opuestos
ellipse(width-x2/2, width-x2-150, 20, 20);
ellipse(height-y2-150, width-x2/2, 30, 30);
ellipse(height-y2/2, height-y2-150, 40, 40);
ellipse(width-x1-150, height-y1/2, 50, 50);
//circulos grises
fill(128, 100);
ellipse(x2+300, x2, 20, 20);
ellipse(y2, x2+300, 30, 30);
ellipse(y2+300, y2, 40, 40);
ellipse(x1, y1+300, 50, 50);
//circulos blancos opuestos
ellipse(width-x2-300, width-x2, 20, 20);
ellipse(height-y2, width-x2-300, 30, 30);
ellipse(height-y2-300, height-y2, 40, 40);
ellipse(width-x1, height-y1-300, 50, 50);
//circulos gris claro
fill(192, 100);
ellipse(x3, x3+225, 20, 20);
ellipse(y3+225, x3, 30, 30);
ellipse(y3, y3+225, 40, 40);
ellipse(x3+225, y3, 50, 50);
//circulos blancos opuestos
ellipse(width-x3, width-x3-225, 20, 20);
ellipse(height-y3-225, width-x3, 30, 30);
ellipse(height-y3, height-y3-225, 40, 40);
ellipse(width-x3-225, height-y3, 50, 50);
//-------------------------------
fill(255, 255, 205, 30);
rect(0, 0, width, height);
//----------------------------------------------------
//circulos que van en direccion contraria
fill(255, 0, 255, 200);//circulo magenta
ellipse(width-x2, width-x2, 20, 20);
fill(0, 255, 0, 200);//circulo verde
ellipse(height-y2, width-x2, 30, 30);
fill(0, 255, 255, 200);//circulo cian
ellipse(height-y2, height-y2, 40, 40);
fill(0, 0, 255, 200);//circulo azul
ellipse(width-x1, height-y1, 50, 50);
//---------------------------------------------
//circulos 
fill(255, 0, 255, 200);//circulo magenta
ellipse(x2, x2, 20, 20);
fill(0, 255, 0, 200);//circulo verde
ellipse(y2, x2, 30, 30);
fill(255, 255, 0, 200);//circulo amarillo
ellipse(y2, y2, 40, 40);
fill(255, 0, 0, 200);//circulo rojo
ellipse(x1, y1, 50, 50);
}

