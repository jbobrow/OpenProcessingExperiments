
// IDEP 2010
///Ana Paula Carvalho
////Modificando


float angle = 1; // Current angle
float speed = 0.001; // velocidade que desenha as linhas
float radius = 500.0; // Tamanho circulo
float sx = 5.0;
float sy = 4.0;
float hh = 0;
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
       sy=random(1);
       sx = 5.0;
       
       println("key 1 : sx:   "+sx +"  sy:" + sy);
    }
    if(key == '3') {
      noLoop();
    }
  }


     //fill(0, 15);
     //rect(0, 0, width, height);
     
     
    angle += speed; // Update the 
    println("angle:;"+angle);

    //pos circulo
    float x =  width/2 + sin(angle) * radius;
    float y = height/2 + cos(angle) * radius;

    // Set the position of the large circles based on the
    // new position of the small circle
    float x2 = x + cos(angle * sx) * radius;
    float y2 = y + sin(angle * sy) * radius;
    //line 
    if(hh<100){
      hh+=1;
    } 
    else{
      hh--;
    }

    col = color(9,9,9+hh,15);
    stroke(devuelveColor(),hh);
    fill(0,0);
    ellipse(x,y,x2,y2);
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

 

