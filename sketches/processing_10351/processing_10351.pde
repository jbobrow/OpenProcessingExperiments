
// IDEP 2010
///Ana Paula Carvalho
////Modificando


float angle = 1; // Current angle
float speed = 0.009; // velocidade que desenha as linhas
float radius = 120.0; // Tamanho circulo
float sx = 4.0;
float sy = 4.0;
float hh = 100;
color col;
void setup() {
  size(800, 600);
  noStroke();
  background(0);
  smooth();
}

void draw() {
  // EVENTOS
  if(keyPressed){
    if(key == '1') {
      float x =  width/2 + sin(angle) * radius;
      float y = height/2 + cos(angle) * radius;
      //parametros circulo principal
      ellipse(x, y, 1, 1); // Draw smaller circle
      // Set the position of the large circles based on the
      // new position of the small circle
      float x3 = x + cos(angle * sx) * radius;
      float y3 = y + sin(angle * sy) * radius;
      fill(0,0);
      ellipse(x3, y3, 30, 30); // Draw larger circle
      println("key 1 : sx:   "+sx +"  sy:" + sy);
    }
    if(key == '2') {
      sx = 5.0;
      sy = 5.0;
      println("key 1 : sx:   "+sx +"  sy:" + sy);
    }
    if(key == '3') {
      sx = 6.0;
      sy = 6.0;
      println("key 1 : sx:   "+sx +"  sy:" + sy);
    }
    if(key == '4') {
      sx = 7.0;
      sy = 7.0;
      println("key 1 : sx:   "+sx +"  sy:" + sy);
    }
    if(key == '5') {
      noStroke();
      fill(0, 30);
      rect(0, 0, width, height);
    }
    if(key == '6') {
      noLoop();  
    }
  }





  angle += speed; // Update the 
  println("angle:;"+angle);

  //pos circulo
  float x =  width/2 + sin(angle) * radius;
  float y = height/2 + cos(angle) * radius;

  //parametros circulo principal
  fill(0);
  ellipse(x, y, 1, 1); // Draw smaller circle


  // Set the position of the large circles based on the
  // new position of the small circle
  float x2 = x + cos(angle * sx) * radius;
  float y2 = y + sin(angle * sy) * radius;
  ellipse(x2, y2, 1, 1); // Draw larger circle

  //line 
  if(hh<100){
    hh+=1;
  } 
  else{
    hh--;
  }

  col = color(9,9,9+hh,15);
  stroke(devuelveColor(),hh);
  line(x,y,x2,y2);
}


void limpia(){
  background(0);
}

color devuelveColor() {
  float rojo = random (0,900);
  float verde = random(0,900);
  float azul = random(0,900);
  return color(rojo,verde,azul);
}




