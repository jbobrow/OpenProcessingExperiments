
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
PImage imagen29;
PImage imagen30;
PImage imagen31;
PImage imagen32;
PImage imagen33;
PImage imagen34;
PImage imagen35;
PImage imagen36;
PImage imagen37;
PImage imagen38;
PImage imagen39;
PImage imagen40;
PImage imagen41;

float numero;
float numero3;
float numero4;
boolean over1;
boolean over2;
boolean over3;
boolean over4;
boolean over5;
boolean over6;
boolean over7;
boolean over8;
boolean over9;
boolean over10;
boolean over11;
boolean over12;
boolean over13;
boolean over14;
boolean over20;
boolean over21;
boolean over22;
boolean over23;
boolean over24;
boolean over25;
boolean over26;
boolean over27;
boolean over28;
boolean over29;
boolean over30;
boolean over31;
boolean over32;
boolean over33;
boolean over34;
boolean over35;
boolean over36;
boolean over37;
boolean over38;
boolean over39;
boolean over40;
boolean over41;

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
  imagen29 = loadImage("du.jpg");
  imagen30 = loadImage("p.jpg");
  imagen31 = loadImage("ny.jpg");
  imagen32 = loadImage("madrid.jpg");
  imagen33 = loadImage("madrid1.jpg");
  imagen34 = loadImage("londres1.jpg");
  imagen35 = loadImage("londres2.jpg");
  imagen36 = loadImage("abu1.jpg");
  imagen37 = loadImage("romaa.jpg");
  imagen38 = loadImage("rom.jpg");
  imagen39 = loadImage("b2.jpg");
  imagen40 = loadImage("barr.jpg");
  imagen41 = loadImage("barce.jpg");

}



void draw(){
  background(255);

  image(imagen, width/2, height/2, width, height);
  
  if(over1){
   image(imagen1, 50, 90, 150, 150);
  }
  if(over2){
   image(imagen2, 290, 70, 150, 150);
  }
  if(over3){
   image(imagen3, 650, 120, 150, 150);
  }
  if(over4){
   image(imagen4, 450, 80, 150, 150);
  }
     if(over5){
   image(imagen5, 70, 200, 150, 150);
     }
     if(over6){
   image(imagen6, 530, 250, 150, 150);
     }
     if(over7){
   image(imagen7, 750, 250, 150, 150);
     }
     if(over8){
   image(imagen8, 320, 250, 150, 150);
     }
     if(over9){
   image(imagen9, 70, 380, 150, 150);
     }
     if(over10){
   image(imagen10, 310, 380, 150, 150);
     }
     if(over11){
   image(imagen11, 550, 350, 150, 150);
     }
     if(over12){
   image(imagen12, 700, 350, 150, 150);
     }
     if(over13){
   image(imagen13, 80, 40, 150, 150);
     }
     if(over14){
   image(imagen14, 50, 290, 150, 150);
     }
     if(over20){
   image(imagen20, 230, 40, 150, 150);
     }
     if(over21){
   image(imagen21, 40, 440, 150,150);
     }
     if(over22){
   image(imagen22, 400, 20, 150, 150);
     }
     if(over23){
   image(imagen23, 700, 50, 150, 150);
     }
     if(over24){
   image(imagen24, 630, 30, 150, 150);
     }
     if(over25){
   image(imagen25, 260, 175, 150, 150);
     }
     if(over26){
   image(imagen26, 450, 390, 150, 150);
     }
     if(over27){
   image(imagen27, 210, 390, 150, 150);
     }
     if(over28){
   image(imagen28, 150, 390, 150, 150);
}
     if(over29){
   image(imagen29, 770, 380, 150, 150);
     }
     if(over30){
    image(imagen30, 790, 70, 150, 150);
     } 
     if(over31){
    image(imagen31, 620, 250, 150, 150);
     }
     if(over32){
     image(imagen32, 90, 90, 150, 150);
     } 
     if(over33){
     image(imagen33, 120, 100, 150, 150);
     }
     if(over34){
       image(imagen34, 170, 100, 150, 150);
     }
     if(over35){
       image(imagen35, 340, 100, 150, 150);
     }
     if(over36){
       image(imagen36, 570, 100, 150, 150);
     }
     if(over37){
       image(imagen37, 60, 290, 150, 150);
     }
     if(over38){
       image(imagen38, 80, 290, 150, 150);
     }
     if(over39){
       image(imagen39, 180, 270, 150, 150);
     }
     if(over40){
       image(imagen40, 230, 300, 150, 150);
     }
     if(over41){
       image(imagen41, 280, 260, 150, 110);
     }
  
  
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
   over5 = ( dist(70, 200, mouseX, mouseY) < 50 );
   over6 = ( dist(530, 250, mouseX, mouseY) < 50 );
   over7 = ( dist(750, 250, mouseX, mouseY) < 50 );
   over8 = ( dist(320, 250, mouseX, mouseY) < 50 );
   over9 = ( dist(70, 380, mouseX, mouseY) < 50 );
   over10 = ( dist(310, 380, mouseX, mouseY) < 50 );
   over11 = ( dist(550, 350, mouseX, mouseY) < 50 );
   over12 = ( dist(700, 350, mouseX, mouseY) < 50 );
   over13 = ( dist(80, 40, mouseX, mouseY) < 50 );
   over14 = ( dist(50, 290, mouseX, mouseY) < 50 );
   over20 = ( dist(230, 40, mouseX, mouseY) < 50 );
   over21 = ( dist(40, 440, mouseX, mouseY) < 50 );
   over22 = ( dist(400, 20, mouseX, mouseY) < 50 );
   over23 = ( dist(700, 50, mouseX, mouseY) < 50 );
   over24 = ( dist(630, 30, mouseX, mouseY) < 50 );
   over25 = ( dist(260, 175, mouseX, mouseY) < 50 );
   over26 = ( dist(450, 390, mouseX, mouseY) < 50 );
   over27 = ( dist(210, 390, mouseX, mouseY) < 50 );
   over28 = ( dist(150, 390, mouseX, mouseY) < 50 );
   over29 = ( dist(770, 380, mouseX, mouseY) < 50 );
   over30 = ( dist(790, 70, mouseX, mouseY) < 50 );
   over31 = ( dist(620, 250, mouseX, mouseY) < 50 );
   over32 = ( dist(100, 120, mouseX, mouseY) < 50);
   over33 = ( dist(150, 120, mouseX, mouseY) < 50);
   over34 = ( dist(250, 120, mouseX, mouseY) < 50);
   over35 = ( dist(320, 120, mouseX, mouseY) < 50);
   over36 = ( dist(570, 120, mouseX, mouseY) < 50);
   over37 = ( dist(60, 310, mouseX, mouseY) < 50);
   over38 = ( dist(100, 310, mouseX, mouseY) < 50);
   over39 = ( dist(110, 290, mouseX, mouseY) < 50);
   over40 = ( dist(150, 380, mouseX, mouseY) < 50);
   over41 = ( dist(210, 330, mouseX, mouseY) < 50);
 

 
}


