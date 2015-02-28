
//ELIMINAR EL RESTO DE LOS COMENTARIOS PARA ENVIAR MENSAJES
/*
import oscP5.*;
import netP5.*;
OscP5 oscp5;
NetAddress direcSC;
*/
int val1, val2, diam, cambio;
float px, py, px2, py2, long1, long2;

void setup() {
  size(800, 400);
  background(0);
/*
  oscp5 = new OscP5(this, 4445);
  direcSC = new NetAddress("127.0.0.1", 57120);
*/
}

void draw() {
  fill(0, 2);
  noStroke();
  rect(0, 0, width, height);
  
  cambio=int(random(8,16));
  
  frameRate(cambio);

  val1 = int(random(1, 3));
  val2 = int(random(1, 2));

  strokeWeight(0.5);
  noStroke();
  if (val1==2) {
    long1 = random(10, 50);
    px = random(width-long1);
    py = random(height-long1);
    //dibujar
    fill(random(255), 0, random(255));
    stroke(255);
    rect(px, py, long1, long1);
    //mensaje
    /*
    OscMessage mensajeSC2 = new OscMessage("/freqSC2");
    mensajeSC2.add(px);
    mensajeSC2.add(py);
    mensajeSC2.add(long1);
    mensajeSC2.add(val1);
    oscp5.send(mensajeSC2, direcSC);
    */
  }
  stroke(255);
  if (val1==1) {
    long2 = random(50, 100);
    px2 = random(width-long2);
    py2 = random(height-long2);
    //dibujar
    fill(random(255),50);
    rect(px2, py2, long2, long2);
    //mensaje
    /*
    OscMessage mensajeSC = new OscMessage("/freqSC");
    mensajeSC.add(px2);
    mensajeSC.add(py2);
    mensajeSC.add(long2*0.02);
    mensajeSC.add(val1);
    oscp5.send(mensajeSC, direcSC);
    */
  }
}


