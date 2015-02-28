
float pedacoDeUmSegundo = 2*PI/60;
PImage limao;

void setup() {
  size(225, 225);
  background(255, 255, 255, 0);
  limao = loadImage("limao.jpg");
}

void draw() {
  background(255, 255, 255, 0);

  image(limao, 0,0);
  // ponteiro dos segundos 
  pushMatrix();
  translate(width/2, height/2);
  rotate( second() * pedacoDeUmSegundo );
  stroke(random(100), abs(255*sin(millis()/1000.0)), 0);
  strokeWeight(5);
  line(0, 0, 0, -width/2 + 15);
  popMatrix();

  // ponteiro dos minutos
  pushMatrix();
 translate(width/2, height/2);
  rotate( minute() * pedacoDeUmSegundo );
  stroke(200, abs(255*sin(millis()/10000.0)),57);
  strokeWeight(5);
  line(0, 0, 0, -width/2 + 15);
  popMatrix();
  
  // ponteiro das horas
  pushMatrix();
 translate(width/2, height/2);
  rotate( hour() *2*PI/12); 
  stroke(random(15), abs(255*sin(millis()/10000.0)) , 16);
  strokeWeight(5);
  line(0, 0, 0, -width/2 + 15);
  popMatrix();
  
}



