
float posX= 0;
float posY= 0;
boolean dig= true;
boolean down=true ;

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  background(0);
  
  //bola 1
if ((down==true)&& (posY<=450)) {
if ((posY>= 0) && ( posY<=450)) {
  posY=posY+.8;
  noStroke();
  //azul
  fill(22,149,163);
  ellipse (50,posY,50,50);
}

if (posY>450){
  fill(22,149,163);
  ellipse(50, posY,50,50);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  //blanco
  fill (255);
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
    //rosa
   fill(255,150,200);
  
    ellipse(100,posY,40,40);
    }
    if(posY>450){
      fill(255,150,200);
      ellipse(100,posY,40,40);
     down=false;
    }
}
else if ((down==false)&&(posY>=0)) {
  posY=posY-.8;
  //azul
  fill(22,149,163);
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
  //blanco
  fill(255);
  ellipse (150,posY,30,30);
}

if (posY>450){
  fill(255);
  ellipse(150, posY,30,30);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  //rosa
 fill (255,150,200);
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
  //azul
  fill(22,149,163);
  ellipse (200,posY,20,20);
}

if (posY>450){
  fill(22,149,163);
  ellipse(200, posY,20,20);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  //rosa
  fill (255,150,200);
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
  //azul
  fill(22,149,163);
  ellipse (250,posY,10,10);
}

if (posY>450){
  fill(22,149,163);
  ellipse(250, posY,10,10);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  //blanco
  fill (255);
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
  fill(22,149,163);
  ellipse (300,posY,10,10);
}

if (posY>450){
  fill(22,149,163);
  ellipse(300, posY,10,10);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  fill (255,150,200);
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
  fill(22,149,163);
  ellipse (350,posY,5,5);
}

if (posY>450){
  fill(22,149,163);
  ellipse(350, posY,5,5);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  fill (255,150,200);
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
  fill(22,149,163);
  ellipse (400,posY,5,5);
}

if (posY>450){
  fill(22,149,163);
  ellipse(400, posY,5,5);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  fill (255,150,200);
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
  fill(22,149,163);
  ellipse (450,posY,2,2);
}

if (posY>450){
  fill(22,149,163);
  ellipse(450, posY,2,2);
  down=false;
  }
}

else if ((down == false)&&(posY>=0)) {
  posY = posY-.8;
  fill (255,150,200);
  ellipse (450,posY,2,2);
}
if (posY <=50){
  down=true;
}

}

