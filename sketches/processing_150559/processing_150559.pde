

/*************************

Alumno: Ignacio Dolz Monzó
Ejercicio: Cuerpos deformables. 
Simula el movimiento de una bandera con diferentes estructuras de modelo y estrctura. con la interaccion de las teclas es posible cambiar de modo para ver ocmo afecta.
Esta sometida a la fuerza del viento previamente calculada por normales y a la gravedad.
Asignatura: simulación. (Parte matematica)
Centro: Universidad de valencia Ingeniería multimedia

************************/

//import peasy.*;

//PeasyCam camera;
int cs1=35;
int sx1=20; //celdas de alto
int sy1=22; //celdas de ancho
int tipo=4;
float dt=0.3;
float RANDMAX=15;
PVector gravity= new PVector(0,0.8,0);

int tipotela=0;

Malla tela;

void setup(){
 
 tela= new Malla(sx1,sy1,cs1); 
 size(900,500,P3D);
 //camera= new PeasyCam(this,2000) //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
 
 noStroke();
 }
 
 void draw(){
  camera(0, 0, 2000, 0, 0, 0, 0, 1, 0);
  background(255);
  fill(0);
  text(" Pulsar los numero de 1 a 4 para cambiar de estructura ", -1000, -500, 0);
  if(tipo==1){
    fill(0);
   textSize(80);
  text(" MODELO STRUCTURED ", -700, -400, 0);
  
  }
  
  if(tipo==2){
    fill(0);
    textSize(80);
  text(" MODELO SHEAR ", -700, -400, 0);
  
  }
  
   if(tipo==3){
     fill(0);
    textSize(80);
  text(" MODELO SHEAR + STRUCTURED ", -700, -400, 0);
  
  }
  
   if(tipo==4){
     fill(0);
    textSize(80);
  text(" MODELO SHEAR + STRUCTURED + BEND ", -700 , -400, 0);
  
  }
  
  lights();
  smooth();
  tela.run();
 }
 
 void keyPressed(){
  if(key=='1')
   tipo=1;
  else if(key=='2') 
  tipo=2;
    else if(key=='3') 
  tipo=3;
    else if(key=='4') 
  tipo=4;
 else if(key=='b')
   tipotela=0;
 else if (key=='c')
 tipotela=1;
 }
//pagina 427 de libro phisics qnd simulations

class Malla{

  PVector [][] vel;
  PVector [][] vert;
  PVector [][] forces;
  PVector [][] acce;
  PVector VertexPos = new PVector(0,0,0);
  
  int sx;
  int sy;
  
  
  
  float masa;
  int m_directDistance; //distancia entre celdas = cs=tamaño de celda
  int m_AsaltDistance;//distancia entre diagonales
  
  float k= 0.5;
  float m_Damping= 0.5;
  PVector vDamp = new PVector (0,0,0);
  PVector wind;
  
Malla(int _sx,int _sy,int _cs){
    
    sx=_sx;
    sy=_sy;
    m_directDistance =_cs; //distancia entre celdas = cs=tamaño de celda
    m_AsaltDistance= (int) sqrt(2.0) * m_directDistance;//distancia entre diagonales
    
    acce=new PVector[sx][sy];
    vel= new PVector [sx][sy] ; //velocidad por vertice
    forces= new PVector[sx][sy];
    vert= new PVector [sx][sy];
    masa=0.8;
      
    for(int x=0; x<sx;x++)
      for(int y=0; y<sy;y++){
        forces[x][y]= new PVector (0,0,0);
        vel[x][y]= new PVector (0,0,0);
        acce[x][y]= new PVector(0,0,0);
       vert [x][y]= new PVector(y*m_directDistance,x*m_directDistance,0);
      }
    
  }
  
 void run() {
    update();
    display();
  }

