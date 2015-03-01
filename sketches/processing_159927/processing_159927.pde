
void setup() {
  size(1000, 1000);
  background(#3E3D3D);
}

void draw() {

  fill(#1AC2C6);

  stroke(#FF00D1, 30);
  strokeWeight(.05);
  int counterer=0;
  while (counterer<2000) {
    ellipse(counterer*4, counterer*.4, 444+counterer/2, 444+100);
    line(counterer*(-2), counterer*3, 1300, 600);
    counterer=counterer+3;
  }
  stroke(#E2FF0A);
  strokeWeight(1);
  int counter=0;
  while (counter<2000) {
    quad(1000-counter/10, (-counter), counter/20, counter/2, counter+counter/20, counter/1.5, 1000-counter/50, 600-counter/60);
    ellipse(counter*4, counter*.8, 888, 888);
    ellipse(counter*3, counter*.8, 888, 888+100);
    counter=counter+3;
  }
  stroke(#FF21A7, 50);
  strokeWeight(2);
  int countererer=0;
  while (countererer<2000) {
    quad(1000-countererer/10, (-countererer), countererer/20, countererer/2, countererer+countererer/20, countererer/1.5, 1000-countererer/50, 600-countererer/60);
    ellipse(countererer*4, countererer*.8, 888, 888);
    ellipse(countererer*3, countererer*.8, 888, 888+100);
    countererer=countererer+3;
  }
  stroke(#FAFF00, 90);
  strokeWeight(7);
  int anotherone=0;
  while (anotherone<4000) {
    ellipse(anotherone*4, anotherone*.4, 444+anotherone/2, 444+100);
    ellipse(anotherone*4, anotherone*8, 0, 1000);
    line(anotherone*(-2), anotherone*3, 1300, 600);
    ellipse(anotherone*4, anotherone*.4, 444+anotherone, 444+100);
    anotherone=anotherone+8;
  }
}





