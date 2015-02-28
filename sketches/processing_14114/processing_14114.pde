
int y = 390;
float x = 280;
float spacing = 2;
int endLegs = 495;
int len =50;
float opa = 100;
float opaChange = 1;

size(700,750);
smooth();
background(255);


while(x <= endLegs){
  noFill();
  stroke(100,100,100,opa);
  ellipseMode(CENTER);
  ellipse(x,y,x-len*2,y+len*6);
  ellipse(x+4,y+4,x-len*4,y+len*5);
  ellipse(x+8,y+8,x-len*6,y+len*4);
  ellipse(x+12,y+12,x-len*8,y+len*3);
  ellipse(x+16,y+16,x-len*10,y+len*2);
  ellipse(x+20,y+10,x-len*12,y+len*1);
  ellipse(x+24,y+12,x-len*14,y+len*0);
  ellipse(x+30,y+14,x-len*16,y+len*-1);
  ellipse(x+34,y+16,x-len*18,y+len*-2);
  x = x + spacing;
  opa = opa - opaChange;
  
}

