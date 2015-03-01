
PVector location;
PVector u,vel,aux;
int i;
float x,y;
float dt=1/60.0;
PVector[] tramos= new PVector[10];
boolean first_time;

void setup(){
size(600,600);
location=new PVector(50,height/2);
vel=new PVector(50,height/2);
crearTramos();

}

void draw(){
   
  background(255);
  stroke(0);
  
  checkTramos();
  update();
  display();
  pushMatrix();
  translate(50, height/2);
  for(i=1;i<tramos.length;i++){
    line(tramos[i-1].x,tramos[i-1].y,tramos[i].x,tramos[i].y);
  }    
    popMatrix();
    x+=1;
}

//actualizar la posición acorde con la fórmula de la aceleración constante
void update(){
location.x+=(u.x+vel.x*dt);
location.y+=(u.y+vel.y*dt);
}

void display(){
 stroke(0);
 fill(175);
 ellipseMode(CENTER);
 ellipse(location.x,location.y,16,16);
  }
    
void checkTramos(){
  int c;
  c = 0;
  for(int i=0;i<=8;i++){
    if(location.x>=tramos[i+1].x){
      vel=PVector.sub(tramos[i+1],tramos[i]); //calcula la direccion del tramo
      vel.normalize();
      u = vel;
      if (i>0){ 
      c = checkAceleracion(i);}
      if(tramos[i].y<tramos[i+1].y){ // si baja aumenta la aceleracion
        vel.mult(7+c*3);
        u.mult(0.5);}
      else{vel.mult(0.5-c*0.2);
        }
      }
     } 
   }
//crea las posiciones tramos a partir de la función de seno y los guarda en un array  
void crearTramos(){
  for(i=0;i<tramos.length;i++){
    aux=new PVector(x,y);
    x+=50;
    y=80*sin((PI/80)*x);
    tramos[i]=aux;}
  }
  
  //comprueba si hay dos bajadas o dos subidas seguidas
  int checkAceleracion(int i){
    int cont = 0;
  if((tramos[i-1].y-tramos[i].y)>0 && (tramos[i].y-tramos[i+1].y)>0){
    cont =1;
  }else if((tramos[i-1].y-tramos[i].y)<0 && (tramos[i].y-tramos[i+1].y)<0){
  cont=1;
  }
  return cont;
}


