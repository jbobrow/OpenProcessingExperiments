

//import processing.pdf.*;

float tamanho;

void setup() {

size(900, 900);
  //beginRecord(PDF, "rockstar.pdf");
  smooth();
  background(255,255,255);
  tamanho=0;
}

void draw() {
  // background(255,255,255);
  translate(400,400);

  fill(25,0,0,0);
  stroke(0,0,50);
  rotate( mouseX/60.0);
  ellipse(0,0,200,300 );

  //noFill();
  stroke(mouseY,0,0,50);
  rotate( mouseX/300.0);
  ellipse(mouseX,mouseY,300*tan(tamanho/300),300*tan(tamanho/500)  );
  tamanho=tamanho + 6;
  ellipse(mouseX,mouseY,100*sin(tamanho/200),100*sin(tamanho/200)  );
  tamanho=tamanho + 8;
  stroke(11,113,46);
  ellipse(mouseX,mouseY,200*cos(tamanho/50),200*cos(tamanho/50)  );
  tamanho=tamanho + 4;
  stroke(mouseX,11,0,0);

}

void mouseClicked() {
  //save("imagem.png");
  //endRecord();
  //exit();
}



