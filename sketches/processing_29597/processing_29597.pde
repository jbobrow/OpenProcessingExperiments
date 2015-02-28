
import hypermedia.video.*;
OpenCV opencv;

//boolean uno;
//boolean dos;
//boolean tres;
//boolean cuatro;
int cuentaUno;
int cuentaDos;
int cuentaTres;


PImage[] ojos;
PImage[] boca;
PImage[] pelo;
//PImage[] rostro;

PFont font;



void setup() {
  size(428, 284);
  
  opencv = new OpenCV( this );
    opencv.capture( width, height );                   // open video stream
    opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"
    
  
  font = loadFont("ArialMT-18.vlw");
  
  
//  uno = true;
//  dos = true;
//  tres = true;
//  cuatro = true;

  ojos = new PImage[10];
  boca = new PImage[10];
  pelo = new PImage[10];
  //rostro = new PImage[9];
  
  ojos[0] = loadImage("ojos 1.png");
  ojos[1] = loadImage("ojos 2.png");
  ojos[2] = loadImage("ojos 3.png");
  ojos[3] = loadImage("ojos 4.png");
  ojos[4] = loadImage("ojos 5.png");
  ojos[5] = loadImage("ojos 6.png");
  ojos[6] = loadImage("ojos 7.png");
  ojos[7] = loadImage("ojos 8.png");
  ojos[8] = loadImage("ojos 9.png");
  ojos[9] = loadImage("ojos 10.png");
    
  boca[0] = loadImage("boca 1.png");
  boca[1] = loadImage("boca 2.png");
  boca[2] = loadImage("boca 3.png");
  boca[3] = loadImage("boca 4.png");
  boca[4] = loadImage("boca 5.png");
  boca[5] = loadImage("boca 6.png");
  boca[6] = loadImage("boca 7.png");
  boca[7] = loadImage("boca 8.png");
  boca[8] = loadImage("boca 9.png");
  boca[9] = loadImage("boca 10.png");
  
  pelo[0] = loadImage("pelo 1.png");
  pelo[1] = loadImage("pelo 2.png");
  pelo[2] = loadImage("pelo 3.png");
  pelo[3] = loadImage("pelo 4.png");
  pelo[4] = loadImage("pelo 5.png");
  pelo[5] = loadImage("pelo 6.png");
  pelo[6] = loadImage("pelo 7.png");
  pelo[7] = loadImage("pelo 8.png");
  pelo[8] = loadImage("pelo 9.png");
  pelo[9] = loadImage("pelo 10.png"); 
  
  //rostro[0] = loadImage("rostro 1.png");
  //rostro[1] = loadImage("rostro 2.png");
  //rostro[2] = loadImage("rostro 3.png");
  //rostro[3] = loadImage("rostro 4.png");
  //rostro[4] = loadImage("rostro 5.png");
  //rostro[5] = loadImage("rostro 6.png");
  //rostro[6] = loadImage("rostro 7.png");
  //rostro[7] = loadImage("rostro 8.png");
  //rostro[8] = loadImage("rostro 9.png");
  
}

public void stop() {
    opencv.stop();
    super.stop();
}


void draw() {
  opencv.read();
  opencv.flip(OpenCV.FLIP_HORIZONTAL);
  image( opencv.image(), 0, 0 );
  //background(255);
  fill(0);
  textFont(font,18);
  
  text("Pelo", width - 100, 50);
  text("Ojos", width - 100, 100);
  text("Boca", width - 100, 150);


  image(ojos[cuentaUno], 0, 0, width, height);
  image(boca[cuentaDos], 0, 0, width, height);
  image(pelo[cuentaTres],0, 0, width, height);
  
 
//  if (uno) {
    
//    int cuentaUno = floor(random(9));
//    image(ojos[cuentaUno], 0, 0, width, height);
  
//  }  
  
//  if (dos) {

//    int cuentaDos = floor(random(9));
//    image(boca[cuentaDos], 0, 0, width, height);

//  }
  
//  if (tres) {

//    int cuentaTres = floor(random(9));
//    image(pelo[cuentaTres],0, 0, width, height);
  
//  } 
 
//  if (cuatro) {

//    int cuentaCuatro = floor(random(9));
//    image(rostro[cuentaCuatro],0, 0, width, height);
  
//  }  

}




void mouseReleased(){
  
  
  if (mouseX > 330 && mouseX < 360 && mouseY > 40 && mouseY < 50){
    cuentaTres = floor(random(10));
    
  
      
    }
    
    if (mouseX > 330 && mouseX < 360 && mouseY > 90 && mouseY < 100){
        cuentaUno = floor(random(10));
        
  
      
    }
    
    if (mouseX > 330 && mouseX < 360 && mouseY > 140 && mouseY < 150){
          cuentaDos = floor(random(10));
  
      
    }
  

  
  
  

  
  //int cuentaCuatro = floor(random(9));
  //image(rostro[cuentaCuatro],0, 0, width, height);
}

void keyReleased() {
  saveFrame("cara###.jpg");
}


