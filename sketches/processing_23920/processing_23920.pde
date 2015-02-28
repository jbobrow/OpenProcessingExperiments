
int bla = 0;
int m = 10;

void setup(){
  size(200,200);
  smooth();
  
}

void draw(){
  background(255);
  dibujaCaraFeliz();

}

void dibujaCaraFeliz(){
  fill(0);
  rectMode(CENTER);
  rect(100,100,20,20);
  ellipseMode(CENTER);
  ellipse(80,80,20,20);
  ellipse(120,80,20,20);
  arc(100,120,50,bla,0,PI);
  bla = bla + m;
  if((bla > 50) || (bla < 0)){
    m = m * -1;
  }
}


