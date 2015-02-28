
float tamano=6;
PImage img;
PImage imgu;
int segundos;
color colorrecordado=color(0,0,0);
color c=color(0,0,0);

void setup(){
  size (600, 600);
  background(255);
  strokeWeight(6);
  img = loadImage("lisa.jpg");
  fill(0);
  textSize(25);
  text("Dibuja la mona lisa!",200,25);
  }
 void draw() {
  noStroke();
  fill(c);
  rect(5,5,25,25);
  int segundos = second();
  if (mousePressed && (mouseButton == LEFT)) {
      strokeWeight(tamano);   
    stroke(c); 
      line (pmouseX, pmouseY, mouseX, mouseY);
  }else if (mousePressed && (mouseButton == RIGHT)) {
      c=color(random(255),random(255),random(255));
  }
  if (segundos>=50){
      fill(c);
      textSize(20);
      text("Comprueba si se parece, pulsa 'l'",175,50);
  }
  
}

void keyPressed() {
  if (key==' ') {
    background(255);
  }
  if (key=='+') {
    tamano=tamano+1;
  }
  if (key=='-') {
    tamano=tamano-1;
    if (tamano<=1) {
        tamano=1;
    }
  }
  if (key=='l') {
    save("imagenusuario.jpg");
    imgu = loadImage("data:descarga.png");
    img.resize(300, 300);
    imgu.resize(300, 300);
    background(255);
    image(img, 0, 150);
    image(imgu,300,150);
    fill(0);
    textSize(25);
    text("Se parecen??",400,80);
  }
  if (key=='t') { 
    fill(255);
    rect(490,570,600,600);
    fill(0);
    textSize(15);
    text("son las "+hour()+":"+minute(),500,590);
  }
  if (key=='0') { 
    c=color(0,0,0);
  }
  if (key=='1') { 
    c=color(255,0,0);
  }
  if (key=='2') { 
    c=color(0,255,0);
  }
  if (key=='3') { 
    c=color(0,0,255);
  }
  if (key=='4') { 
    c=color(255,255,0);
  }
  if (key=='5') { 
    c=color(255,0,255);
  }
  if (key=='6') { 
    c=color(0,255,255);
  }
  if (key=='7') { 
    c=color(#00cc00);
  }
  if (key=='8') { 
    c=color(100,100,0);
  }
  if (key=='9') { 
    c=color(255,255,255);
  }
  if (key=='m') { 
    colorrecordado=c;
  }
  if (key=='n') { 
    c=colorrecordado;
  }
}


