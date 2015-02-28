
// Echo por: Marc Cabañas Garcia 1ºASIX(TARDA)
// Escala Masiva

int blocksize = 20;

int blocksize2 = 40;

int n = 140;

int m = 180;

void setup() {

size(600,600);

noStroke();

}

void draw() {

for(int y=0; y<height; y+=blocksize) {

for(int x=0; x<width;x+=blocksize) {
 
fill(random(0),random(180), random(255), 30);

ellipse(x,y,blocksize2,blocksize2);

}

}

if (mousePressed && (mouseButton == LEFT)){
    for (int i=0; i<=300; i=i+blocksize){
      for (int j=0; j<=600;j=j+blocksize){
        fill (mouseY,mouseX,random(100,155));
        ellipse (i,j,blocksize2, blocksize2);
       }
    }
  }
  
if (mousePressed && (mouseButton == LEFT)){
    for (int i=-100; i<=2800; i=i+blocksize2){
      for (int j=-100; j<=2900;j=j+blocksize2){
        fill (random(100,155),mouseX,mouseY);
        triangle (n,m,i,j, blocksize, blocksize);
       }
    }
  }  
  
if (mousePressed && (mouseButton == RIGHT)){
    for (int i=0; i<=600; i=i+blocksize){
      for (int j=0; j<=600;j=j+blocksize){
        fill (mouseY,random(100,155),mouseX);
        rect (i,j, blocksize, blocksize);
      }
    }
  }
  
if (mousePressed && (mouseButton == RIGHT)){
    for (int i=0; i<=300; i=i+blocksize2){
      for (int j=0; j<=600;j=j+blocksize2){
        fill (mouseX,random(0,255),mouseY);
        rect (i,j,blocksize2,blocksize2);
      }
    }
  }     

int specialX = mouseX - (mouseX % blocksize);

int specialY = mouseY - (mouseY % blocksize);

fill(mouseX,random(0,255),mouseY);

ellipse(specialX, specialY, blocksize2,blocksize);

}



