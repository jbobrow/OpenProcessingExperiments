
float x = 280;
float y = 390;
float len = 50;
float spacing = 2;
float opa = 100;
float opaChange = 1;


void setup(){
  background(255);
  size(700,750);
  smooth();
  frameRate(30);

}

void draw(){
  
 
  noFill();
  stroke(opa,opa,opa,opa);
  ellipseMode(CENTER);
  ellipse(x,y,x-len*2,y+len*6);
  ellipse(x+spacing*2,y+spacing*2,x-len*4,y+len*5);
  ellipse(x+spacing*4,y+spacing*4,x-len*6,y+len*4);
  ellipse(x+spacing*6,y+spacing*6,x-len*8,y+len*3);
  ellipse(x+spacing*8,y+spacing*8,x-len*10,y+len*2);
  ellipse(x+spacing*10,y+spacing*5,x-len*12,y+len*1);
  ellipse(x+spacing*12,y+spacing*6,x-len*14,y+len*0);
  ellipse(x+spacing*15,y+spacing*7,x-len*16,y+len*-1);
  ellipse(x+spacing*17,y+spacing*8,x-len*18,y+len*-2);
  x = x + spacing;
  opa = opa - opaChange;
  
 if((opa > 255) || (opa < 0))
 opaChange *= -1;
 
 if((x > width) || (x < 0))
 spacing *= -1;
 
 if((y > height) || (y < 0))
 spacing *= -1;
 
 if(mousePressed){
   background(255);
}
}


