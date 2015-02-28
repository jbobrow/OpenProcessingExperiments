
        int blocksize;
        int luis;
        int romero;
void setup() {
size(400,400);
blocksize = 10;
noStroke();
background(#05FF03);
}

void draw() {
    for(int romero=5; romero<height; romero+=blocksize) {
      for(int luis=0; luis<width;luis+=blocksize) {
        fill(luis,mouseY,random(255));
        ellipse(luis,romero,mouseX,blocksize);
    }
}
        int specialX = mouseX - (mouseX % blocksize);
        int specialY = mouseY - (mouseY % blocksize);
        fill(3,8, random (255));
        ellipse(specialX, specialY, blocksize,blocksize);
        
    if(mouseX>10&&mouseY>0){
      fill(10);    
      textSize(15);
      text("Projecte Bucles",290,380);
      text("Assignatura: Programació",20,40);
      text("Centre d'Estudis Roca",240,40);
      text("1ºASIX (TARDA)",20,380);
    }
    if(mousePressed||(mouseButton==RIGHT)){
       for(int romero=5; romero<height; romero+=blocksize) {
          for(int luis=0; luis<width;luis+=blocksize) {
            fill(3,8,random(255));
            ellipse(luis,romero,mouseX,blocksize);
    }
   }   
        int X = mouseX - (mouseX % blocksize);
        int Y = mouseY - (mouseY % blocksize);
        fill(246,255, random (255));
        ellipse(X, Y, blocksize,blocksize);   
}
    if(mouseButton==LEFT){
        int X = mouseX - (mouseX % blocksize);
        int Y = mouseY - (mouseY % blocksize);
        fill(random (255),random (255), random (255));
        ellipse(X, Y, blocksize,blocksize);
    }    
    if(mouseButton==RIGHT){
      textSize(32);
      fill(random (255),random (255),random (255));
      text("¡¡¡PROGRAMACIÓN!!!",60,200);
    }
}


