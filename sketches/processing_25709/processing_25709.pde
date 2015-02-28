
float a = 0;
float b = 0;
float c = 0;
float d = 0;
float e = 0;
float f = 0;
float g = 0;

void setup(){
size(800, 470);
smooth();
noStroke();
rectMode(CENTER);
frameRate (20);
}

void draw(){
  background (250);
  fill(#FF9FBA,90);
  rect(20,30,a,a);
  a += 2;
  if (a > 400){
    a = 0;
  }
  fill(#FFBD5C,90);
  rect(140,60,b,b);
  b += 1;
  if (b > 400){
    b = 0;
  }
  fill(#88299B,90);
  rect(160,300,c,c);
  c += 1.5;
  if (c > 350){
    c = 0;
  }
  fill(#00FF00,90);
  rect(200,430,d,d);
  d += 4.5;
  if (d > 200){
    d = 0;
  }
  fill(#00CCFF,90);
  rect(420,330,e,e);
  e += 6.0;
  if (e > 650){
    e = 0;
  }
  fill(#FFBD5C,90);
  rect(370,260,f,f);
  f += 6;
  if (f > 400){
    f = 0;
  }
     fill(#00FF00,90);
  rect(620,140,g,g);
  g += 1.5;
  if (g > 350){
    g = 0;
  }
    fill(#FF9FBA,90);
  rect(600,360,a,a);
  a += 2;
  if (a > 400){
    a = 0;
  }
  fill(#88299B,90);
  rect(300,130,d,d);
  d += 4.5;
  if (d > 200){
    d = 0;
  }
}

