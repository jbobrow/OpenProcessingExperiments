
//Plano inclinado - Alina Honhala

//Fuerzas
PVector ftang = new PVector(0,0);
PVector froz = new PVector(0,0);
PVector ftotal = new PVector(0,0);

//EULER
PVector v_eu = new PVector(0,0);
PVector p_eu= new PVector(0,0);
//HEUN
PVector v_heun = new PVector(0,0);
PVector v_heun2 = new PVector(0,0);
PVector p_heun= new PVector(0,0);
//RK2
PVector v_rk = new PVector(0,0);
PVector v_rkm = new PVector(0,0);
PVector p_rk = new PVector(0,0);

//Gravedad, masa de las bolas, diferencial de tiempo
//Cte rozamiento, angulo del plano, aceleraciÃ�Â³n
float dt=0.2;
float m=1.0;
float deg=radians(30);
float K=0.1;
float g=-9.8;
PVector acel = new PVector(0,0);

PVector vinit= new PVector(0,0);

void setup()
{
    size(1000,600);
    noStroke();
    smooth();
}

void calcFuerzas()
{
    //F = m*g*sin(angulo) -> Fuerza tangencial
    float modulo_ftang=m*g*sin(deg);
    ftang.x=modulo_ftang * cos(deg);
    ftang.y=modulo_ftang * sin(deg);

    //F = Ã¢ï¿½ï¿½k*v -> Fuerza de rozamiento
    froz.x= (-K) * vinit.x;
    froz.y= (-K) * vinit.y;
  
    //F.total
    ftotal.x = ftang.x + froz.x;
    ftotal.y = ftang.y + froz.y;
  
    //F = m * a | Calculamos la aceleraciÃ�Â³n
    acel.x = ftotal.x / m;
    acel.y = ftotal.y / m;
}

void draw()
{   
    
    background(9,4,81);
    fill(27,187,205);
    text("Pulse 'ESPACIO' para empezar.", 50, 50);
    calcFuerzas();

        ////// Euler ///////

        p_eu.x = p_eu.x + v_eu.x * dt;
        p_eu.y = p_eu.y + v_eu.y * dt;

        v_eu.x = v_eu.x + acel.x * dt;
        v_eu.y = v_eu.y + acel.y * dt;

        vinit.x=v_eu.x;
        vinit.y=v_eu.y;
  
  //Dibujamos la bola
    pushMatrix();
      translate(width/2,height/2);
      fill(27,187,205);
      translate(p_eu.x,-p_eu.y);
      rotate(-deg);
      ellipse(-20,-20,40,40);
    popMatrix();

    //Pintamos el plano
    pushMatrix();
      stroke(186,18,136);
      strokeWeight(1);
      translate(width/2, height/2);
      rotate(-deg);
      line(-1000,0,1000,0);
    popMatrix();

}

void keyPressed(){
  if(key==' '){
    ftang = new PVector(0,0);
    froz = new PVector(0,0);
    ftotal = new PVector(0,0);
    
    v_eu = new PVector(0,0);
    p_eu= new PVector(0,0);
    
    acel = new PVector(0,0);
    vinit= new PVector(0,0);
    
    setup();
  }
}

