

//Creado por Oscar Martinez

//Clicar sobre cualquier rectangulo

void setup(){
  size(300, 200);
  stroke(237,255,3);
}
void draw(){
  smooth();
  
  int i=0;
  
  while (i <=290){    //creacion de los rectangulos con while
    fill(0);
    rect(i, 0, 10, 200);
    i+=10;
  
  }
  
  /*al presionar sobre uno de los rectangulos se transforma
    en rojo y tambien el rectangulo espejo*/
    
  if(mousePressed&&mouseX>=0&&mouseX<=10||mousePressed&&mouseX>=291&&mouseX<=300){
    fill(255,0,0);
    rect(0,0,10,200);
    rect(290,0,10,200);
  }
    if(mousePressed&&mouseX>=11&&mouseX<=20||mousePressed&&mouseX>=281&&mouseX<=290){
    fill(255,0,0);
    rect(10,5,10,190);
    rect(280,5,10,190);
  }
    if(mousePressed&&mouseX>=21&&mouseX<=30||mousePressed&&mouseX>=271&&mouseX<=280){
    fill(255,0,0);
    rect(20,10,10,180);
    rect(270,10,10,180);
  }
    if(mousePressed&&mouseX>=31&&mouseX<=40||mousePressed&&mouseX>=261&&mouseX<=270){
    fill(255,0,0);
    rect(30,15,10,170);
    rect(260,15,10,170);
  }
    if(mousePressed&&mouseX>=41&&mouseX<=50||mousePressed&&mouseX>=251&&mouseX<=260){
    fill(255,0,0);
    rect(40,20,10,160);
    rect(250,20,10,160);
  }
    if(mousePressed&&mouseX>=51&&mouseX<=60||mousePressed&&mouseX>=241&&mouseX<=250){
    fill(255,0,0);
    rect(50,25,10,150);
    rect(240,25,10,150);
  }
    if(mousePressed&&mouseX>=61&&mouseX<=70||mousePressed&&mouseX>=231&&mouseX<=240){
    fill(255,0,0);
    rect(60,30,10,140);
    rect(230,30,10,140);
  }
    if(mousePressed&&mouseX>=71&&mouseX<=80||mousePressed&&mouseX>221&&mouseX<=230){
    fill(255,0,0);
    rect(70,35,10,130);
    rect(220,35,10,130);
  }
  if(mousePressed&&mouseX>=81&&mouseX<=90||mousePressed&&mouseX>=211&&mouseX<=220){
    fill(255,0,0);
    rect(80,40,10,120);
    rect(210,40,10,120);
  }
    if(mousePressed&&mouseX>=91&&mouseX<=100||mousePressed&&mouseX>=201&&mouseX<=210){
    fill(255,0,0);
    rect(90,45,10,110);
    rect(200,45,10,110);
  }
    if(mousePressed&&mouseX>=101&&mouseX<=110||mousePressed&&mouseX>=191&&mouseX<=200){
    fill(255,0,0);
    rect(100,50,10,100);
    rect(190,50,10,100);
  }
    if(mousePressed&&mouseX>=111&&mouseX<=120||mousePressed&&mouseX>=181&&mouseX<=190){
    fill(255,0,0);
    rect(110,55,10,90);
    rect(180,55,10,90);
  }
    if(mousePressed&&mouseX>=121&&mouseX<=130||mousePressed&&mouseX>=171&&mouseX<=180){
    fill(255,0,0);
    rect(120,60,10,80);
    rect(170,60,10,80);
  }
    if(mousePressed&&mouseX>=131&&mouseX<=140||mousePressed&&mouseX>=161&&mouseX<=170){
    fill(255,0,0);
    rect(130,65,10,70);
    rect(160,65,10,70);
  }
    if(mousePressed&&mouseX>141&&mouseX<=150||mousePressed&&mouseX>=151&&mouseX<=160){
    fill(255,0,0);
    rect(140,70,10,60);
    rect(150,70,10,60);
  }  
 }
  



