
//VAR  
float angulo;  
float tamano;  
float ruidoT= 0.080;  
float variacionT;  
float orbita= random(80);  
//SETUP  
void setup () {  
size (800,600);  
background(30,30,30);  
smooth();  
}  
//DRAW  
void draw() {  
noStroke();  
fill(30,30,30,20);  
rectMode(CENTER);  
rect(width/2, height-5,800,5);  
//marcador  
rectMode(CENTER);  
noStroke();  
fill(188);  
ellipse(mouseX, height-5, 5,5);  
//giro  
translate (mouseX,mouseY);  
rotate(radians (angulo));  
variacionT+=ruidoT;  
tamano = noise (variacionT)*3;  
angulo = noise (variacionT)*720;  
if (mousePressed) {  
noFill();  
stroke(mouseX,255,mouseY,random(10,50));  
triangle (random(tamano*10), random(tamano*3), tamano*20, tamano*5, tamano*9, tamano*8);  
line(tamano*10, tamano*3,width-550, width-1 );  
variacionT+=ruidoT;  
tamano = noise (variacionT)*2;  
triangle (random(tamano*2), random(tamano*4), tamano*6, tamano*1.5, tamano*9, tamano*2.2);  
variacionT+=ruidoT;  
tamano = noise (variacionT)*4;  
triangle (random(tamano*15), random(tamano*30), tamano*17, tamano*25, tamano*9, tamano*4);  
}  
angulo ++;  
}  
void mousePressed(){  
fill(155);  
ellipseMode (CENTER);  
ellipse (random(150), random(30), 10,10);  
stroke(155);  
line (random(150), random(30), 10, 10);  
noFill();  
triangle (random(tamano*300),tamano*15,tamano*20,tamano*25,tamano*5,tamano*13);  
}  

