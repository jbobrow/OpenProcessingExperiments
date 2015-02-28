
int booo = 0;

//no olvidar punto y coma!

void setup() {
  size(600, 600);
  //esto es lo mas extraño que he hecho...
}
void draw() {
  fill(190,booo * 5,booo + 50);
  rect(mouseX,mouseY,1,booo);
  rect(booo, height/100,booo + 5,100,100);
  rect(booo, height/100,500,booo * 5,500);
  ellipse(booo, height/2, booo * 3, booo + 5);//para hacer circulo escriba ellise
  booo+=3;
  println(booo);
}
