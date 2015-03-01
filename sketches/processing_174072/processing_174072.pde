
PImage foto;
color[] burbuja = {#7F5B8C, #10152A, #519ABF, #89BF63, #4FA6A0, #9E85A2, #58A1AF};
import ddf.minim.*; 
AudioPlayer sonido;
Minim agua;


void setup(){
  size(1024,768);
   foto=loadImage("Pecera.jpg");
  noStroke();
  agua=new Minim(this);
  sonido=agua.loadFile("burbujas.mp3");
  sonido.loop();
  }
 
void draw(){
  background(100);
   image(foto,0,0);
            bubbles();


}
 
void bubbles(){
  float cuad=mouseX;
  float tam=30;
    for(int x=0; x<1024; x+=20){
    for(int y=0; y<768; y+=20){
      fill(burbuja[int(random(burbuja.length))],85);
         stroke(mouseY,mouseX,255);
      rotate(cuad);
      ellipse(x,y,tam,tam);
      frameRate(20);
    }
  }
}
 
void keyPressed(){
  
  if (key=='m'){
        sonido=agua.loadFile("AQUA.mp3");
        sonido.loop();
 }
 
 if (key=='n'){
        sonido.pause();
}

if(key==DELETE || key==BACKSPACE) {
    background(100);
    println("canvas cleared");
  }

}


