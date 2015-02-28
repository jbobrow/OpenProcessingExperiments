
float x;
float y;
float x1;
float y1;
color bgcolor;

void setup() {

  size(400, 400);
  bgcolor = color(0);
  background(bgcolor);
  stroke(255);
  
}

void draw() {

  x = random(0,width);//le da a la var x un azar desde 0 hasta el anchode la pantalla
  y = random(0,height);
  y1 = random(0,height);
  x1 = random(0,width);
  line(y,x1,y1,x);//coordenadas x y de la pantalla, centro 0=arriba, 

}

void keyPressed() {

  background(bgcolor);
  
}
