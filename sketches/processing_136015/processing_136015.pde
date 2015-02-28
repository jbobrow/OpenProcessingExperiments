
/*Trabalho 1 - Sistema de Particulas - calculo numerico - 1s2014 - IMECC - Unicamp
 
 Prof. Martinez
 
 TODO: Escrever um Latex explicando o algoritmo e as consideracoes e a teoria ...
 
 Grupo:
 Caio Augusto
 Lucas Garcia
 Caique Conde
 Henrique
 
 Descricao:Levando em conta a lei universal da gravitacao ne Newton, dado um sistema com n particulas
 e suas respectivas condicoes iniciais, "simule" o comportamento de interecao entre as particulas do sistema no dominio do tempo
 
 obs:as particulas sao os circulos azuis, a reta preta eh o vetor velocidade e a vermelha a forca resultante em cada particula
 
 
 Obs:Com essas condicoes iniciais queremos simular um planeta com dois "sois"
 Leia mais:http://galileospendulum.org/2011/09/15/a-planet-with-two-suns/
 
 */
/*numero de particulas*/

int n = 10;
/*Delta tempo (para calcular as medições),obs:quanto menor melhor eh a aproximacao*/

float dt = 0.017;
/*constante universal da gravitacao*/

float G = 200;

/*se mostra ou nao o traco das particulas*/
boolean marks = true;

massa[] massas = new massa[n];

void setup(){
  size(840,620);
  background(255);
  frameRate((int)1/dt);
  println((int)(1/dt));
  for(int i = 0;i<n;i++){
    massas[i]=new massa();
    massas[i].px=random(width);
    massas[i].py=random(height);
    massas[i].m=100;
    massas[i].vx=random(-30,30);
    massas[i].vy=random(-30,30);
  }
}


void draw(){
  novaPos();
  desenhaMassas();
}

void mousePressed(){
  marks=!marks;
  background(255);
}
void desenhaMassas(){
  if(marks){
  background(255);
  }
  fill(255);
  fill(0,0,255);
  for(int i=0;i<n;i++){
    stroke(200);
    ellipse(massas[i].px,massas[i].py,15,15);
    if(marks){
    stroke(0);
    line(massas[i].px,massas[i].py,massas[i].px+0.5*massas[i].vx,massas[i].py+0.5*massas[i].vy);
    stroke(255,0,0);
    line(massas[i].px,massas[i].py,massas[i].px+0.13*massas[i].fx,massas[i].py+0.13*massas[i].fy);  
    }  
}
}

class massa{
  float px,py,vx,vy,ax,ay,fx,fy,m;
  /*TODO: tratar pra que as massas nao saiam da tela*/
  void atualizaPos(){
    ax=fx/m;
    ay=fy/m;
    vx+=dt*ax;
    vy+=dt*ay;
    px=px+vx*dt;
    px=fix(px,width);
    py=py+vy*dt;
    py=fix(py,height);
    }
}

float fix(float val, float lim){
  if(val>lim){
    return val%lim;
  }
  else if(val<0){
    return (lim+val);
  }
  else{
    return val;
  }
}

void novaPos(){
  float fijx,fijy,d;
  for(int i=0;i<n;i++){
    massas[i].fx=0;
    massas[i].fy=0;
    for(int j=0;j<n;j++){
      if(j!=i){
        d=sqrt(pow((massas[j].px-massas[i].px),2)+pow((massas[j].py-massas[i].py),2));
        fijx=((massas[j].px-massas[i].px)*G*massas[j].m*massas[i].m)/pow(d,3);
        fijy=((massas[j].py-massas[i].py)*G*massas[j].m*massas[i].m)/pow(d,3);
        massas[i].fx+=fijx;
        massas[i].fy+=fijy;
      }
    }
  }
  for(int i = 0;i<n;i++){
    massas[i].atualizaPos();
  }
}
