
/*alba g.corral
 2008
 descripcion: pelota que se mueve y cambia de color 
 */


float posx= 4; // posicion de mi pelota
float posy= 7;
float tam =100;
float x = 250;   // x location of square
float y = 0;     // y location of square

float speed = 0;   // speed of square

// A new variable, for gravity (i.e. acceleration).   
// We use a relatively small number (0.1) because this accelerations accumulates over time, increasing the speed.   
// Try changing this number to 2.0 and see what happens.
float gravity = 0.1; 

float inc = 0.0;//incremento de angulo

void setup(){
  smooth();
  size (500,500);
  cursor(CROSS); //modifica el puntero de raton a una cruz
  background(255);
  iniciar(0,random(height));
  smooth();
}
void dibujaPelota(){
  inc += 3.1;
  fill(color(random(115),96,32));
  //float angle = sin(inc) / 10.0 ;
  float angle = sin(inc);
  float tamanio =map(angle,-3,1,10,tam);
  rect (posx,posy,tamanio,tamanio);
   
   rectMode(CENTER);
  rect(x,y,tamanio,tamanio);
  
  // Add speed to location.
  y = y + speed;
  
  // Add gravity to speed.
  speed = speed + gravity;
  
  // If square reaches the bottom
  // Reverse speed
  if (y > height) {
    // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).  
    // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
    speed = speed * -0.95;  
  }
}
void render(){

  posx = posx + 3;
  // posy = posy + 1;
  if ( posx > width ) iniciar(0,posy);
}
void iniciar(float xx, float yy){
  posx =xx;
  posy = yy;
  tam = random(50,200);
}
void draw(){
  // background(0);
  render();
  dibujaPelota();
}
void mousePressed(){

  iniciar(mouseX,mouseY);
}

void keyPressed() {

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






