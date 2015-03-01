
float randcol1;
float randcol2;
float randcol3;
PImage logo;

void setup(){
size(700, 700);
background(0);
smooth();
frameRate(20);
logo = loadImage("http://ord.yahoo.co.jp/o/image/_ylt=A7dPeBzTmb9T8zQAcjOU3uV7;_ylu=X3oDMTBrZ25oc2dhBHZ0aWQDanBjMDAzBDADanBjMDAz/SIG=11si578k6/EXP=1405152083;_ylc=X3IDMgRmc3QDMQRpZHgDMARvaWQDQU5kOUdjUlR5OFVXOVNHUHduRGhtUmlBR3FNRktnZ3BhRC1kMGFQNm9SLVJVOHhDSmVxbnk3LTB4d1QyOWJrBHADNDRLazQ0T3A0NEs1NDRPSTQ0Q0E0NE9UNDRPcgRwb3MDMTA3BHNlYwNzaHcEc2xrA3Nmc3Q-/**http%3a//bsoza.com/ill_bldg/bldg01_a08.png");


}


void draw(){
  randcol1 = random(255);
  randcol2 = random(255);
  randcol3 = random(255); 
  noStroke();
  fill(randcol1, randcol2, randcol3, 80);
  ellipse(mouseX, mouseY, 30, 30);
  
  image(logo, 80, 180);
  

}


void keyPressed(){
  if(key == '1'){
    frameRate(5);
  }
  if(key == '2'){
    frameRate(20);
  }
  if(key == '3'){
    frameRate(80);
  }
}
  


