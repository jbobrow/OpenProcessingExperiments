

/*alba g.corral
 2008
 descripcion: pelota que se mueve y cambia de color 
 */
float  angulo = 4;
int tamanio=20 ;

float posx= 10; // posicion de mi pelota
float posy= 10;
float tam =50;

float inc = 0.0;//incremento de angulo

void setup(){
 // noStroke();
  frameRate(250);
  smooth();
  size (800,400);
  //cursor(CROSS); //modifica el puntero de raton a una cruz
  background(0);
  iniciar(0,random(height));
  smooth();
  noCursor();
}
void dibujaPelota(){
  inc += 0.1;
  fill(color ( random(255),255,255,random(155)));
  //float angle = sin(inc) / 10.0 ;
  float angle = sin(inc);
  float tamanio =map(angle,-2,5,-25,tam);
  rect (posx,posy,tamanio,tamanio);
}
void render(){

  posx = posx + 1;
  // posy = posy + 1;
  if ( posx > width ) iniciar(0,posy);
}
void iniciar(float xx, float yy){
  posx =xx;
  posy = yy;
  tam = random(100,500);
}
void draw(){
  // background(0);

  dibujarLinea();

 
  render();
  dibujaPelota();
  //line(1,1);
}
void mousePressed(){

  iniciar(mouseX,mouseY);
}

void mouseMoved() {
  fill(random(2),0);
  noStroke();
  rect(random(width),random(height),map(mouseX,50,width,0,50),map(mouseX,0,width,0,50));
}

void dibujarLinea() {
  if (mouseX != 0) {
    fill(color (55,5,random(255),70));
    pushMatrix();
    angulo =  angulo+ PI/200;
    stroke(0,20);
    strokeWeight(0);
    translate(mouseX,mouseY);
    rotate(angulo);
    rect(random(500),random(10),random(20),random(10));
    popMatrix();
  }


//void keyPressed() {

  if(key=='+') {
    tam++;
  }  
  if(key=='-') {
    tam--;
  }  
  if (key == 's' || key == 'S') {
    saveFrame("imaginarioscirculares-####.png");
    println("GRABAMOS:");
  }
}






