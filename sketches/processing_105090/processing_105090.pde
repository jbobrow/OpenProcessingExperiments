
color c1 = #FC0000; //red
color c2 = #0337FF; //blue
color c3 = #00FF2C; //green
color c4 = #EAD000; //yellow
color c5 = #050505; //black
color c6 = #FFFFFF; //white

void setup(){
  size(500,500);
  background(255);
}

void draw(){
  
  fill(c5);
  noStroke();
  ellipse(mouseX, mouseY, 10, 10);
  
  //color boxes
  fill(c1);
  rect (20, 20, 50,50,7);
  noStroke();
  if((mouseX>20 && mouseX<70 && mouseY>20 && mouseY<70)){
    c5=c1;
  }
  
  fill(c2);
  rect (80, 20, 50,50,7);
  noStroke();
  if((mouseX>80 && mouseX<100 && mouseY>20 && mouseY<70)){
    c5=c2;
  }
  fill(c3);
  rect (140, 20, 50,50,7);
  noStroke();
  if((mouseX>140 && mouseX<160 && mouseY>20 && mouseY<70)){
    c5=c3;
  }
  fill(c4);
  rect (200, 20, 50,50,7);
  noStroke();
  if((mouseX>200 && mouseX<220 && mouseY>20 && mouseY<70)){
    c5=c4;
  }
  
  fill(255);
  stroke(0);
  rect (260,20,50,50,7);
  if(mousePressed) {
    background(255);
    }
}






 



