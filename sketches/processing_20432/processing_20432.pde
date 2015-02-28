
PImage shadow1;
PImage shadow2;
PImage shadow3;
PImage shadow4;
PImage shadow5;
PImage shadow6;
PImage shadow7;
PImage shadow8;
PImage shadow9;
PImage shadow10;
PImage shadow11;
PImage shadow12;
PImage shadow13;
PImage shadow14;
PImage shadow15;
PImage shadow16;
PImage shadow17;
PImage shadow18;
PImage shadow19;
PImage shadow20;
PImage shadow21;
PImage shadow22;
PImage shadow23;
PImage shadow24;
PImage shadow25;
PImage shadow26;
PImage shadow27;
PImage shadow28;
PImage shadow29;
PImage shadow30;
PImage bg;
int a;

float C1x = 0.0;
float C2x = 100.0;
float C3x = 200.0;
float C4x = 300.0;
float C5x = 400.0 ;
float C6x = 500.0;

void setup(){
  
  size(640,480);
    
    bg = loadImage("largeS.jpg");


  shadow1=loadImage("s01.jpg");
  shadow2=loadImage("s02.jpg");
  shadow3=loadImage("s03.jpg");
  shadow4=loadImage("s04.jpg");
  shadow5=loadImage("s05.jpg");
  shadow6=loadImage("s06.jpg");
  shadow7=loadImage("s07.jpg");
  shadow8=loadImage("s08.jpg");
  shadow9=loadImage("s09.jpg");
  shadow10=loadImage("s10.jpg");
  shadow11=loadImage("s11.jpg");
  shadow12=loadImage("s12.jpg");
  shadow13=loadImage("s13.jpg");
  shadow14=loadImage("s14.jpg");
  shadow15=loadImage("s15.jpg");
  shadow16=loadImage("s16.jpg");
  shadow17=loadImage("s17.jpg");
  shadow18=loadImage("s18.jpg");
  shadow19=loadImage("s19.jpg");
  shadow20=loadImage("s20.jpg");
  shadow21=loadImage("s21.jpg");
  shadow22=loadImage("s22.jpg");
  shadow23=loadImage("s23.jpg");
  shadow24=loadImage("s24.jpg");
  shadow25=loadImage("s25.jpg");
  shadow26=loadImage("s26.jpg");
  shadow27=loadImage("s27.jpg");
  shadow28=loadImage("s28.jpg");
  shadow29=loadImage("s29.jpg");
  shadow30=loadImage("s30.jpg");


}

void draw(){
  noLoop();
  background(bg);
  a = (a+1)%(width+32);




C1x= round(random(0,6))*100;
C2x= round(random(0,6))*100;
while(C2x==C1x){
  C2x= round(random(0,6))*100;
}
C3x= round(random(0,6))*100;
while(C3x==C2x || C3x==C1x) {
  C3x= round(random(0,6))*100;  
}
C4x= round(random(0,6))*100;
while(C4x==C3x || C4x==C1x || C2x==C4x) {  
  C4x= round(random(0,6))*100;
}
C5x= round(random(0,6))*100;
while(C5x==C4x || C4x==C3x || C3x==C2x || C2x==C1x){
  C5x=round(random(0,6))*100;
}
C6x= round(random(0,6))*100;
while(C6x==C5x || C5x==C4x || C4x==C3x || C3x==C2x || C2x==C1x){
 C6x=round(random(0,6))*100;
}

//C1
image(shadow1,C1x,0,100,100);
image(shadow2,C1x,100,100,100);
image(shadow3,C1x,200,100,100);
image(shadow4,C1x,300,100,100);
image(shadow5,C1x,400,100,100);
//C2
image(shadow6,C2x,0,100,100);
image(shadow7,C2x,100,100,100);
image(shadow8,C2x,200,100,100);
image(shadow9,C2x,300,100,100);
image(shadow10,C2x,400,100,100);
//C3
image(shadow11,C3x,0,100,100);
image(shadow12,C3x,100,100,100);
image(shadow13,C3x,200,100,100);
image(shadow14,C3x,300,100,100);
image(shadow15,C3x,400,100,100);
//C4
image(shadow16,C4x,0,100,100);
image(shadow17,C4x,100,100,100);
image(shadow18,C4x,200,100,100);
image(shadow19,C4x,300,100,100);
image(shadow20,C4x,400,100,100);
//C5
image(shadow21,C5x,0,100,100);
image(shadow22,C5x,100,100,100);
image(shadow23,C5x,200,100,100);
image(shadow24,C5x,300,100,100);
image(shadow25,C5x,400,100,100);
//c6
image(shadow26,C6x,0,100,100);
image(shadow27,C6x,100,100,100);
image(shadow28,C6x,200,100,100);
image(shadow29,C6x,300,100,100);
image(shadow30,C6x,400,100,100);


}

void mousePressed(){
 loop(); 
}


  












