
/*********************************************/
/*          DANIEL PÉREZ ROMÁN               */
/*          ALINA HONHALA                    */
/*                                           */
/* Inclye los dos casos. Cambio con tecla 'c'*/
/* Teclas '+' y '-' cambia la vel.lineal     */
/* Tecla 'i' inicializa la escena            */
/* Tecla 'espacio' detiene la bola           */
/*********************************************/

//import peasy.*;

//PeasyCam cam;

PVector a = new PVector(0,0,0);
PVector v_angular = new PVector(0,0,0);
PVector v_lineal  = new PVector(0,0,0);

float radio = 70;
float delta_t = 0.4;
float w_giro = 0;
float ang_giro = 0;

PVector pos = new PVector(0,0,0);
PVector punto_bola = new PVector(0,radio,0);
PVector v_punto_bola = new PVector(0,0,0);

boolean caso = true;
int anchoBox = 1000;
int masa = 40;
PVector g = new PVector(0, -4.0, 0);


void setup(){
  size(438,600,P3D);
  background(0);
  //cam =new PeasyCam(this, 1300);
  smooth();
}

void update(){
  // v(t) + w(t)xr = P(t), siendo P(t)=0
  //Despejamos la ecuación y hallamos la componente 'z' de la vel.angular
  //v_punto_bola = v_angular.cross(punto_bola);
  w_giro = (v_lineal.x/punto_bola.y);
  //Se deduce entonces el vector director de la velocidad angular
  v_angular = new PVector(0,0,w_giro);
  
  v_lineal.sub(PVector.mult(a,delta_t));
  
  //Añadimos a la posición de la esfera la velocidad lineal
  pos.add(PVector.mult(v_lineal,delta_t));
  
  if(pos.x > anchoBox/2 || pos.x < -anchoBox/2) 
     applyForce(g);
  
  //Se incrementa el angulo de giro, multiplicando la magnitud de la v.angular por un incremento
  if(v_lineal.x >= 0)
    ang_giro += v_angular.mag() * delta_t; 
  else if(v_lineal.x < 0)
    ang_giro -= v_angular.mag() * delta_t;
  
}

void applyForce(PVector gravity) {
  PVector fuerza = gravity.get();
  fuerza.div(masa);
  a.add(PVector.mult(fuerza, delta_t));
}

void draw(){
 background(120,224,250);
 update(); 
 camera(0, 0, 1300, 0, 0, 0, 0, 1, 0);

  //Plano
  pushMatrix();
  if(caso)
  translate(0,radio+5, 0);
  else
  translate(0,-(radio+5), 0);
  
  stroke(0);
  strokeWeight(1);
  fill(91,12,159);
  box(anchoBox, 5, 200); 
  popMatrix();

  //Pelota
  pushMatrix();
  stroke(0);
  strokeWeight(0.5);
  if(caso)
  fill(171,98,235);
  else
  fill(223,45,68);
  
  translate(pos.x,pos.y,pos.z);
  
  if(caso)
  rotateZ(ang_giro); 
  else
  rotateZ(-ang_giro);
  
  sphere(radio); 
  popMatrix();
  
  //y le añadimos la vel.lineal ( 0 + vel.lineal)
  //v_punto_bola = v_angular.cross(punto_bola);
  v_punto_bola.add(v_lineal);
  
  pushMatrix();
  fill(0);
  textSize(30);
  text("Velocidad lineal: " + v_lineal, -250, 200); 
  text("Velocidad en el punto: " + v_punto_bola , -250, 250);
  text("Velocidad angular: " + v_angular , -250, 300);
  popMatrix(); 
  
  if(caso){
  textSize(40);
  text("CASO 1 ", -70, -200); 
  }
  else{
  textSize(40);
  fill(223,45,68);
  text("CASO 2", -70, -200); 
  }
   
}

void keyPressed(){
  
  if(key == '+')
    v_lineal.x += 1;
  if(key == '-')
    v_lineal.x -= 1;
  if(key == ' ')
     v_lineal.set(0,0,0);
  if(key == 'i'){
     pos.set(0,0,0);
     a.set(0,0,0);
     v_angular.set(0,0,0);
     v_lineal.set(0,0,0);
     w_giro = 0;
     ang_giro = 0;
     pos.set(0,0,0);
     punto_bola.set(0,radio,0);
     v_punto_bola.set(0,0,0);
  }
  if(key == 'c'){
     if(!caso)
       caso = true;
     else
       caso = false;
  }
    
}


