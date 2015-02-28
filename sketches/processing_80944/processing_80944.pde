
void setup() {
  size(300,200);
  background(255);
  strokeWeight(5);
  noFill();
  smooth();
}

void draw() {
  background(255);
  stroke(34,0,196);
  ellipse(70,70,100,100);//azul
  stroke(0,0,0);
  ellipse(140,70,100,100);//negro
  stroke(227,233,10);
  ellipse(105,140,100,100);//amarillo
  stroke(55,240,2);
  ellipse(175,140,100,100);//verde
  stroke(192,1,30);//rojo
  
  int x= int (random(150));
  int y= int (random(150));

  if((x!=210)&&(y!=70)) {
    ellipse(x,y,100,100);   
  }
  else {
    ellipse(210,70,100,100);
    noLoop();
  }
}


