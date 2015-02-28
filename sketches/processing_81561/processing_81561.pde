
//VARIABLES GLOBALES

PImage imagen;
PImage imagen1;
PImage imagen2;
PImage imagen3;
PImage imagen4;
PImage imagen5;
PImage imagen6;
PImage imagen7;
PImage imagen8;
PImage imagen9;
PImage imagen10;
PImage imagen11;
PImage imagen12;
PImage imagen13;
PImage imagen14;
PImage imagen20;
PImage imagen21;
PImage imagen22;
PImage imagen23;
PImage imagen24;
PImage imagen25;
PImage imagen26;
PImage imagen27;
PImage imagen28;
float numero;
float numero3;
float numero4;
boolean over1;
boolean over2;
boolean over3;
boolean over4;
boolean over5;

void setup(){
  size(900, 500);
  smooth();
  imageMode(CENTER);

 imagen = loadImage("mapeado.jpg");
  imagen1 = loadImage("gran via.jpg");
  imagen2 = loadImage("londres.jpg");
  imagen3 = loadImage("paris.jpg");
  imagen4 = loadImage("abu dhabi.jpg");
  imagen5 = loadImage("roma.jpg");
  imagen6 = loadImage("newyork.jpg");
  imagen7 = loadImage("tokio.jpg");
  imagen8 = loadImage("barcelona.jpg");
  imagen9 = loadImage("ciudad de mexico.jpg");
  imagen10 = loadImage("zurich.jpg");
  imagen11 = loadImage("berlin.jpg");
  imagen12 = loadImage("dubai.jpg");
  imagen13 = loadImage("callao.jpg");
  imagen14 = loadImage("roman.jpg");
  imagen20 = loadImage("harrods.jpg");
  imagen21 = loadImage("ciudad mexico.jpg");
  imagen22 = loadImage("zoco.jpg");
  imagen23 = loadImage("pari.jpg");
  imagen24 = loadImage("pa.jpg");
  imagen25 = loadImage("barcelo.jpg");
  imagen26 = loadImage("berli.jpg");
  imagen27 = loadImage("zur.jpg");
  imagen28 = loadImage("zu.jpg");
}



void draw(){
  background(255);

  image(imagen, width/2, height/2, width, height);
  
  if(over1){
   image(imagen1, 10, 90, 100, 100);
  }
  if(over2){
   image(imagen2, 290, 70, 100, 100);
  }
  if(over3){
   image(imagen3, 650, 120, 100, 100);
  }
  if(over4){
   image(imagen4, 450, 80, 100, 100);
  }
     if(over5){
   image(imagen5, 20, 200, 100, 100);
     }
   image(imagen6, 530, 250, 100, 100);
   image(imagen7, 750, 250, 100, 100);
   image(imagen8, 320, 250, 100, 100);
   image(imagen9, 70, 380, 100, 100);
   image(imagen10, 310, 380, 100, 100);
   image(imagen11, 550, 350, 100, 100);
   image(imagen12, 700, 350, 100, 100);
   image(imagen13, 20, 5, 100, 100);
   image(imagen14, 30, 290, 100, 100);
   image(imagen20, 230, 20, 100, 100);
   image(imagen21, 10, 360, 100,100);
   image(imagen22, 400, 20, 100, 100);
   image(imagen23, 700, 50, 100, 100);
   image(imagen24, 630, 10, 100, 100);
   image(imagen25, 260, 175, 100, 100);
   image(imagen26, 450, 390, 100, 100);
   image(imagen27, 210, 390, 100, 100);
   image(imagen28, 150, 390, 100,100);

  
  
  noStroke();
    if (key =='4'){
    fill(200, 100);
    float velocidad = dist(mouseX, mouseY, pmouseX, pmouseY);
    float parametro = map(velocidad, 0, 100, 0, 1);
    color imagen=lerpColor(color(10, 10, 10), color(255, 0, 0), parametro);
    stroke(imagen);
    strokeWeight(5);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
  
}


void mouseMoved(){
   stroke(150);
   over1 = ( dist(10, 90, mouseX, mouseY) < 50 );
   over2 = (dist(290, 70, mouseX, mouseY) < 50);
   over3 = ( dist(650, 120, mouseX, mouseY) < 50 );
   over4 = (dist(450, 80, mouseX, mouseY) < 50);
    over5 = ( dist(20, 200, mouseX, mouseY) < 50 );

}

  
  void keyReleased(){
    if (key == '4'){
      numero3 = numero3 +4;
    }
  }

