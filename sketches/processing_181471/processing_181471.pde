
number2 number2 = new number2(80,208);
number0 number0 = new number0(261,208);
number1 number1 = new number1(465,209);
number5 number5 = new number5(539,206);

void setup() {
  size(800,600);
  smooth();
  background(0);  
}

void draw() {
  // clean background
  fill(#7E1C51);
  noStroke();
  rect(0, 0, width, height);
  // write 2015
  number2.dessine();
  number2.Mouvement();
  number0.dessine();
  number0.Mouvement();
  number1.dessine();
  number1.Mouvement();
  number5.dessine();
  number5.Mouvement();
}


