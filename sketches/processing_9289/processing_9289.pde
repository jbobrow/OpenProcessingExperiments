
size(600, 600);
background (255);
smooth();
noStroke();

int numeroLineas = 11;
int numeroColumnas = 11;

colorMode(HSB);
for (int i=0; i<numeroLineas; i++) {
  for (int j=0; j<numeroColumnas; j++) {
    float x = map(i, 0, numeroColumnas-1, 0, width); 
    float y = map(j, 0, numeroLineas-1, 0, height);
    float h = map(i, 0, numeroColumnas-1, 0, 60); // h ira subiendo de 10 a 60 (de rojo a verde segun color HSB)
    
    pushMatrix();
    translate (x, y);

    // Rectangulo fondo
    fill(h,360,360);
    rect(0,0,60,60);

    //triangulos verdes oscuros
    noStroke();
    fill(0,0,0,150);

    beginShape();
    vertex(0,20);
    vertex(10,30);
    vertex(0,40);
    endShape(CLOSE);

    beginShape();
    vertex(20,0);
    vertex(30,10);
    vertex(40,0);
    endShape(CLOSE);

    beginShape();
    vertex(60,20);
    vertex(60,40);
    vertex(50,30);
    endShape(CLOSE);

    beginShape();
    vertex(20,60);
    vertex(40,60);
    vertex(30,50);
    endShape(CLOSE);

    //rectangulos verdes
    fill(0,0,0,100);
    beginShape();
    vertex(0,20);
    vertex(10,30);
    vertex(30,10);
    vertex(20,0);
    endShape(CLOSE);

    beginShape();
    vertex(30,10);
    vertex(40,0);
    vertex(60,20);
    vertex(50,30);
    endShape(CLOSE);

    beginShape();
    vertex(50,30);
    vertex(60,40);
    vertex(40,60);
    vertex(30,50);
    endShape(CLOSE);

    beginShape();
    vertex(20,60);
    vertex(30,50);
    vertex(10,30);
    vertex(0,40);
    endShape(CLOSE);

    // Linias oscuras
    stroke(75,75,75,100);
    strokeWeight(1);
    line(0,0,60,60);
    line(60,0,0,60);

    //Linias blancas
    stroke(220,220,220,100);
    strokeWeight(1);
    line(0,30,30,0);
    line(30,0,60,30);
    line(60,30,30,60);
    line(30,60,0,30);

    popMatrix();

  }
}



