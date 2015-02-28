
void setup(){
size(200,200);
smooth();
}

void draw(){
background(255);
dibujaCaraFeliz();

}

void dibujaCaraFeliz(){
fill(0);
rectMode(CENTER);
rect(100,100,20,20);
ellipseMode(CENTER);
ellipse(80,80,20,20);
ellipse(120,80,20,20);
arc(100,120,50,50,0,PI);
}