  void update(){

   // wind= new PVector(0.22 + random(0,RANDMAX) ,0, 0.012 + random(0,RANDMAX)*0.2);


  PVector wind = new PVector(1.2 + random(-15,RANDMAX)*0.2, 0, 0.15 + random(-15,RANDMAX)*0.1);
  
 
        
    for(int x=0; x < sx;x++){
      for(int y=1; y < sy;y++){
      
  
         forces[x][y].set(0,0,0); //fuerzas cada vez a 0
         PVector VertexPos= vert[x][y]; //posicion del vertice que vamos a integrar
              forces[x][y].set(gravity);//añadimos la fuerza de la gravedad
         
         //vectores para el calculo proporcional ddel proiducto escalar entre el wind y el vectornormal del vertice
          PVector VWind = new PVector (0,0,0);
          PVector  VNormal= new PVector (0,0,0);
         
         /* MODELO DE VIENTO CON LAS NORMALES */
          
          //elegimos los vertices vecinos dentro de la matriz
          //condiciones para que no de error de un vertice fuera de la matriz
          
          if( y+1 < sy && y-1 >= 0 ){ //condicion de que esta dentro por la parte superior este dentro de la malla y no se salga por la parte inferior
          
            VWind = PVector.sub(VertexPos,vert[x][y-1]);  //calculamos la resta con el vecino de abajo
            VNormal = PVector.sub(VertexPos,vert[x][y+1]); //calculamos la resta con el vecino de arriba
          }
          else if(y+1 >= sy && x-1>=0){   //condicion de que esta dentro por la parte superior y por la parte izquierda haya un vecino
            VWind = PVector.sub(VertexPos,vert[x][y-1]); //calculamos la resta con el vecino de abajo
            VNormal = PVector.sub(VertexPos,vert[x-1][y]); //calculamos la resta con el vecino de la izquierda
          }
          else if(y+1 >= sy && x-1<0){  //condicion de que esta dentro por la parte superior y por la parte derecha haya un vecino
            VWind = PVector.sub(VertexPos,vert[x][y-1]);  //calculamos la resta con el vecino de abajo
            VNormal = PVector.sub(VertexPos,vert[x+1][y]); //calculamos la resta con el vecino de la derecha
          }
          else if(y-1 <0 && x-1>=0){  //concion de que tiene un vecino abajo y otro a la izquierda
            VWind = PVector.sub(VertexPos,vert[x][y+1]); //calculamos la resta con el vecino de arriba
            VNormal = PVector.sub(VertexPos,vert[x-1][y]); //calculamos la resta con el vecino de la izquierda
          }
          else if(y-1 <0 && x-1<0){ //condicion de que tiene un vecino en la parte de abajo y otro a la izquierda
            VWind = PVector.sub(VertexPos,vert[x][y+1]); //calculamos la resta con el vecino de arriba
            VNormal = PVector.sub(VertexPos,vert[x+1][y]); //calculamos la resta con el vecino de derecha
          }
          
          
          //calculamos la normal del vertice
          PVector normalVert = new PVector (0,0,0);
          normalVert = VWind.cross(VNormal);  //calculo del producto vestorial de los dos vectores
          normalVert.normalize(); //normalizamos el vector normal del vertice
          
          //A la normal del vertice le aplicamos en modulo del viento
          float modWind = wind.mag();
          normalVert.mult(modWind);
          
          //aplicamos la fuerza del viento proporcional al producto escalar de la normal del vertice y del viento calculandola mediante el producto escalar
          float prodEscWind = normalVert.dot(wind);
          normalVert.mult(prodEscWind);
          forces[x][y].add(normalVert);
         if(tipo==1){
       //añadimos la fuerzas de los vecinos //modelo Structured
           forces[x][y] = PVector.add(forces[x][y], getForce(x-1,y,VertexPos,m_directDistance,k));
           forces[x][y] = PVector.add(forces[x][y], getForce(x+1,y,VertexPos,m_directDistance,k));
           forces[x][y] = PVector.add(forces[x][y], getForce(x,y-1,VertexPos,m_directDistance,k));
           forces[x][y] = PVector.add(forces[x][y], getForce(x,y+1,VertexPos,m_directDistance,k));
         }
         
         else if(tipo==2){
         
         //añadimos las fuerdas diagonales //modelo Shear
            forces[x][y] = PVector.add(forces[x][y], getForce(x-1,y-1,VertexPos,m_AsaltDistance,k));
            forces[x][y] = PVector.add(forces[x][y], getForce(x-1,y+1,VertexPos,m_AsaltDistance,k));
            forces[x][y] = PVector.add(forces[x][y], getForce(x+1,y-1,VertexPos,m_AsaltDistance,k));
            forces[x][y] = PVector.add(forces[x][y], getForce(x+1,y+1,VertexPos,m_AsaltDistance,k));
         }
        
         
         else if(tipo==3){
           //añadimos la fuerzas de los vecinos //modelo Structured
           forces[x][y] = PVector.add(forces[x][y], getForce(x-1,y,VertexPos,m_directDistance,k));
           forces[x][y] = PVector.add(forces[x][y], getForce(x+1,y,VertexPos,m_directDistance,k));
           forces[x][y] = PVector.add(forces[x][y], getForce(x,y-1,VertexPos,m_directDistance,k));
           forces[x][y] = PVector.add(forces[x][y], getForce(x,y+1,VertexPos,m_directDistance,k));
           
            //añadimos las fuerdas diagonales //modelo Shear
            forces[x][y] = PVector.add(forces[x][y], getForce(x-1,y-1,VertexPos,m_AsaltDistance,k));
            forces[x][y] = PVector.add(forces[x][y], getForce(x-1,y+1,VertexPos,m_AsaltDistance,k));
            forces[x][y] = PVector.add(forces[x][y], getForce(x+1,y-1,VertexPos,m_AsaltDistance,k));
            forces[x][y] = PVector.add(forces[x][y], getForce(x+1,y+1,VertexPos,m_AsaltDistance,k));
         }
    
      else if(tipo==4){
                //añadimos la fuerzas de los vecinos //modelo Structured
           forces[x][y] = PVector.add(forces[x][y], getForce(x-1,y,VertexPos,m_directDistance,k));
           forces[x][y] = PVector.add(forces[x][y], getForce(x+1,y,VertexPos,m_directDistance,k));
           forces[x][y] = PVector.add(forces[x][y], getForce(x,y-1,VertexPos,m_directDistance,k));
           forces[x][y] = PVector.add(forces[x][y], getForce(x,y+1,VertexPos,m_directDistance,k));
           
            //añadimos las fuerdas diagonales //modelo Shear
            forces[x][y] = PVector.add(forces[x][y], getForce(x-1,y-1,VertexPos,m_AsaltDistance,k));
            forces[x][y] = PVector.add(forces[x][y], getForce(x-1,y+1,VertexPos,m_AsaltDistance,k));
            forces[x][y] = PVector.add(forces[x][y], getForce(x+1,y-1,VertexPos,m_AsaltDistance,k));
            forces[x][y] = PVector.add(forces[x][y], getForce(x+1,y+1,VertexPos,m_AsaltDistance,k));
            
            //añadimos las fuerdas diagonales //modelo BEND
            forces[x][y] = PVector.add(forces[x][y], getForce(x-2,y,VertexPos,m_directDistance*2,k));
            forces[x][y] = PVector.add(forces[x][y], getForce(x+2,y,VertexPos,m_directDistance*2,k));
            forces[x][y] = PVector.add(forces[x][y], getForce(x,y-2,VertexPos,m_directDistance*2,k));
            forces[x][y] = PVector.add(forces[x][y], getForce(x,y+2,VertexPos,m_directDistance*2,k));
            
      }

        vDamp.set(vel[x][y].x,vel[x][y].y,vel[x][y].z);
        vDamp.mult(-m_Damping);
        
        forces[x][y]= PVector.add(forces[x][y], vDamp); //aplicamos las fuerzas F= M*A
        forces[x][y].div(masa);
        
        
        acce[x][y].add(forces[x][y]);
        vel[x][y].add(PVector.mult(acce[x][y],dt));
        vert[x][y].add(PVector.mult(vel[x][y],dt));
        acce[x][y].set(0,0,0); //la acce a 0 en cada pasada de update
        
      }      
  }
      
      
 

  }

PVector getForce(int vx, int vy, PVector Vert, int distance, float k){
  
  PVector Fuerzas= new PVector(0,0,0);//vector fuerzas
  PVector Vecino= new PVector(0,0,0);//vector del vertice vecino
  PVector Princip= new PVector(0,0,0);//vertice principal que acumula la fuerza
  PVector amort= new PVector(0,0,0);//vector de amortiguacion 
  PVector dist= new PVector(0,0,0);  //vector distancia entre los vecinos
  float elong=0;//elongacion
  float modDist=0;
  
  
  if(vx>=0 && vx<sx && vy>=0 && vy<sy){ 
    
    Vecino.set(vert[vx][vy]);
    Princip.set(Vert);
    dist= PVector.sub(Princip,Vecino);
    modDist= dist.mag();
    elong = modDist - distance;
    dist.normalize();
    Fuerzas= PVector.mult(dist,-k*elong);
  }
  else 
  
  Fuerzas.set(0,0,0);
  
  return Fuerzas;
      
   
  }
  
  
  void display(){
    noStroke();
    fill(15,255,20);
    
    //2D 
    //translate(width/2 - (sx*m_directDistance/2),height/2 - (sy*m_directDistance/2),0);
    //3D
    strokeWeight(1);
     for(int i=0; i<sx-1; i++){       
       beginShape(QUAD_STRIP);
         for(int j=0; j<sy-1; j++){
           PVector p = vert[i][j];
           PVector p1 = vert[i+1][j];
           vertex(p.x,p.y,p.z);
           vertex(p1.x,p1.y,p1.z);          
         }
       endShape();
      }  
      //hasta de la bandera
      strokeWeight(30);
      stroke(30);
      line(0,0,0,0,sx*m_directDistance*2, 6);
    }
  }



