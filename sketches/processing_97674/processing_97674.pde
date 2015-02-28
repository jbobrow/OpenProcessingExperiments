

float posx;
float posy;
float velx;
float vely;
float velx2;
float vely2;
float velx3;
float vely3;
float vely4;
float velx4;
float mida;
float posx1;
float posy1;
float posx2;
float posy2;
float posx3;
float posy3;
float posx4;
float posy4;
float posx5;
float posy5;
float posx0;
float posy0;
float velx0;
float vely0;
boolean cercles=true;
boolean quadrats=true;

void setup() {
  size (600,500);
 background(0);
  posx=random(0,600);
  posy=random(0,400);
  posx2=random(0,600);
  posy2=random(0,400);
  posx3=random(0,600);
  posy3=random(0,400);
  posx4=random(0,600);
  posy4=random(0,400);
  posx0=random(0,600);
  posy0=random(0,400);
  velx0=random(1,5);
  vely0=random(1,5);
  velx2=random(1,4);
  vely2=random(1,4);
  velx3=random(1,6);
  vely3=random(1,6);
  velx4=random(1,5);
  vely4=random(1,5);
  velx=random(1,5);
  vely=random(1,5);

  mida=20;
  stroke(255);
  fill(random(255),0,0);

}

void draw() {
  //background(142,194,247);


  
posx0=posx0+velx0;
posy0=posy0+vely0;

if (mousePressed){
//background(0);
  //comprobació dels límits
  if (posx0 > width) {
    velx0 = -velx0;
    posx0 = width;
  } 
   if (posx0 <0) { 
    velx0 = -velx0;
    posx0 = 0;
  }
    if (posy0  > height) {
    vely0 = -vely0;
    posy0 = height;
  } 
   if (posy0 <0) { 
     vely0 = -vely0;
    posy0 = 0;
  }
  
if(cercles){
  
  rectMode(CENTER);
  fill(random(255));
  rect(random(width),random(height),random(5,30),random(1,35));
  fill(random(255),random(255),random(255));
  ellipse(posx0,(posy0),random(10,30),random(1,35));
  
}


}else{
  //background(255);
  background(142,194,247);
  //fill(random(255),random(255),random(255));
  
//RODONES QUE VARIEN LA MIDA
//RODONA1
  //variació de la mida segons si puja o baixa

  if ((posy>height/2)||(posy>height)){
    mida=mida-0.8;
  }
  if ((posy<height/2)||(posy>0)){
    mida=mida+0.5;
  }
  
  if (mida>=80){
    mida=80;
  }
  if (mida<=5){
    mida=5;
  }
  posx=posx+velx;
  posy=posy+vely;
 
 //comprobació dels límits en l'eix x
  if ((posx+(mida/2))>=width) {
    velx=-velx; 
  }
  if ((posx-(mida/2))<=0){
    velx=-velx;
  }
  
  //comprobació dels límits en l'eix y
  if ((posy+(mida/2))>=height){
     vely=-vely;
  }
  if ((posy-(mida/2))<=0){
    vely=-vely;
  }
 
ellipse(posx,posy,mida,mida);

//RODONA2
  //variació de la mida segons si puja o baixa
  if ((posy2>height/2)||(posy2>height)){
    mida=mida-0.8;
  }
  if ((posy2<height/2)||(posy2>0)){
    mida=mida+0.5;
  }
  
  if (mida>=80){
    mida=80;
  }
  if (mida<=5){
    mida=5;
  } 
  posx2=posx2+velx2;
  posy2=posy2+vely2;
 //comprobació dels límits en l'eix x 
  if ((posx2+(mida/2))>=width) {
    velx2=-velx2;
  }
  if ((posx2-(mida/2))<=0){
    velx2=-velx2;
  } 
  //comprobació dels límits en l'eix y
  if ((posy2+(mida/2))>=height){
     vely2=-vely2; 
  }
  if ((posy2-(mida/2))<=0){
    vely2=-vely2;
  }

//stroke(255);
//fill(0,255,0);

ellipse(posx2,posy2,mida,mida);


//RODONA3
  //variació de la mida segons si puja o baixa

  if ((posy3>height/2)||(posy3>height)){
    mida=mida-0.8;
  }
  if ((posy3<height/2)||(posy3>0)){
    mida=mida+0.5;
  }
  
  if (mida>=80){
    mida=80;
  }
  if (mida<=5){
    mida=5;
  }

  
  posx3=posx3+velx3;
  posy3=posy3+vely3;
 
 //comprobació dels límits en l'eix x
  
  if ((posx3+(mida/2))>=width) {
    velx3=-velx3;  
  }
  if ((posx3-(mida/2))<=0){
    velx3=-velx3;
  }
  
  //comprobació dels límits en l'eix y

  if ((posy3+(mida/2))>=height){
     vely3=-vely3; 
  }
  if ((posy3-(mida/2))<=0){
    vely3=-vely3;
  }
//fill(255,0,0); 
ellipse(posx3,posy3,mida+2,mida+2);

//RODONA4
  //variació de la mida segons si puja o baixa
  if ((posy4>height/2)||(posy4>height)){
    mida=mida-0.8;
  }
  if ((posy4<height/2)||(posy4>0)){
    mida=mida+0.5;
  }
  
  if (mida>=80){
    mida=80;
  }
  if (mida<=5){
    mida=5;
  } 
  posx4=posx4+velx4;
  posy4=posy4+vely4;
 //comprobació dels límits en l'eix x 
  if ((posx4+(mida/2))>=width) {
    velx4=-velx4;  
  }
  if ((posx4-(mida/2))<=0){
    velx4=-velx4;
  } 
  //comprobació dels límits en l'eix y
  if ((posy4+(mida/2))>=height){
     vely4=-vely4; 
  }
  if ((posy4-(mida/2))<=0){
    vely4=-vely4;
  }

//fill(255); 
ellipse(posx4,posy4,mida+3,mida+3);
    

 }
 
/* 
 if (quadrats){
   fill(random(255),random(255),random(255));
   ellipse(posx0,(posy0),random(10,30),random(1,35));
  
}

*/

}




void mousePressed(){
 posx=mouseX;
 posy=mouseY;
 posx2=mouseX;
 posy2=mouseY;
 posx3=mouseX;
 posy3=mouseY; 
 posx4=mouseX;
 posy4=mouseY;
 posx0=mouseX;
 posy0=mouseY;
background(0);
 noStroke();
 fill(random(255),random(255),random(255));
  
}




