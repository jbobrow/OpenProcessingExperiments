
void setup(){
  
size(900,900);
background(0,0,0);
smooth();
noStroke();

}

void draw(){
translate(-50,-50);
//retângulo//
fill(255,255,255);
background(0,0,0);
//retangulos de cima//
rect(random(400,420),random(400,420), random(190,210),random(190,210));
rect(random(600,620),random(400,420), random(190,210),random(190,210));
rect(random(200,220),random(400,420), random(190,210),random(190,210));
//retangulos do meio//
rect(random(400,420),random(200,220), random(190,210),random(190,210));
rect(random(600,620),random(200,220), random(190,210),random(190,210));
rect(random(200,220),random(200,220), random(190,210),random(190,210));
//retangulos de baixo//
rect(random(400,420),random(600,620), random(190,210),random(190,210));
rect(random(600,620),random(600,620), random(190,210),random(190,210));
rect(random(200,220),random(600,620), random(190,210),random(190,210));

//fill(random(201),20,71);
fill(201,20,78);
ellipse(random(200,220), random(200,220),random(190,210),random(190,210));//da esquerda
ellipse(random(800,750), random(200,220),random(190,210),random(190,210));//da direita
ellipse(random(800,750), random(800,750),random(190,210),random(190,210));//esquerda de baixo
ellipse(random(200,220), random(800,820),random(190,210),random(190,210));//direita de baixo

//bola rosa do meio//
//fill(random(201),20,71);
fill(201,20,78);
ellipse(500,500, 300,300);

//bola branca entre meio rosa e bolinha//
fill(255,255,255);
ellipse(random(500,510), random(500,500), random(250,250), random(250,250));

//bolinha rosa entremeio brancos//
fill(201,20,78);
ellipse(random(500,510), random(500,500), random(100,100), random(100,100));

//bolinha branca do meio//
fill(255,255,255);
ellipse(505,500, 55,55);

//bolinha preta//
fill(0,0,0);
ellipse(505,500, 10,10);

}


