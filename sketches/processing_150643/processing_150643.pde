
/**
 * Simple Pimball
 * 
 * Pablo Casanova y Juan Carlos Leal
 */
 
Tablero pim;
ArrayList<Particle> bolas;

int i=0;
int cont=0;
float dt = 0.2;
float radius = 15;
float score = 0;
PVector vInicial=new PVector(0,0);
PImage img;

//SeparaciÃ³n de las paredes con la ventana
float sep = 15;

void setup() {
  size(800,500);
  
  // Campo: Extremos de la pantalla
  pim = new Tablero();
  
  // Bolas
  bolas = new ArrayList<Particle>();
  
  PVector pos1 = new PVector(width-35,height-30);

  Particle p = new Particle(pos1, radius);
  bolas.add(p); 
 
}

void draw() {
  background(0);
  fill(255);
  
  // Actualiza las partÃ­culas: colisiones y dibujado
  for (int i=0;i<bolas.size();i++){
    Particle p = bolas.get(i);
    p.update();
    for (int j=i+1;j<bolas.size();j++){
      Particle q = bolas.get(j);
      p.collisionChecking(q);
    }
    p.display();
  }
  fill(255,0,0);
  text("Score= " + score, 20, 10);
 
 // Calcula Colisiones y dibuja el Pimball 
  pim.update();
  pim.display(); 
   
}

void mousePressed()
{
  /*
  PVector pos = new PVector(mouseX, mouseY);
  Particle p = new Particle(pos, radius,img);
  bolas.add(p);
  */
}

void keyPressed()
{
  if(key==' ')
  {
    if(vInicial.y>-130)
    vInicial.y -=15;
  }
  if (key=='b')
  {
     PVector pos1 = new PVector(width-35,height-30);
      Particle p1 = new Particle(pos1, radius);
      bolas.add(p1); 
      cont++;
  }
  if (key == CODED) 
  {
    if (keyCode == LEFT) 
    {       
      pim.petacoUp(1);
      pim.update();
    }
    if (keyCode == RIGHT) 
    {
      pim.petacoUp(2);
      pim.update();
    }
  }
}
void keyReleased()
{
    if(key==' ')
    {
      Particle p = bolas.get(cont);
      p.velocity.set(vInicial);
      vInicial.set(0,0);
      p.gravity.set(0,6);
      p.update();
      p.display();
     
    }
    if (key == CODED) 
  {
    if (keyCode == LEFT) 
    {      
      pim.petacoDown(1);
      pim.update();
    }
    if (keyCode == RIGHT) 
    {    
      pim.petacoDown(2);
      pim.update();
    }
  }
      
    
    
}
/*
 * Clase para describir las diferentes partÃ­culas
 *
**/

