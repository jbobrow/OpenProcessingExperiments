
float pXbola, pYbola, bar, barAltura, anchoBola=10, anchoBarra= 100, grosBar=5, incY, incX, val1, val2, valF, fH, anotaX, anotaY, distBola, puntos, op;
boolean dentroRX= false;
color verde= color(#00FF30, 150);

void setup() {
  size(400, 600);
  background(0);
  textSize(10);
  smooth();
  frameRate(30);
  barAltura= height*.8;
//  pXbola= width/2;
//  pYbola= height/4;
//  anotaX=random(100, width-anchoBarra/2);
//  anotaY=random(100, barAltura-anchoBarra/2);
  mouseX= width/2;
  reset();
}

void draw() {
  noStroke();
  fill(0, 255/3);
  rect(0, 0, width, height);
  val2= mouseX;
  valF= val2-val1;
  fH= valF*.5;
  val1= val2;
  pXbola+=incX;
  pYbola+=incY;
  distBola=dist(pXbola, pYbola, anotaX, anotaY);
  if (pYbola-anchoBola/2<=0) incY*=-1;
  if (pXbola-anchoBola/2<=0 || pXbola+anchoBola/2>=width) incX*=-1;
  if (pXbola+anchoBola/2 >= mouseX-anchoBarra/2 && pXbola-anchoBola/2 <= mouseX+anchoBarra/2) {
    dentroRX= true;
  }
  else {
    dentroRX= false;
  }
  if (pYbola+anchoBola/2 == barAltura-grosBar && dentroRX) {
    incX=incX+fH;
    incY*=-1;
  }
  println(pYbola+anchoBola/2);
  bar=constrain(mouseX-anchoBarra/2, 0, width-anchoBarra) ;
  noStroke();
  fill(#00FF30);
  ellipse(pXbola, pYbola, anchoBola, anchoBola);
  rect(bar, barAltura, anchoBarra, grosBar);
  strokeWeight(1.5);
  stroke(#00FF30);
  noFill();
  ellipse(anotaX, anotaY, anchoBola*2, anchoBola*2);
  if (pYbola-anchoBola/2>height) {
    op+=1;
    reset();
  }
  if (distBola<=10) {
    println("punto!!");
    puntos+=1;
    reset();
  }
if(op>2) exit();
text("PUNTAJE "+puntos, width-100, 20);
}

void reset() {
  puntos=puntos;
  pXbola= width/2;
  pYbola= height/4;
  anotaX=random(100, width-100);
  anotaY=random(100, barAltura-100);
  incX= 0;
  incY= 10;
}



