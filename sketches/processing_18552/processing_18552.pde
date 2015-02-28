
void setup(){
  size(300,300);
}

int x=0;

void draw(){
  background(220,220,mouseX);
  fill(mouseX,225,mouseX);
  rect(0,2*height/3,width,2*height/3);
  fill(106,56,10);
  triangle(100,150,85,250,115,250);
  fill(225,mouseX,225);
  ellipse(100,150,mouseX-150,mouseX-150);
  fill(225,mouseX,mouseX);
  noStroke();
  ellipse(75,100,30/( mouseX+1 ),30/( mouseX+1 ));
  ellipse(140,130,20/( mouseX+1 ),20/( mouseX+1 ));
  ellipse(50,170,15/( mouseX+1 ),15/( mouseX+1 ));
  ellipse(110,190,20/( mouseX+1),20/( mouseX+1 ));
  ellipse(100,140,15/( mouseX+1),15/( mouseX+1 ));
  ellipse(150,160,30/( mouseX+1),30/( mouseX+1 ));
}
  

