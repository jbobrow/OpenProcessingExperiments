
//Práctica 2: Dibujo con variables
//Jesús C González
//20102014

int pos = 15;

void setup(){
  size(600,600);
}
void draw(){

//background(252,75,31,55);
  noStroke();
  
  fill(252,75,31,30);
  rect(0,0,600,600);
  
  
  fill(31,69,252);
  ellipse(width/2,height/2,mouseX,mouseY*5);

  stroke(pos/24,mouseX,mouseY,mouseY);
  strokeCap(ROUND);
  strokeWeight(mouseY/60);
  line(mouseX-75,mouseY+75,mouseX+75,mouseY-75);
  line(mouseX-75,mouseY-75,mouseX+75,mouseY+75);

  fill(22,mouseY,22);
  ellipse(mouseX+75,mouseY-75,mouseY/5,mouseY/5);
  ellipse(mouseX-75,mouseY+75,mouseY/5,mouseY/5);
  ellipse(mouseX-75,mouseY-75,mouseY/5,mouseY/5);
  ellipse(mouseX+75,mouseY+75,mouseY/5,mouseY/5);

  noStroke();

  fill(pos/24,mouseX,mouseY,mouseY);
  ellipse(mouseX,mouseY,pos/25,mouseY);
  ellipse(mouseX,mouseY,mouseY,pos/25);


  ellipse(mouseX,mouseY,100,100);
  fill(200,33,mouseY);
  ellipse(mouseX+250,mouseY+250,mouseX,mouseX);

  fill(mouseY,200,33);
  line(mouseX-150,mouseY+150,mouseX+150,mouseY-150);

  fill(252,75,31,mouseY -150);
  pos = pos + 1;
  ellipse(mouseX-33,pos/5,mouseX-140,1);
  ellipse(mouseX-3,pos/10,mouseX-340,1);
  ellipse(mouseX-90,pos/20,mouseX-200,1);
  ellipse(mouseX-33,pos/30,mouseX-340,1);
  ellipse(mouseX-83,pos/40,mouseX-30,1);
  ellipse(mouseX-43,pos/50,mouseX-440,1);
  ellipse(mouseX-333,pos/60,mouseX-300,1);
  ellipse(mouseX-123,pos/70,mouseX-250,1);
  ellipse(mouseX,pos/80,mouseX-111,1);
  ellipse(mouseX-180,pos/90,mouseX-540,1);
  ellipse(mouseX-63,pos/100,mouseX-75,1);


}


