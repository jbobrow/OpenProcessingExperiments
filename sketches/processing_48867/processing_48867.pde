
size(400,400);
colorMode(HSB);

background(#D9DFE0);
noFill();
stroke(#EDEEF7);

float i = 0;
float a = 0;
float b = 0;

strokeWeight(2);
stroke(#9ADBEA);
ellipse(300,50,80,40);
ellipse(100,50,40,40);
ellipse(100,50,80,40);
ellipse(300,50,40,40);

while(a < 4){
  strokeWeight(1);
  ellipse(300,80+2*a,10,10);
  a = a + 1;
}

while(i < 100) {
  strokeWeight(1);
  stroke(#EDEEF7);
  ellipse(width/2-i, height/2-i, 100+i*4,100-i*5);
  i = i + 1;
   
  stroke(#EDC294);
  ellipse(width/2+i, height/2-i, 100+i*4,100-i*5);
  i = i + 1;
   
while(b < 50) {
  stroke(#E56E0C);
  ellipse(width/2,height/2+b, 100,100);
  b = b + 2;
  }
}

