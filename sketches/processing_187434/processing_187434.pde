
float posicioX;
float posicioY;
float velocitatX;
float velocitatY;
float r;
float g;
float b;
int sz;
PImage foto;

void setup (){
  size (600,400);
  foto = loadImage ("vaixell.png");
}

void draw (){
  cel();
  mar();
  sol();
  lluna();
  vaixell();
 
}



//-----FUNCIONS-----


void sol (){
  noStroke();
  fill(255,160,90);
  posicioX = 200;
  posicioY = 500;
  sz = 60;

//posició Sol segons hores

if (hour()==7){
    posicioY = height;
} else if (hour()==8){
  posicioY = 350;
} else if (hour()==9){
  posicioY = 300;
} else if (hour()==10){
  posicioY = 250;
} else if (hour()==11){
  posicioY = 200;
} else if (hour()==12){
  posicioY = 150;
} else if (hour()==13){
  posicioY = 100;
} else if (hour()==14){
  posicioY = 150;
} else if (hour()==15){
  posicioY = 200;
} else if (hour()==16){
  posicioY = 250;
} else if (hour()==17){
  posicioY = 300;
} else if (hour()==18){
  posicioY = 350;
} else if (hour()==19){
  posicioY = height;
} else {
  posicioY = 500;
}

//elipse sol
  ellipse(posicioX, posicioY, sz, sz);

}


void lluna (){
  noStroke();
  fill(180);
  posicioX = 400;
  posicioY = 500;
  sz = 40;

//posició Lluna segons hores

if (hour()==19){
    posicioY = height;
} else if (hour()==20){
  posicioY = 350;
} else if (hour()==21){
  posicioY = 300;
} else if (hour()==22){
  posicioY = 250;
} else if (hour()==23){
  posicioY = 200;
} else if (hour()==00){
  posicioY = 150;
} else if (hour()==01){
  posicioY = 100;
} else if (hour()==02){
  posicioY = 150;
} else if (hour()==03){
  posicioY = 200;
} else if (hour()==04){
  posicioY = 250;
} else if (hour()==05){
  posicioY = 300;
} else if (hour()==06){
  posicioY = 350;
} else if (hour()==07){
  posicioY = height;
} else {
  posicioY = 500;
}

//dibuix lluna+cràters
  ellipse(posicioX, posicioY, sz, sz);
  fill(100);
  ellipse(posicioX-5,posicioY-5,sz/5,sz/5);
  ellipse(posicioX+2,posicioY+5,sz/7,sz/8);
}


void mar (){
  noStroke();
  fill (80,210,255);
  rect (0,0,width, height/6);
  posicioX = width;
  posicioY = height;
  //escuma
  
  if (second()==00 || second()==10 || second()==20 || second()==30 || second()==40 || second()==50){
    posicioX= random(width);
    posicioY= random(1,66);
  } else if (second()==01 || second()==11 || second()==21 || second()==31 || second()==41 || second()==51){
   posicioX= random(width);
    posicioY= random(1,66);
  } else if (second()==02 || second()==12 || second()==22 || second()==32 || second()==42 || second()==52){
    posicioX= random(width);
    posicioY= random(1,66);
  } else if (second()==03 || second()==13 || second()==23 || second()==33 || second()==43 || second()==53){
    posicioX= random(width);
    posicioY= random(1,66);
  } else if (second()==04 || second()==14 || second()==24 || second()==34 || second()==44 || second()==54){
    posicioX= random(width);
    posicioY= random(1,66);
  } else if (second()==05 || second()==15 || second()==25 || second()==35 || second()==45 || second()==55){
   posicioX= random(width);
    posicioY= random(1,66);
  } else if (second()==06 || second()==16 || second()==26 || second()==36 || second()==46 || second()==56){
   posicioX= random(width);
    posicioY= random(1,66);
  } else if (second()==07 || second()==17 || second()==27 || second()==37 || second()==47 || second()==57){
   posicioX= random(width);
    posicioY= random(1,66);
  } else if (second()==8 || second()==18 || second()==28 || second()==38 || second()==48 || second()==58){
    posicioX= random(width);
    posicioY= random(1,66);
  } else if (second()==9 || second()==19 || second()==29 || second()==39 || second()==49 || second()==59){
   posicioX= random(width);
   posicioY= random(1,66);
  }
  fill(255);
 ellipse(posicioX,posicioY,width/80,height/80); 
}

void cel (){
  noStroke();
  fill(r,g,b);
  rect (0,0,width,height);

 //color cel hores
  if (hour()==00){
    r = 40;
    g = 50;
    b = 60;
} else if (hour()==01){
    r = 40;
    g = 50;
    b = 60;
} else if (hour()==02){
    r = 40;
    g = 50;
    b = 60;
} else if (hour()==03){
    r = 40;
    g = 50;
    b = 60;
} else if (hour()==04){
    r = 68;
    g = 104;
    b = 108;
} else if (hour()==05){
    r = 68;
    g = 104;
    b = 108;
} else if (hour()==06){
    r = 171;
    g = 230;
    b = 232;
} else if (hour()==7){
    r = 171;
    g = 230;
    b = 232;
} else if (hour()==8){
    r = 171;
    g = 230;
    b = 232;
} else if (hour()==9){
    r = 251;
    g = 255;
    b = 206;
} else if (hour()==10){
    r = 251;
    g = 255;
    b = 206;
} else if (hour()==11){
    r = 251;
    g = 255;
    b = 206;
} else if (hour()==12){
    r = 255;
    g = 247;
    b = 157;
} else if (hour()==13){
    r = 255;
    g = 247;
    b = 157;
} else if (hour()==14){
    r = 255;
    g = 247;
    b = 157;
} else if (hour()==15){
    r = 250;
    g = 221;
    b = 116;
} else if (hour()==16){
    r = 250;
    g = 221;
    b = 116;
} else if (hour()==17){
    r = 250;
    g = 221;
    b = 116;
} else if (hour()==18){
    r = 185;
    g = 88;
    b = 96;
} else if (hour()==19){
    r = 185;
    g = 88;
    b = 96;
} else if (hour()==20){
    r = 185;
    g = 88;
    b = 96;
} else if (hour()==21){
    r = 40;
    g = 50;
    b = 60;
} else if (hour()==22){
    r = 40;
    g = 50;
    b = 60;
} else if (hour()==23){
    r = 40;
    g = 50;
    b = 60;
  }
}
   
void vaixell(){
 posicioX = second()*11;
 posicioY = 63.5;
  image (foto,posicioX-70,posicioY,120,80);
 
} 


 



