
float esquina=mouseX;
PFont miTipo;
void setup(){
size(500,400);
background(255);
miTipo=loadFont("AmericanTypewriter-30.vlw");
}
void draw(){
if (mousePressed == true){
  rotate(esquina);
  textFont( miTipo);
fill(random(255),random(255),random(100));
text("Kameha",mouseX,mouseY);
textFont(miTipo);
esquina=esquina+0.1;
 
}
}


