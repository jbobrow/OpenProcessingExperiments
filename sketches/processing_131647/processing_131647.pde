
//umbrella

PFont fonte;


void setup() {
  size(700, 300);
  background(0);


  //texto
  fonte = createFont("ARBERKLEY", 48); 
  textFont(fonte);
}

int a = 0;


void draw() {
  if (mouseX< width/2) {
    background(3, 16, 67);
  }
  if (mouseX> width/2) {

    background(194, 250, 246);
  }



  //pub
  fill(234, 136, 14);
  rect(450, 150, 250, 150);
  for (int i = 150; i < 300; i = i+20) {
    line(450, i, 700, i);
  }
  fill(126, 65, 18);
  rect(550, 200, 150, 120);
  strokeWeight(2.0);
  line(650, 200, 650, 300);

  //placa
  if (mouseX<width/2)
    fill(random(245+mouseX/4), 12, 12);
  else
    fill(0, 0, 0);
  strokeWeight(1.0);
  rect(520, 100, 180, 50);

  //guarda chuva
  strokeWeight(1.0);
  fill(229, 211, 9);
  triangle(a+50, 290, a+150, 240, a+250, 290);
  a=(a+1)%width ;
  for (int i = 50; i < 250; i = i+50) {
    line(a+150, 240, a+i, 290);
  }
  strokeWeight(3.0);
  line(a+150, 290, a+150, 300);


  //texto

  if (mouseX<width/2) {
    textAlign(RIGHT);
    fill (9, 188, 19);
    text("OPEN", width-1, height-150);
  }
  if (mouseX>width/2){
    textAlign(RIGHT);
    fill (255,0,0);
    text("CLOSE", width-1, height-150);
  }
}

