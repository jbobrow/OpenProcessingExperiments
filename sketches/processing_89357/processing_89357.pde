
PImage guita1,guita2,guita3,guita4,cani1,cani2;

int size1=300;
int size2=300;



  int cambio = 0;

void setup() {
   size(600,600);
   smooth();
   background(0);
}

void mouseReleased() {
  if(cambio == 5) {
    cambio= -1;
  }
  
  cambio++;
  
}

void draw() {
  // Load all images
  guita1 = loadImage("gui1.jpg");
  guita2 = loadImage("gui2.jpg");
  guita3 = loadImage("gui3.jpg");
  guita4 = loadImage("gui4.jpg");
  cani1 = loadImage("cani1.jpg");
  cani2 = loadImage("cani2.jpg");
 
   
  PImage[] fotos = new PImage[6];

  fotos[0] = guita2;
  fotos[1] = guita3;
  fotos[2] = cani2;
  fotos[3] = guita1;
  fotos[4] = cani1;
  fotos[5] = guita4;
  
  
  translate(width/2,height/2);
  if(mouseButton == LEFT) {
    rotate(radians(millis()/5.0));
     size1--;
    size2--;

  }
  if(mouseButton == RIGHT) {
    rotate(radians(millis()/10.0));
    size1--;
    size2--;
    
    
  }
  image(fotos[cambio],0,0, size1,size2);
  
}


