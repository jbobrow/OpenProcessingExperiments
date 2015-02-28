
int cuadrados;
 PFont  fontA;
void setup() {
 
size(800,400);
 
cuadrados = 6;
smooth();
noStroke();
 
}

void draw(){
  for(int y=0; y<height; y+=cuadrados) {
 
for(int x=0; x<width;x+=cuadrados) {
 
fill(random(100,255),random(0,100), random(9), 50);
noStroke();
rect(x,y,20,20);
 
}
 
}
if(mousePressed){
  for(int y=0; y<height; y+=cuadrados) {
 
for(int x=0; x<width;x+=cuadrados) {
 
fill(random(50,255),random(20,180), random(12), 50);
noStroke();
ellipse(x,y,20,20);
fontA = loadFont("ArialMT-48.vlw");
textFont(fontA, 72);
fill(0);
text("¡COLAPSO!",200,210);
}

    }
  }
}



