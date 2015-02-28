
float tamanho;

void setup() {
  size(1000,1000);
  smooth();
  background(255,255,255);
  tamanho=0;

}

void draw() {
 // background(255,255,255);
 
 noStroke();
 fill(100,200,50);

 ellipse  (width-mouseY,mouseX,30,30);
  ellipse(mouseY,mouseX,30,30);
  

}

void mouseClicked() {
  background(255);
 // save("imagem.png");
 // endRecord();
  //exit();
}


