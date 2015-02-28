
float variavel;



void setup(){
  size(800,800);
  background(255,255,255);
  smooth();
  variavel= 0;
}

//frame
void draw() {
  strokeWeight(variavel/2000);
  //line(100,400,100 + variavel,20 );
  variavel= variavel +5;
  variavel= variavel +8;
 //line(100,500, 100 , 500 + variavel/2 );
  stroke(139,219,71+ variavel/10000);
  //noFill();
  fill(0,0,100, 5);
  ellipse(400,400,100 + variavel,20 + variavel/8);
  variavel= variavel +5;
   strokeWeight(2);
  //ellipse(200,200,50 + variavel,350 + variavel/2);
  variavel= variavel +10;

}


void mouseClicked() {
  background(255);
 // save("imagem.png");
 // endRecord();
  //exit();
}


