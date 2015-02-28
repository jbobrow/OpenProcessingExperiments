
float posX= 0;
float posY= 0;
boolean dig= true;
boolean down=true ;

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  background(255);
  
  //bola 1
  // aqui le estamos diciendo que el espacio de trabajo es de 0 a 450
if ((down==true)&& (posY<=450)) {
if ((posY>= 0) && ( posY<=450)) {
  posY=posY+.8;
  noStroke();
  //rojo
  fill(173,0,43);
  ellipse (50,posY,50,50);
}

if (posY>450){
  fill(173,0,43);
  ellipse(50, posY,50,50);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  //azul
  fill (28,39,66);
  ellipse (50,posY,50,50);
}
if (posY <=50){
  down=true;
}

//bola2
if((down==true) && ( posY<=450)) {
  if((posY>=0)&&(posY<=450)){
    posY=posY+.8;
    noStroke();
    //rojo
   fill(209,10,10);
  
    ellipse(100,posY,40,40);
    }
    if(posY>450){
      fill(209,10,10);
      ellipse(100,posY,40,40);
     down=false;
    }
}
else if ((down==false)&&(posY>=0)) {
  posY=posY-.8;
  //azul
  fill(60,109,199);
  ellipse(100,posY,40,40);
  }
  if(posY<=50){
    down=true;
    }
    //bola 3
if ((down==true)&& (posY<=450)) {
if ((posY>= 0) && ( posY<=450)) {
  posY=posY+.8;
  noStroke();
  //rojo
  fill(209,40,10);
  ellipse (150,posY,30,30);
}

if (posY>450){
  fill(209,40,10);
  ellipse(150, posY,30,30);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  //azul
 fill (60,145,199);
  ellipse (150,posY,30,30);
}
if (posY <=50){
  down=true;
}
 //bola 4
if ((down==true)&& (posY<=450)) {
if ((posY>= 0) && ( posY<=450)) {
  posY=posY+.8;
  noStroke();
  //rojo
  fill(255,64,28);
  ellipse (200,posY,20,20);
}

if (posY>450){
  fill(255,64,28);
  ellipse(200, posY,20,20);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  //azul
  fill (90,154,190);
  ellipse (200,posY,20,20);
}
if (posY <=50){
  down=true;
}
 //bola 5
if ((down==true)&& (posY<=450)) {
if ((posY>= 0) && ( posY<=450)) {
  posY=posY+.8;
  noStroke();
  //rojo
  fill(245,133,42);
  ellipse (250,posY,10,10);
}

if (posY>450){
  fill(245,133,42);
  ellipse(250, posY,10,10);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  //azul
  fill (149,197,222);
  ellipse (250,posY,10,10);
}
if (posY <=50){
  down=true;
}
 //bola 6
if ((down==true)&& (posY<=450)) {
if ((posY>= 0) && ( posY<=450)) {
  posY=posY+.8;
  noStroke();
  //amarillo
  fill(245,183,59);
  ellipse (300,posY,10,10);
}

if (posY>450){
  fill(245,183,59);
  ellipse(300, posY,10,10);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  //azul
  fill (160,214,222);
  ellipse (300,posY,10,10);
}
if (posY <=50){
  down=true;
}
 //bola 7
if ((down==true)&& (posY<=450)) {
if ((posY>= 0) && ( posY<=450)) {
  posY=posY+.8;
  noStroke();
  //amarillo
  fill(245,217,37);
  ellipse (350,posY,5,5);
}

if (posY>450){
  fill(245,217,37);
  ellipse(350, posY,5,5);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  //azul
  fill (224,238,251 );
  ellipse (350,posY,5,5);
}
if (posY <=50){
  down=true;
}
 //bola 8
if ((down==true)&& (posY<=450)) {
if ((posY>= 0) && ( posY<=450)) {
  posY=posY+.8;
  noStroke();
  //amarillo
  fill(245,217,37);
  ellipse (400,posY,5,5);
}

if (posY>450){
  fill(245,217,37);
  ellipse(400, posY,5,5);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  //azul
  fill (224,238,251);
  ellipse (400,posY,5,5);
}
if (posY <=50){
  down=true;
}
 //bola 9
if ((down==true)&& (posY<=450)) {
if ((posY>= 0) && ( posY<=450)) {
  posY=posY+.8;
  noStroke();
  //amarillo
  fill(245,217,37);
  ellipse (450,posY,2,2);
}

if (posY>450){
  fill(245,217,37);
  ellipse(450, posY,2,2);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  //azul
  fill (224,238,251);
  ellipse (450,posY,2,2);
}
if (posY <=50){
  down=true;
 }
}

