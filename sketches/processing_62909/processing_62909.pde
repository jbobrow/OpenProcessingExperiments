
void setup(){
size(500, 500);
background(0);
noStroke();
}
//posiciones
int x1 =150;
int y1 =150;
int x2 =250;
int y2 =250;

void draw(){
//cuadrados iniciales  
fill(255);
rect(x1, y1, 100, 100);
rect(x2, y1, 100, 100);
rect(x1, y2, 100, 100);
rect(x2, y2, 100, 100);
//primer cuadrado superior izq. cambia de color al hacer click y los otros se desplazan
if(mousePressed == true && mouseX <= width/2 && mouseX >= width/2-100 && mouseY <= height/2 && mouseY >= height/2-100){
fill(255, 0, 0, 10); //fondo transparente que da efecto de barrido
rect(0, 0, width, height);
fill(255, 0, 0);
rect(x1, y1, 100, 100);
fill(0, 0, 255);
rect(x2++, y1, 100, 100);
fill(0, 255, 0);
rect(x1, y2++, 100, 100);
fill(0, 255, 255);
rect(x2++, y2++, 100, 100);
};

if(mousePressed == true && mouseX <= width/2+100 && mouseX >= width/2 && mouseY <= height/2 && mouseY >= height/2-100){
fill(0, 255, 0, 10);
rect(0, 0, width, height);
fill(0, 0, 255);
rect(x1--, y1, 100, 100);
fill(0, 255, 0);
rect(x2, y1, 100, 100);
fill(255, 0, 255);
rect(x1--, y2++, 100, 100);
fill(255, 0, 0);
rect(x2, y2++, 100, 100);
};

if(mousePressed == true && mouseX <= width/2 && mouseX >= width/2-100 && mouseY <= height/2+100 && mouseY >= height/2){
fill(0, 0, 255, 10);
rect(0, 0, width, height);
fill(0, 255, 0);
rect(x1, y1--, 100, 100);
fill(255, 255, 0);
rect(x2++, y1--, 100, 100);
fill(0, 0, 255);
rect(x1, y2, 100, 100);
fill(255, 0, 0);
rect(x2++, y2, 100, 100);
};

if(mousePressed == true && mouseX <= width/2+100 && mouseX >= width/2 && mouseY <= height/2+100 && mouseY >= height/2){
fill(255, 10);
rect(0, 0, width, height);
fill(0);
rect(x1--, y1--, 100, 100);
fill(85);
rect(x2, y1--, 100, 100);
fill(165);
rect(x1--, y2, 100, 100);
fill(255);
rect(x2, y2, 100, 100);
};
//if para que todo vuelva a la posicion original cuando se deja de hacer click
if(mousePressed == false && mouseX <= width/2 && mouseX >= width/2-100 && mouseY <= height/2 && mouseY >= height/2-100 || mousePressed == false && mouseX <= width/2+100 && mouseX >= width/2 && mouseY <= height/2 && mouseY >= height/2-100 || mousePressed == false && mouseX <= width/2 && mouseX >= width/2-100 && mouseY <= height/2+100 && mouseY >= height/2 || mousePressed == false && mouseX <= width/2+100 && mouseX >= width/2 && mouseY <= height/2+100 && mouseY >= height/2){
fill(0);
rect(0, 0, width, height);
fill(255);
rect(150, 150, 100, 100);
rect(250, 150, 100, 100);
rect(150, 250, 100, 100);
rect(250, 250, 100, 100);
x1 =150;
y1 =150;
x2 =250;
y2 =250;
};

}

