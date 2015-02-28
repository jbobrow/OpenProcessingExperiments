
PImage imagen1;
void setup(){
size(900,600);
background(255);
imagen1=loadImage("arbol.jpg");
image(imagen1,0,0);
}
void draw(){
for(int x=0; x<imagen1.width ; x++){
for(int y=0; y<imagen1.height; y++){
color XColor;
XColor = imagen1.get( x+int(random(-2,2)),y+int(random(-100,100)));
set(x+450,y,XColor);
}
}
}