class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float masa = 2;
  float radius;
  PVector gravity = new PVector(0,0);

  Particle(PVector pos, float r){
    acceleration = new PVector(0, 0);
    location = pos.get();
    velocity = new PVector(0, 0);
    //velocity = new PVector(random(-8,8), random(5,8));
    radius = r;
 
    i++;   
  }

  //F = m * a
  void applyForce(PVector f){
    PVector force = PVector.div(f.get(), masa);
    acceleration.add(force);
  }

  void run(){
    update();
    display();
  }  
  
  //MÃ©todo para actualizar la posiciÃ³n
  void update(){
    applyForce(gravity);    
    velocity.add(PVector.mult(acceleration, dt));
    location.add(PVector.mult(velocity, dt));
   
    acceleration = new PVector(0,0); 
  }
    //Colisiones partÃ­cula-partÃ­cula
  void collisionChecking(Particle p){
    PVector dif = PVector.sub(location, p.location);
    PVector d= new PVector(0,0);
    d.set(dif);
    float distancia = d.mag();
    
    //Check Collision
    if(distancia < (this.radius + p.radius)){
      // Calculamos la velocidad normal
      PVector w1 = new PVector(0,0);
      w1.set(d);
      w1.normalize();
      PVector vNormal1 = PVector.mult(w1,this.velocity.dot(d)/distancia);
      PVector vNormal2 = PVector.mult(w1,p.velocity.dot(d)/distancia);
      
      // Calculamos la velocidad tangencial
      PVector vTang1 = PVector.sub(velocity, vNormal1);
      PVector vTang2 = PVector.sub(p.velocity, vNormal2);
     
      // RestituciÃ³n
      float L1 = ((this.radius + p.radius) - distancia);
     
      PVector vAux =PVector.sub(vNormal1, vNormal2);
      float vrel =  vAux.mag();
      
      //Vector distancia perpendicular entre las dos partÃ­culas
      this.location = PVector.add(location,PVector.mult(vNormal1, (-L1/vrel)));
      p.location = PVector.add(p.location,PVector.mult(vNormal2, (-L1/vrel)));
      
      //Componentes de la velocidad normal despuÃ©s del impacto
      float mx1 = this.masa;
      float mx2 = p.masa;
      float ux1 = (vNormal1.dot(d)/distancia);
      float ux2 = (vNormal2.dot(d)/distancia);
      float vx1 = ((((mx1-mx2)*ux1)+(2*mx2*ux2))/(mx1+mx2));
      float vx2 = ((((mx2-mx1)*ux2)+(2*mx1*ux1))/(mx1+mx2));
      
      //Vectores de la velocidad normal despuÃ©s de la colisiÃ³n
      vNormal1 = PVector.mult(w1, vx1);
      vNormal2 = PVector.mult(w1, vx2);
      
      //Velocidad final
      this.velocity = PVector.add(vNormal1, vTang1);
      p.velocity = PVector.add(vNormal2, vTang2);
    }     
  }
  //MÃ©todo para el display
  void display(){
    
    stroke(120);
    strokeWeight(1);
    fill(255,180,0);
    ellipse(location.x, location.y, radius*2, radius*2);  
  }
  
  
}
class Plano{
  PVector pto1;  //Principio Plano
  PVector pto2;  //Final Plano
  PVector plano;  
  PVector normal;
  float Kr= 0.6;
  boolean puntuable=false;
  
  Plano(float x1, float y1, float x2, float y2, boolean scoreable)
  {
    pto1 = new PVector(x1,y1);
    pto2 = new PVector(x2,y2);
    plano = PVector.sub(pto2, pto1);
    puntuable = scoreable;
    normal =  new PVector(-plano.y, plano.x);
    normal.normalize();
  }
  
  // Colisiones con el plano (pto1, pto2)
  void checkCollisions(Particle p)
  {
    //Comienzo del plano y final del plano
    PVector xp1 = PVector.sub(pto1, p.location);
    PVector xp2 = PVector.sub(pto2, p.location);
    PVector dist;
    PVector planoUnit = new PVector (0,0);
    
    //Calculamos el modulo del plano
    float modPlano = plano.mag();
    //Proyeccion de los vecotres en el vector Plano
    float proj1= xp1.dot(plano)/modPlano;
    float proj2= xp2.dot(plano)/modPlano;
    planoUnit.set(plano);
    planoUnit.normalize();
    //plano.normalize(planoUnit);
    //Vector distancia perpendicular entre el objeto y el plano
    dist = PVector.add(xp1,PVector.mult(planoUnit,proj1*(-1)));
   
    // Check collision
    if(abs(proj1) < modPlano && abs(proj2) < modPlano){
      if(dist.mag() < p.radius){   
        PVector dirNorm = normal.get();
        if(dirNorm.dot(p.velocity)>0)
          dirNorm.mult(-1);
         
        //Reposicionamiento 
        float angle = PVector.angleBetween(p.velocity,plano);
        float deltaS = (p.radius+dist.dot(dirNorm))/sin(angle);
        PVector desp1 = PVector.mult(dirNorm,deltaS);
        p.location.add(desp1);
        if(puntuable)
        {
          score += 10;
          Kr=1.4;
        }
        //Calculo de Velocidad de Salida
        float nv = normal.dot(p.velocity);
        PVector vN = PVector.mult(normal,nv);
        PVector vT = PVector.sub(p.velocity,vN); 
        p.velocity = PVector.sub(vT,PVector.mult(vN,Kr));
        
       
      }  
    }
   
  }
}
// Tablero del Pimball
class Tablero {
  
  ArrayList<Plano> planos;
  Petaco palancaI, palancaD;

