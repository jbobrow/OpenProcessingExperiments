
float color1;
PImage imagen;
void setup(){
size(1000,500);
color1=random(0,255);
imagen = loadImage("corneta.jpg");
//background (0);



}

void draw(){
  
 


  tint(color1,color1,color1,100);
    PFont f = loadFont("BodoniSvtyTwoITCTT-Bold-48.vlw");
   textFont(f, 20);
text("Click presionado para revelar la foto", 100,400);

image(imagen,0,0);
for(int x=0; x<imagen.width ; x++){
for(int y=0; y<imagen.height ; y++){
color este;
este = get(x+int(random(-10,10)), y+int(random(-10,10)));
set(x+500,y, este);



if (y>=imagen.height); 
 x=x--;
 if (color1>=0); 
 color1=random(0,50);
 
 if (mousePressed){
 color1=255;



}
}
}

}




