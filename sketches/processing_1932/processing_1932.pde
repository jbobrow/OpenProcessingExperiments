
float hueprincipal =random (100,245);

void setup(){
size (700,700);
colorMode (HSB,255);
background(250);
smooth();
}
void draw(){
  float centroX= random (5);
  float centroY= random (5);
  translate (width/centroX,height/centroY);
//for (int i=0; i<100; i++){
  stroke (hueprincipal+random(10),100+random(60),80+random(100),10);
strokeWeight (5+random(10));
noFill();
float diametro = random(width);
ellipse(0,0, diametro,diametro);
line(10,10,diametro*5,diametro*5);
}
void keyPressed(){
  saveFrame("screen.png");
}

