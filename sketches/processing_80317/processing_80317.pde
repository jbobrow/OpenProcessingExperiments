
void setup(){
  size(300,200);
  noStroke();
}
void draw(){
  background(255);
  noStroke();
  //bucle
  bucle();
//Colors per interactuar
  colors();
//Augmentar la mida del rect
  augmentar();
}
//Definició colors
void colors(){
  if (mousePressed){
    if (mouseX >=290 && mouseX <=300){
      fill(#FF0000);
      rect (290,0,10,200);
    }
    if (mouseX >=280 && mouseX <=290){
      fill(#00F7AF);
      rect (280,0,10,200);
    }
    if (mouseX >=270 && mouseX <=280){
      fill(#C787F2);
      rect (270,0,10,200);
    }
    if (mouseX >=260 && mouseX <=270){
      fill(#080808);
      rect (260,0,10,200);
    }
    if (mouseX >=250 && mouseX <=260){
      fill(#2DE5F7);
      rect (250,0,10,200);
    }
    if (mouseX >=240 && mouseX <=250){
      fill(#F74B2D);
      rect (240,0,10,200);
    }
    if (mouseX >=230 && mouseX <=240){
      fill(#F7EC00);
      rect (230,0,10,200);
    }
    if (mouseX >=220 && mouseX <=230){
      fill(#70F7B0);
      rect (220,0,10,200);
    }
    if (mouseX >=210 && mouseX <=220){
      fill(#C4AFF5);
      rect (210,0,10,200);
    }
    if (mouseX >=200 && mouseX <=210){
      fill(#299B29);
      rect (200,0,10,200);
    }
    if (mouseX >=190 && mouseX <=200){
      fill(#F2AC89);
      rect (190,0,10,200);
    }
    if (mouseX >=180 && mouseX <=190){
      fill(#03578E);
      rect (180,0,10,200);
    }
    if (mouseX >=170 && mouseX <=180){
      fill(#F091C0);
      rect (170,0,10,200);
    }
    if (mouseX >=160 && mouseX <=170){
      fill(#BFFA03);
      rect (160,0,10,200);
    }
    if (mouseX >=150 && mouseX <=160){
      fill(#F425F5);
      rect (150,0,10,200);
    }
    if (mouseX >=140 && mouseX <=150){
      fill(#FA4503);
      rect (140,0,10,200);
    }
    if (mouseX >=130 && mouseX <=140){
      fill(#520409);
      rect (130,0,10,200);
    }
    if (mouseX >=120 && mouseX <=130){
      fill(#00A026);
      rect (130,0,10,200);
    }
    if (mouseX >=110 && mouseX <=120){
      fill(#93E0F2);
      rect (110,0,10,200);
    }
    if (mouseX >=100 && mouseX <=110){
      fill(#FA03CD);
      rect (100,0,10,200);
    }
    if (mouseX >=90 && mouseX <=100){
      fill(#F7C302);
      rect (90,0,10,200);
    }
    if (mouseX >=80 && mouseX <=90){
      fill(#F71B02);
      rect (80,0,10,200);
    }
    if (mouseX >=70 && mouseX <=80){
      fill(#0225F7);
      rect (70,0,10,200);
    }
    if (mouseX >=60 && mouseX <=70){
      fill(#36F702);
      rect (60,0,10,200);
    }
    if (mouseX >=50 && mouseX <=60){
      fill(#8D84F2);
      rect (50,0,10,200);
    }
    if (mouseX >=40 && mouseX <=50){
      fill(#00FF1B);
      rect (40,0,10,200);
    }
    if (mouseX >=30 && mouseX <=40){
      fill(#E9FF00);
      rect (30,0,10,200);
    }
    if (mouseX >=20 && mouseX <=30){
      fill(#0074FF);
      rect (20,0,10,200);
    }
    if (mouseX >=10 && mouseX <=20){
      fill(#9B0610);
      rect (10,0,10,200);
    }
    if (mouseX >=0 && mouseX <=10){
      fill(#FF0011);
      rect (0,0,10,200);
    }
  }
}
//Definició augmentar
void augmentar(){
  if(!(mousePressed)){
     int j = mouseX;
    if (mouseX >=0 && mouseX <=300){
      stroke(0);
      fill(0,0,0,0);
      rect(j,0,10,200);
    }
  }
}
//Definició bucle
void bucle(){
  int a=0;
  while(a<300){
    fill(a);
    rect(a,0,10,200);
    a=a+10;
  }
}

