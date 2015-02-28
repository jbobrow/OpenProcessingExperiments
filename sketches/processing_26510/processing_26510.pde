
ArrayList lista_part=new ArrayList();
PImage invader;

int conta=0;
int ancho=200;
int alto=100;
int numeroParticulas=100;
float rojo;
float verde;
float azul;
float fondo;
float desplazamiento;

void setup(){
  size(ancho,alto,P2D);  
  invader=loadImage("invader1.png");
  inicializar(); 
}

void inicializar(){  
  rojo=random(10,20);
  verde=random(10,20);
  azul=random(10,20);
  fondo=random(100,250);
  desplazamiento=random(1,5);
  
  for(int i=0;i<lista_part.size();i++)
     lista_part.remove(i);  
  lista_part.clear();
          
  for(int i=0;i<numeroParticulas;i++)
     lista_part.add(new Particula(new PVector(random(0,ancho),random(0,alto)),100));

  Particula temp=(Particula)lista_part.get(0);
  temp.pegada=true;
}

void update(){

}

void draw(){
  background(0);  
  for(int i=0;i<lista_part.size();i++){
         Particula temp=(Particula)lista_part.get(i);   
         for(int j=0;j<lista_part.size();j++){
            Particula temp2=(Particula)lista_part.get(j);
            if(temp2.pegada)
               if(temp2.posicion.dist(temp.posicion)<10.){
                  temp2.numeroVecinas++;
                  temp.pegada=true;
                  }
            }
     if(temp.pegada==false){
       temp.posicion.x+=random(-desplazamiento,desplazamiento);
       temp.posicion.y+=random(-desplazamiento,desplazamiento);
       }     
     Particula centro=(Particula)lista_part.get(0); 
     float distancia_centro=temp.posicion.dist(centro.posicion);   
     fill((rojo*distancia_centro)%255,(verde*distancia_centro)%255,(azul*distancia_centro)%255);
  
     image(invader,temp.posicion.x,temp.posicion.y);
    
     boundary_control(temp);
  }

  conta=0;
  for(int i=0;i<lista_part.size();i++){
         Particula temp=(Particula)lista_part.get(i); 
         if(temp.pegada)conta++;
         if(conta>=numeroParticulas)
             inicializar();
   }
}

void boundary_control(Particula temp){
    if(temp.posicion.x<0)temp.posicion.x++;
     if(ancho<temp.posicion.x)temp.posicion.x--;
     if(temp.posicion.y<0)temp.posicion.y++;
     if(alto<temp.posicion.y)temp.posicion.y--;

}

class Particula{
  PVector posicion;
  PVector velocidad;
  float tiempo_de_vida;
  boolean pegada;
  int numeroVecinas;
  
  Particula(PVector pos,float t){
    posicion=pos;
    tiempo_de_vida=t;
    pegada=false;  
    numeroVecinas=0;
    }
  
}


