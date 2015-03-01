
// A simple Plane and Particle class

class Plano{
  PVector pto1;  
  PVector pto2; 
  PVector plano;  
  PVector normal;
  float Kr= 0.5;
  
  boolean puntuacion = true;
  
  
  Plano(float x1, float y1, float x2, float y2, boolean punt)
  {
    pto1 = new PVector(x1,y1);
    pto2 = new PVector(x2,y2);
    plano = PVector.sub(pto2, pto1);
    normal =  new PVector(-plano.y, plano.x);
    normal.normalize();
    puntuacion = punt;
  }
  
  // Colisiones con el plano (pto1, pto2)
  void checkCollisions(Particle p)
  {
    //Comienzo del plano y final del plano
    PVector xp1 = PVector.sub(pto1,p.location);//pos - p1 del plano
    PVector xp2 = PVector.sub(pto2, p.location);
    PVector dist;
    PVector planoUnit = new PVector (0,0);
    
    //Calculamos el modulo del plano para obtener las proyeccionea
    float modPlano = plano.mag();
    //Proyeccion de los vectores sobre el vector Plano
    float proj1= xp1.dot(plano)/modPlano;
    float proj2= xp2.dot(plano)/modPlano;
    //Obtenemos el plano normalizado para calcular distancia entre proyecciones
    plano.normalize(planoUnit);
    //Vector distancia perpendicular entre el objeto y el plano
    dist = PVector.add(xp1,PVector.mult(planoUnit,proj1*(-1)));
   
    //DETECCIÓN: Si las proyecciones son menores que el modulo del plano, colisiona
    if(abs(proj1) < modPlano && abs(proj2) < modPlano){
      //Si la distancia es menor que el radio de la bola, se tocan
      if(dist.mag() < radius){   
        PVector dirNorm = normal.get();
        //Si la normal * la vel es mayor que 0, cambiamos el signo de la normal (lado opuesto)
        if(dirNorm.dot(p.velocity)>0)
          dirNorm.mult(-1);
         
        //REPOSICIONAMIENTO
        float angle = PVector.angleBetween(p.velocity,plano);
        float deltaS = (radius+dist.dot(dirNorm))/sin(angle);
        PVector desp1 = PVector.mult(dirNorm,deltaS);
        p.location.add(desp1);
       
        
        //VELOCIDAD DE SALIDA:
        float nv = normal.dot(p.velocity); 
        PVector vN = PVector.mult(normal,nv); //VELOCIDAD NORMAL, PARALELA A LA NORMAL DEL PLANO
        PVector vT = PVector.sub(p.velocity,vN); //VELOCIDAD TANGENCIAL
        p.velocity = PVector.sub(vT,PVector.mult(vN,Kr));

        if(puntuacion){
          puntos +=10;
          Kr = 1.2;
        }
      }  
    }
    //Casos en los que las particulas rebotan en los extremos del plano
    else if (abs(xp1.mag()) <radius){
    }
    else if (abs(xp2.mag())<radius){
    }   
  }
  void ballCollision(Particle b1, Particle b2){
    float xbit = b1.location.x - b2.location.x;
    float ybit = b1.location.y - b2.location.y;
    PVector dif = new PVector(xbit, ybit);
    PVector jcn = new PVector(-ybit, xbit);
    
    //DETECCIÓN:
    float dist = dif.mag(); //distancia entre los centros
    if(dist < b1.radius + b2.radius){
      
      float difDot = dif.dot(dif);
      float jcnDot = jcn.dot(jcn);
      
      float vel1DOTdif = b1.velocity.dot(dif);
      PVector vT1 = PVector.mult(dif, (vel1DOTdif/difDot));
      float vel2DOTdif = b2.velocity.dot(dif);
      PVector vT2 = PVector.mult(dif, (vel2DOTdif/difDot));
      
      float vel1DOTjcn = b1.velocity.dot(jcn);
      PVector vN1 = PVector.mult(jcn, (vel1DOTjcn/jcnDot));
      float vel2DOTjcn = b2.velocity.dot(jcn);
      PVector vN2 = PVector.mult(jcn, (vel2DOTjcn/jcnDot));
      
      //REPOSICIONAMIENTO:
      float absVel = vT1.mag() + vT2.mag();
      float overlap = (b1.radius + b2.radius) - dist;
      PVector vel1_overlap = PVector.mult(b1.velocity, (overlap / absVel));
      PVector vel2_overlap = PVector.mult(b2.velocity, (overlap / absVel));
      b1.location.sub(vel1_overlap);
      b2.location.sub(vel2_overlap);
      
      //NUEVA VELOCIDAD:
      float sumMass = b1.mass + b2.mass;
      float dMass = b1.mass - b2.mass;
      float dMassAmort1 = b1.mass - Kr*b2.mass;
      float dMassAmort2 = b2.mass - Kr*b1.mass;
      
      //PVector numerador1v1 = PVector.mult(vT1, dMass);
      PVector numerador1v1 = PVector.mult(vT1, dMassAmort1);
      //PVector numerador2v1 = PVector.mult(vT2, (2*b2.mass));
      PVector numerador2v1 = PVector.mult(vT2, (b2.mass + Kr*b2.mass));
      PVector numeradorv1 = PVector.add(numerador1v1, numerador2v1);
      PVector nuevaT1 = PVector.div(numeradorv1, sumMass);
      
      //PVector numerador1v2 = PVector.mult(vT2, -dMass);
      PVector numerador1v2 = PVector.mult(vT2, -dMassAmort2);
      //PVector numerador2v2 = PVector.mult(vT1, (2*b1.mass));
      PVector numerador2v2 = PVector.mult(vT1, (b1.mass + Kr*b1.mass));
      PVector numeradorv2 = PVector.add(numerador1v2, numerador2v2);
      PVector nuevaT2 = PVector.div(numeradorv2, sumMass);
      
      b1.velocity.x = nuevaT1.x + vN1.x;
      b1.velocity.y = nuevaT1.y + vN1.y;
      b2.velocity.x = nuevaT2.x + vN2.x;
      b2.velocity.y = nuevaT2.y + vN2.y;
      
    }
    
  }
}

