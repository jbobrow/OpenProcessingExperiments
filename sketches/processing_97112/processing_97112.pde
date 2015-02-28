
PFont fuente;

void setup() {
  size(600, 600);
  background(0);
  smooth();
}

void draw(){
fill(0,10);
rect(0,0,width,height);
fuente=loadFont("Aharoni-Bold-48.vlw");
textFont(fuente); 
fill(255);
text("Maria Fernanda", mouseX, mouseY);

}