  Tablero() // Constructor: Crea el pimball
  {
    int maxPlanos = 6;
    planos = new ArrayList<Plano>();
    /*
    for (int i = 0; i < maxPlanos; i++){
      Plano p = new Plano(random(0, width/2), random(0, height-sep),random(width/2, width-sep),random(0, height-sep));
      
      planos.add(p);
    }
    */
    //Creamos los planos de la ventana
    Plano arriba = new Plano(sep+55, sep, width-60, sep,false);
    Plano derecha = new Plano(width-sep, sep+90, width-sep, height-sep,false);
    Plano derecha2 = new Plano(width-60, sep+90, width-60, height-sep,false);
    //Plano abajo = new Plano(width-sep, height-sep, width-60, height-sep,false);
    Plano izquierda = new Plano(sep, sep+90, sep, height-70,false);
    Plano diagonal = new Plano(width-sep,sep+90,width-60,sep,false);
    Plano diagonal2 = new Plano(sep,sep+90,sep+55,sep,false);
    
    Plano p4 = new Plano(sep,height-70,(width-55)/2-80,height-30,false);
    Plano p5 = new Plano((width-55)/2+80,height-30,width-60,height-70,false);
    
    //ObstaculoIzquierda 
    Plano oi1 = new Plano(sep+90,height-150,sep+90,height-300,false);
    Plano oi2 = new Plano(sep+90,height-300,sep+240,height-110,true);
    Plano oi3 = new Plano(sep+90,height-150,sep+240,height-110,false);
    planos.add(oi1);
    planos.add(oi2);
    planos.add(oi3);
    
    //ObstaculoDerecha 
    Plano od1 = new Plano(width-150,height-150,width-150,height-300,false);
    Plano od2 = new Plano(width-150,height-300,width-300,height-110,true);
    Plano od3 = new Plano(width-150,height-150,width-300,height-110,false);
    planos.add(od1);
    planos.add(od2);
    planos.add(od3);
    
    //PALANCA IZQUIERDA
    palancaI = new Petaco((width-55)/2-80,height-30,(width-55)/2-10,height-15);
    //PALANCA DERECHA
    palancaD = new Petaco((width-55)/2+80,height-30,(width-55)/2+10,height-15);
    
    
    //AÃ±adimos los planos al ArrayList  
    planos.add(arriba);
    planos.add(derecha);
    planos.add(derecha2);
    planos.add(diagonal);
    planos.add(diagonal2);
    //planos.add(abajo);
    planos.add(izquierda);
 
    planos.add(p4);
    planos.add(p5);
  }
  void petacoUp (int side)
  {
    if(side==1)
      palancaI.getUp();
    else
      palancaD.getUp();
  }
  
  void petacoDown (int side)
  {
    if(side==1)
      palancaI.getDown();
   else
      palancaD.getDown();
  }
  void update()
  {
    palancaI.update();  
    palancaD.update(); 
    for (int i = planos.size()-1; i >= 0; i--) {
       Plano p = planos.get(i);
       for (int j = 0; j < bolas.size(); j++){
          Particle b = bolas.get(j);
          p.checkCollisions(b);
          palancaI.update();  
          palancaD.update();  
       }
    }
  }
  
  void display()
  {
      stroke(255);
      fill(255);
      strokeWeight(1);  // Beastly
      for (int i = 0; i < planos.size(); i++){
        Plano p = planos.get(i);
        if (p.puntuable)
        {
          stroke(255,0,0);
          strokeWeight(2);  
        }
        else
        {
          stroke(255);
          fill(255);
          strokeWeight(1);
        }
          
        line(p.pto1.x, p.pto1.y, p.pto2.x, p.pto2.y);
      }
      palancaI.display();
      palancaD.display();
  }
  class Petaco{
    Plano pet;
    float y_up;
    float y_down;
  
    Petaco(float x_ini, float y_ini, float x_fin, float y_fin)
    {
      pet = new Plano(x_ini, y_ini,x_fin, y_fin,true);
      y_up = y_fin-30;
      y_down = y_fin;
    }
      
    void update()
    {
       for (int i=0;i<bolas.size();i++){
          Particle b = bolas.get(i);
          pet.checkCollisions(b);  
       }
    }
  
    void getUp(){
      pet.pto2.y = y_up;
      changeNormal();
    }
    
    void getDown(){
      pet.pto2.y = y_down;
      changeNormal();
    }
    void changeNormal(){
      PVector normal_aux = PVector.sub(pet.pto2, pet.pto1);
      pet.normal =  new PVector(-normal_aux.y, normal_aux.x);
      pet.normal.normalize();
    }
    void display()
    {
        stroke(0,0,255);
        strokeWeight(3);
        line(pet.pto1.x, pet.pto1.y, pet.pto2.x, pet.pto2.y);
    }
  }
}


