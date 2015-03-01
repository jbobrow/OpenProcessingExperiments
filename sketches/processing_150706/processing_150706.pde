
// Tiro parabólico - Alina Honhala

//EULER
PVector v_eu=new PVector(45,-90);
PVector p_eu=new PVector(0,600);

//HEUN
PVector v_heun=new PVector(45,-90);
PVector v_heun2=new PVector(0,0); //Velocidad anterior
PVector p_heun=new PVector(0,600);

//RK2
PVector v_rk=new PVector(45,-90);
PVector v_rkm=new PVector(0,0); //Velocidad en el pto medio
PVector p_rk=new PVector(0,600);

//Gravedad (eje y = 9.8), masa de las bolas y diferencial de tiempo
PVector g = new PVector(0,9.8);
float m=1.0;
float dt=0.4;

boolean iniciar = false;

void setup(){
  background(250,177,186);
  size(800,800);
  smooth();
  
}

void draw()
{
   text ("Pulsa 'ESPACIO' para comenzar.", 20, 20);
   text ("Morado - Euler", 20, 70);
   text ("Azul - Heun", 20, 90);
   text ("Amarillo - RK2", 20, 110);
  // Fuerza = masa * aceleración | F(gravedad) = m * g
  /* Entonces: g = F/m -> g = (m*a)/m -> g = a 
     Por lo que utilizamos 'g' como aceleración en el cálculo de la velocidad
     V = V + A · ∆(t) */
  
  
  //EULER | y(i+1) = y(i) + f(xi, yi) * dt
  /*Para que sea más estable, estimamos la velocidad antes de 
  calcular la posición: Euler semi implícito*/
  v_eu.x = v_eu.x + g.x * dt;
  v_eu.y = v_eu.y + g.y * dt;
  
  p_eu.x = p_eu.x + v_eu.x * dt;
  p_eu.y = p_eu.y + v_eu.y * dt;
  
  
  //HEUN | yº(i+1) = yi + f(xi, yi)*dt
  v_heun2.x = v_heun.x;
  v_heun2.y = v_heun.y;
  
  v_heun.x = v_heun.x + g.x * dt;
  v_heun.y = v_heun.y + g.y * dt;
  
  p_heun.x = p_heun.x + ((v_heun.x + v_heun2.x) / 2) * dt;
  p_heun.y = p_heun.y + ((v_heun.y + v_heun2.y) / 2) * dt;
  
  
  //RK2 | (derivada en pto. medio)
  /* f(pto medio) = f(xi, yi) + [f'(xi, yi)/2] * dt
     y(i+1) = yi + f(pto medio) * dt
  */
  v_rkm.x = v_rk.x + (g.x*dt)/2;
  v_rkm.y = v_rk.y + (g.y*dt)/2;
  
  v_rk.x = v_rk.x + g.x * dt;
  v_rk.y = v_rk.y + g.y * dt;
  
  p_rk.x = p_rk.x + v_rkm.x * dt;
  p_rk.y = p_rk.y + v_rkm.y * dt; 


  //Dibujo de las bolas
  
  pushMatrix(); //Euler - morado
  translate(p_eu.x, p_eu.y);
  fill(186,18,136);
  ellipse(0,0,20,20);
  popMatrix();
  
  pushMatrix(); //Heun - azul
  translate(p_heun.x, p_heun.y);
  fill(27,187,205);
  ellipse(0,0,25,25); //aumentamos el tamaño para que se vea por debajo de Rk2
  popMatrix();
  
  pushMatrix(); //Rk2 - amarillo 
  translate(p_rk.x, p_rk.y);
  fill(255,255,0);
  ellipse(0,0,20,20);
  popMatrix();
  
}


void keyPressed(){
   if(key == ' '){ //Inicializamos
     //EULER
    v_eu=new PVector(45,-90);
    p_eu=new PVector(0,600);

    //HEUN
    v_heun=new PVector(45,-90);
    v_heun2=new PVector(0,0); //Velocidad anterior
    p_heun=new PVector(0,600);

    //RK2
    v_rk=new PVector(45,-90);
    v_rkm=new PVector(0,0); //Velocidad en el pto medio
    p_rk=new PVector(0,600);
    
    setup();
   }
}




