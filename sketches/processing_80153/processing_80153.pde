
//Creat per Pau.A

//variables

int color1=255;
int color2=0;

void setup(){
  size(300, 200);
  stroke(0,255,0);
}
void draw(){
  background(255);
  int i = 0;
  while (i < 290){
    fill(i);
    rect(i, 0, 10, height);
    i = i + 10;
  }
  if(mousePressed&&mouseX>=0&&mouseX<=10){
    fill(color1);
    rect(0,0,10,200);
    rect(290,0,10,200);
  }
    if(mousePressed&&mouseX>=11&&mouseX<=20){
    fill(color1);
    rect(10,5,10,200);
  }
    if(mousePressed&&mouseX>=21&&mouseX<=30){
    fill(color1);
    rect(20,10,10,200);
  }
    if(mousePressed&&mouseX>=31&&mouseX<=40){
    fill(color1);
    rect(30,15,10,200);
  }
    if(mousePressed&&mouseX>=41&&mouseX<=50){
    fill(color1);
    rect(40,20,10,200);
  }
    if(mousePressed&&mouseX>=51&&mouseX<=60){
    fill(color1);
    rect(50,25,10,200);
  }
    if(mousePressed&&mouseX>=61&&mouseX<=70){
    fill(color1);
    rect(60,30,10,200);
  }
    if(mousePressed&&mouseX>=71&&mouseX<=80){
    fill(color1);
    rect(70,35,10,200);
  }
  if(mousePressed&&mouseX>=81&&mouseX<=90){
    fill(color1);
    rect(80,40,10,200);
  }
    if(mousePressed&&mouseX>=91&&mouseX<=100){
    fill(color1);
    rect(90,45,10,200);
  }
    if(mousePressed&&mouseX>=101&&mouseX<=110){
    fill(color1);
    rect(100,50,10,200);
  }
    if(mousePressed&&mouseX>=111&&mouseX<=120){
    fill(color1);
    rect(110,55,10,200);
  }
    if(mousePressed&&mouseX>=121&&mouseX<=130){
    fill(color1);
    rect(120,60,10,200);
  }
    if(mousePressed&&mouseX>=131&&mouseX<=140){
    fill(color1);
    rect(130,65,10,200);
  }
    if(mousePressed&&mouseX>141&&mouseX<=150){
    fill(color1);
    rect(140,70,10,200);
  }
  if(mousePressed&&mouseX>151&&mouseX<=160){
    fill(color2);
    rect(150,75,10,200);
  }
  if(mousePressed&&mouseX>161&&mouseX<=170){
    fill(color2);
    rect(160,80,10,200);
  }
  if(mousePressed&&mouseX>171&&mouseX<=180){
    fill(color2);
    rect(170,85,10,200);
  }
  if(mousePressed&&mouseX>181&&mouseX<=190){
    fill(color2);
    rect(180,90,10,200);
  }
  if(mousePressed&&mouseX>191&&mouseX<=200){
    fill(color2);
    rect(190,95,10,200);
  }
  if(mousePressed&&mouseX>201&&mouseX<=210){
    fill(color2);
    rect(200,100,10,200);
  }
  if(mousePressed&&mouseX>211&&mouseX<=220){
    fill(color2);
    rect(210,105,10,200);
  }
  if(mousePressed&&mouseX>221&&mouseX<=230){
    fill(color2);
    rect(220,110,10,200);
  }
  if(mousePressed&&mouseX>231&&mouseX<=240){
    fill(color2);
    rect(230,115,10,200);
  }
  if(mousePressed&&mouseX>241&&mouseX<=250){
    fill(color2);
    rect(240,120,10,200);
  }
  if(mousePressed&&mouseX>251&&mouseX<=260){
    fill(color2);
    rect(250,125,10,200);
  }
  if(mousePressed&&mouseX>261&&mouseX<=270){
    fill(color2);
    rect(260,130,10,200);
  }
  if(mousePressed&&mouseX>271&&mouseX<=280){
    fill(color2);
    rect(270,135,10,200);
  }
  if(mousePressed&&mouseX>281&&mouseX<=290){
    fill(color2);
    rect(280,140,10,200);
  }
  if(mousePressed&&mouseX>291&&mouseX<=300){
    fill(color2);
    rect(290,145,10,200);
  }
}