// Tablero del Pimball
class Tablero {
  int a;
  ArrayList<Plano> planos;
  PVector nada = new PVector(0,0);

  Tablero() // Constructor: Crea el pimball
  {
    planos = new ArrayList<Plano>();
    //Situamos los planos que conforman el Pimball
    Plano arriba = new Plano(200, 50, width-200, 50, false);
    Plano derecha = new Plano(width-150, 100, width-150, height-100, false);
    Plano tubo = new Plano(width-180, 120, width-180, height-120, false);
    Plano izquierda = new Plano(150, 100, 150, height-100, false);
    Plano diagonalDer = new Plano(width-150, 100, width-200,50, false);
    Plano diagonalIzq = new Plano(150, 100, 200, 50, false);
    Plano sueloIzq = new Plano(150,height-100,260,height-50, false);
    Plano sueloDer = new Plano(width-150,height-100,width-260,height-50, false);
    
    Plano muro1 = new Plano(width/2-25,height-380,width/2+25,height-380, true);
    Plano muro2 = new Plano(width/2-25,height-380,width/2-50,height-370, true);
    Plano muro3 = new Plano(width/2+25,height-380,width/2+50,height-370, true);
    
    //Scores
    Plano scoreIzq = new Plano(width/2-20,height-440,width/2-62,height-480, true);
    Plano scoreDer = new Plano(width/2+20,height-440,width/2+62,height-480, true);
    
    //Resortes 
    Plano ResIzq1 = new Plano(200,height-130,200,height-170,false);
    Plano ResIzq2 = new Plano(200,height-170,240,height-110,true);
    Plano ResIzq3 = new Plano(200,height-130,240,height-110,false);

    
    Plano ResDer1 = new Plano(width-220,height-130,width-220,height-170,false);
    Plano ResDer2 = new Plano(width-220,height-170,width-260,height-110,true);
    Plano ResDer3 = new Plano(width-220,height-130,width-260,height-110,false);
    
    Plano petIzq = new Plano(260,height-50,290,height-38,true);
    Plano petDer = new Plano(width-260,height-50,width-290,height-38,true);
    
    //Añadimos los planos al ArrayList  
    planos.add(arriba);
    planos.add(derecha);
    planos.add(tubo);
    planos.add(diagonalDer);
    planos.add(diagonalIzq);
    planos.add(izquierda);
    planos.add(sueloIzq);
    planos.add(sueloDer);
    
    planos.add(muro1);
    planos.add(muro2);
    planos.add(muro3);
    
    planos.add(scoreIzq);
    planos.add(scoreDer);
    
    planos.add(ResIzq1);
    planos.add(ResIzq2);
    planos.add(ResIzq3);
    
    planos.add(ResDer1);
    planos.add(ResDer2);
    planos.add(ResDer3);
    
    planos.add(petIzq);
    planos.add(petDer);
  }
    
  void update()
  {
    for (int i = planos.size()-1; i >= 0; i--) {
       Plano p = planos.get(i);
       for (int j = 0; j < bolas.size(); j++){
          Particle b = bolas.get(j);
          p.checkCollisions(b);
          
          for(a = bolas.size()-1; a>=1; a--){
            Particle b1 = bolas.get(a);
            Particle b2 = bolas.get(a-1);
            Particle b3 = new Particle(nada, radius);
            if(a < bolas.size()-1){
              b3 = bolas.get(a+1);
            }
            
            p.ballCollision(b1, b2);
            p.ballCollision(b2, b3);
            p.ballCollision(b1, b3);
            
          }
         
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
        
        if (p.puntuacion)
          stroke(255,50,0);
        else
          stroke(255);
        
        fill(239,179,4);
        line(p.pto1.x, p.pto1.y, p.pto2.x, p.pto2.y);
      }
  }
  
    
}

